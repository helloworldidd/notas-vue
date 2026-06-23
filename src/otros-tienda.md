# Tienda

```sh
npm install vue-router pinia axios bootstrap bootstrap-icons pinia-plugin-persistedstate
```

```sh
npm install -D eslint eslint-plugin-vue vitest @vue/test-utils jsdom
```



Estructura final

```sh
src/
│
├── assets/
├── components/
├── composables/
├── router/
│   └── index.js
│
├── services/
│   ├── productApi.js
│   ├── authApi.js
│   └── orderApi.js
│
├── stores/
│   ├── authStore.js
│   ├── cartStore.js
│   ├── productStore.js
│   ├── favoriteStore.js
│   └── orderStore.js
│
├── views/
│   ├── HomeView.vue
│   ├── ProductsView.vue
│   ├── ProductDetailView.vue
│   ├── CartView.vue
│   ├── CheckoutView.vue
│   ├── LoginView.vue
│   ├── RegisterView.vue
│   └── DashboardView.vue
│
├── App.vue
└── main.js
```




```sh
mkdir src\assets,src\components,src\composables,src\router,src\services,src\stores,src\views -Force

ni src\router\index.js -ItemType File -Force

ni src\services\productApi.js -ItemType File -Force
ni src\services\authApi.js -ItemType File -Force
ni src\services\orderApi.js -ItemType File -Force

ni src\stores\authStore.js -ItemType File -Force
ni src\stores\cartStore.js -ItemType File -Force
ni src\stores\productStore.js -ItemType File -Force
ni src\stores\favoriteStore.js -ItemType File -Force
ni src\stores\orderStore.js -ItemType File -Force

ni src\views\HomeView.vue -ItemType File -Force
ni src\views\ProductsView.vue -ItemType File -Force
ni src\views\ProductDetailView.vue -ItemType File -Force
ni src\views\CartView.vue -ItemType File -Force
ni src\views\CheckoutView.vue -ItemType File -Force
ni src\views\LoginView.vue -ItemType File -Force
ni src\views\RegisterView.vue -ItemType File -Force
ni src\views\DashboardView.vue -ItemType File -Force
```





<br>
<br>
<br>
<br>
<br>
<br>

```
# crear-base-tienda-vue.ps1

$base = "src"

# Crear carpetas
$folders = @(
  "$base/assets",
  "$base/components",
  "$base/composables",
  "$base/router",
  "$base/services",
  "$base/stores",
  "$base/views"
)

foreach ($folder in $folders) {
  New-Item -ItemType Directory -Path $folder -Force | Out-Null
}

# main.js
@'
import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap-icons/font/bootstrap-icons.css'

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')
'@ | Set-Content "$base/main.js" -Encoding UTF8

# App.vue
@'
<script setup>
</script>

<template>
  <header class="container py-3">
    <nav class="d-flex gap-3">
      <RouterLink to="/">Home</RouterLink>
      <RouterLink to="/productos">Productos</RouterLink>
      <RouterLink to="/carrito">Carrito</RouterLink>
      <RouterLink to="/login">Login</RouterLink>
      <RouterLink to="/dashboard">Dashboard</RouterLink>
    </nav>
  </header>

  <main class="container py-4">
    <RouterView />
  </main>
</template>
'@ | Set-Content "$base/App.vue" -Encoding UTF8

# router/index.js
@'
import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../views/HomeView.vue'
import ProductsView from '../views/ProductsView.vue'
import ProductDetailView from '../views/ProductDetailView.vue'
import CartView from '../views/CartView.vue'
import CheckoutView from '../views/CheckoutView.vue'
import LoginView from '../views/LoginView.vue'
import RegisterView from '../views/RegisterView.vue'
import DashboardView from '../views/DashboardView.vue'

import { useAuthStore } from '../stores/authStore'

const routes = [
  { path: '/', name: 'home', component: HomeView },
  { path: '/productos', name: 'products', component: ProductsView },
  { path: '/productos/:id', name: 'product-detail', component: ProductDetailView },
  { path: '/carrito', name: 'cart', component: CartView },
  { path: '/checkout', name: 'checkout', component: CheckoutView, meta: { requiresAuth: true } },
  { path: '/login', name: 'login', component: LoginView },
  { path: '/registro', name: 'register', component: RegisterView },
  { path: '/dashboard', name: 'dashboard', component: DashboardView, meta: { requiresAuth: true } }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to) => {
  const authStore = useAuthStore()

  if (to.meta.requiresAuth && !authStore.isAuthenticated) {
    return '/login'
  }
})

export default router
'@ | Set-Content "$base/router/index.js" -Encoding UTF8

# services
@'
import axios from 'axios'

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000'

export const getProducts = async () => {
  const { data } = await axios.get(`${API_URL}/products`)
  return data
}

export const getProductById = async (id) => {
  const { data } = await axios.get(`${API_URL}/products/${id}`)
  return data
}
'@ | Set-Content "$base/services/productApi.js" -Encoding UTF8

@'
export const loginUser = async (email, password) => {
  return {
    id: 1,
    name: 'Usuario Demo',
    email,
    token: 'demo-token'
  }
}
'@ | Set-Content "$base/services/authApi.js" -Encoding UTF8

@'
export const createOrder = async (order) => {
  return {
    id: Date.now(),
    ...order,
    status: 'created'
  }
}
'@ | Set-Content "$base/services/orderApi.js" -Encoding UTF8

# stores
@'
import { defineStore } from 'pinia'
import { loginUser } from '../services/authApi'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null,
    token: null
  }),

  getters: {
    isAuthenticated: (state) => !!state.token
  },

  actions: {
    async login(email, password) {
      const userData = await loginUser(email, password)

      this.user = userData
      this.token = userData.token
    },

    logout() {
      this.user = null
      this.token = null
    }
  }
})
'@ | Set-Content "$base/stores/authStore.js" -Encoding UTF8

@'
import { defineStore } from 'pinia'

export const useCartStore = defineStore('cart', {
  state: () => ({
    items: []
  }),

  getters: {
    totalItems: (state) => state.items.reduce((acc, item) => acc + item.quantity, 0),

    totalPrice: (state) =>
      state.items.reduce((acc, item) => acc + item.price * item.quantity, 0)
  },

  actions: {
    addToCart(product) {
      const existingProduct = this.items.find((item) => item.id === product.id)

      if (existingProduct) {
        existingProduct.quantity++
      } else {
        this.items.push({
          ...product,
          quantity: 1
        })
      }
    },

    removeFromCart(id) {
      this.items = this.items.filter((item) => item.id !== id)
    },

    clearCart() {
      this.items = []
    }
  }
})
'@ | Set-Content "$base/stores/cartStore.js" -Encoding UTF8

@'
import { defineStore } from 'pinia'
import { getProducts, getProductById } from '../services/productApi'

export const useProductStore = defineStore('product', {
  state: () => ({
    products: [],
    selectedProduct: null,
    loading: false,
    error: null
  }),

  actions: {
    async fetchProducts() {
      this.loading = true

      try {
        this.products = await getProducts()
      } catch (error) {
        this.error = 'No se pudieron cargar los productos'
      } finally {
        this.loading = false
      }
    },

    async fetchProductById(id) {
      this.loading = true

      try {
        this.selectedProduct = await getProductById(id)
      } catch (error) {
        this.error = 'No se pudo cargar el producto'
      } finally {
        this.loading = false
      }
    }
  }
})
'@ | Set-Content "$base/stores/productStore.js" -Encoding UTF8

@'
import { defineStore } from 'pinia'

export const useFavoriteStore = defineStore('favorite', {
  state: () => ({
    favorites: []
  }),

  actions: {
    toggleFavorite(product) {
      const exists = this.favorites.some((item) => item.id === product.id)

      if (exists) {
        this.favorites = this.favorites.filter((item) => item.id !== product.id)
      } else {
        this.favorites.push(product)
      }
    }
  }
})
'@ | Set-Content "$base/stores/favoriteStore.js" -Encoding UTF8

@'
import { defineStore } from 'pinia'
import { createOrder } from '../services/orderApi'

export const useOrderStore = defineStore('order', {
  state: () => ({
    orders: []
  }),

  actions: {
    async addOrder(order) {
      const newOrder = await createOrder(order)
      this.orders.push(newOrder)
    }
  }
})
'@ | Set-Content "$base/stores/orderStore.js" -Encoding UTF8

# views
@'
<template>
  <section>
    <h1>Tienda Online</h1>
    <p>Bienvenido a la tienda creada con Vue 3, Router y Pinia.</p>

    <RouterLink class="btn btn-primary" to="/productos">
      Ver productos
    </RouterLink>
  </section>
</template>
'@ | Set-Content "$base/views/HomeView.vue" -Encoding UTF8

@'
<script setup>
import { onMounted } from 'vue'
import { useProductStore } from '../stores/productStore'
import { useCartStore } from '../stores/cartStore'

const productStore = useProductStore()
const cartStore = useCartStore()

onMounted(() => {
  productStore.fetchProducts()
})
</script>

<template>
  <section>
    <h1>Productos</h1>

    <p v-if="productStore.loading">Cargando productos...</p>
    <p v-if="productStore.error">{{ productStore.error }}</p>

    <div class="row">
      <div
        v-for="product in productStore.products"
        :key="product.id"
        class="col-md-4 mb-3"
      >
        <div class="card h-100">
          <div class="card-body">
            <h5>{{ product.name }}</h5>
            <p>${{ product.price }}</p>

            <RouterLink
              class="btn btn-outline-primary btn-sm me-2"
              :to="`/productos/${product.id}`"
            >
              Ver detalle
            </RouterLink>

            <button
              class="btn btn-primary btn-sm"
              @click="cartStore.addToCart(product)"
            >
              Agregar
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
'@ | Set-Content "$base/views/ProductsView.vue" -Encoding UTF8

@'
<script setup>
import { onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { useProductStore } from '../stores/productStore'
import { useCartStore } from '../stores/cartStore'

const route = useRoute()
const productStore = useProductStore()
const cartStore = useCartStore()

onMounted(() => {
  productStore.fetchProductById(route.params.id)
})
</script>

<template>
  <section>
    <p v-if="productStore.loading">Cargando producto...</p>

    <div v-if="productStore.selectedProduct">
      <h1>{{ productStore.selectedProduct.name }}</h1>
      <p>Precio: ${{ productStore.selectedProduct.price }}</p>
      <p>{{ productStore.selectedProduct.description }}</p>

      <button
        class="btn btn-primary"
        @click="cartStore.addToCart(productStore.selectedProduct)"
      >
        Agregar al carrito
      </button>
    </div>
  </section>
</template>
'@ | Set-Content "$base/views/ProductDetailView.vue" -Encoding UTF8

@'
<script setup>
import { useCartStore } from '../stores/cartStore'

const cartStore = useCartStore()
</script>

<template>
  <section>
    <h1>Carrito</h1>

    <p v-if="cartStore.items.length === 0">El carrito está vacío.</p>

    <div
      v-for="item in cartStore.items"
      :key="item.id"
      class="border p-3 mb-2"
    >
      <h5>{{ item.name }}</h5>
      <p>Cantidad: {{ item.quantity }}</p>
      <p>Subtotal: ${{ item.price * item.quantity }}</p>

      <button
        class="btn btn-danger btn-sm"
        @click="cartStore.removeFromCart(item.id)"
      >
        Eliminar
      </button>
    </div>

    <h3>Total: ${{ cartStore.totalPrice }}</h3>

    <RouterLink
      v-if="cartStore.items.length > 0"
      class="btn btn-primary"
      to="/checkout"
    >
      Ir al checkout
    </RouterLink>
  </section>
</template>
'@ | Set-Content "$base/views/CartView.vue" -Encoding UTF8

@'
<script setup>
import { useCartStore } from '../stores/cartStore'
import { useOrderStore } from '../stores/orderStore'

const cartStore = useCartStore()
const orderStore = useOrderStore()

const finalizarCompra = async () => {
  await orderStore.addOrder({
    products: cartStore.items,
    total: cartStore.totalPrice,
    createdAt: new Date().toISOString()
  })

  cartStore.clearCart()
  alert('Compra finalizada correctamente')
}
</script>

<template>
  <section>
    <h1>Checkout</h1>

    <p>Total a pagar: ${{ cartStore.totalPrice }}</p>

    <button class="btn btn-success" @click="finalizarCompra">
      Finalizar compra
    </button>
  </section>
</template>
'@ | Set-Content "$base/views/CheckoutView.vue" -Encoding UTF8

@'
<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '../stores/authStore'

const email = ref('')
const password = ref('')

const router = useRouter()
const authStore = useAuthStore()

const handleLogin = async () => {
  await authStore.login(email.value, password.value)
  router.push('/dashboard')
}
</script>

<template>
  <section>
    <h1>Login</h1>

    <form @submit.prevent="handleLogin" class="d-flex flex-column gap-3">
      <input
        v-model="email"
        class="form-control"
        type="email"
        placeholder="Correo"
      >

      <input
        v-model="password"
        class="form-control"
        type="password"
        placeholder="Contraseña"
      >

      <button class="btn btn-primary">
        Ingresar
      </button>
    </form>
  </section>
</template>
'@ | Set-Content "$base/views/LoginView.vue" -Encoding UTF8

@'
<template>
  <section>
    <h1>Registro</h1>
    <p>Formulario de registro pendiente.</p>
  </section>
</template>
'@ | Set-Content "$base/views/RegisterView.vue" -Encoding UTF8

@'
<script setup>
import { useAuthStore } from '../stores/authStore'

const authStore = useAuthStore()
</script>

<template>
  <section>
    <h1>Dashboard</h1>

    <p>Bienvenido: {{ authStore.user?.name }}</p>

    <button class="btn btn-danger" @click="authStore.logout">
      Cerrar sesión
    </button>
  </section>
</template>
'@ | Set-Content "$base/views/DashboardView.vue" -Encoding UTF8

Write-Host ""
Write-Host "✅ Base de tienda Vue creada correctamente"
Write-Host "Ejecuta: npm run dev"
Write-Host ""
```










```
# crear-db-json.ps1

$json = @'
{
  "products": [
    {
      "id": 1,
      "name": "Aro Cherry",
      "price": 12000,
      "description": "Aro rojo estilo cherry",
      "stock": 10,
      "image": "https://picsum.photos/300?1"
    },
    {
      "id": 2,
      "name": "Collar Luna",
      "price": 15000,
      "description": "Collar dorado con dije de luna",
      "stock": 5,
      "image": "https://picsum.photos/300?2"
    },
    {
      "id": 3,
      "name": "Anillo Sol",
      "price": 10000,
      "description": "Anillo ajustable color dorado",
      "stock": 8,
      "image": "https://picsum.photos/300?3"
    },
    {
      "id": 4,
      "name": "Pulsera Estrella",
      "price": 9000,
      "description": "Pulsera con colgante estrella",
      "stock": 12,
      "image": "https://picsum.photos/300?4"
    },
    {
      "id": 5,
      "name": "Aros Perla",
      "price": 18000,
      "description": "Aros de perla natural",
      "stock": 3,
      "image": "https://picsum.photos/300?5"
    }
  ]
}
'@

Set-Content -Path "db.json" -Value $json -Encoding UTF8

Write-Host ""
Write-Host "✅ db.json creado correctamente"
Write-Host ""
```


