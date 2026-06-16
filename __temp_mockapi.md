# Mockapi











## Server



json-server es una herramienta que convierte un archivo JSON en una API REST completa.


Instalar json-server

```bash
npm install -D json-server
```

Crear archivo `db.json` En la raíz del proyecto, al lado de `package.json`

```txt
mi-proyecto/
├── db.json
├── package.json
├── src/
```

db.json

```json
{
  "products": [
    {
      "id": 1,
      "name": "Aros Cherry",
      "price": 12000,
      "category": "aros"
    },
    {
      "id": 2,
      "name": "Collar Luna",
      "price": 15000,
      "category": "collares"
    },
    {
      "id": 3,
      "name": "Anillo Sol",
      "price": 10000,
      "category": "anillos"
    }
  ]
}
```


Levantar la API
```bash
npx json-server db.json
```




instalar extension  **Thunder Client**


metodo: GET
url: http://localhost:3000/products

respuesta:
```json
[
  {
    "id": 1,
    "name": "Aros Cherry",
    "price": 12000
  }
]
```





GET por ID

Método:

metodo: GET
URL: http://localhost:3000/products/1


Método: POST
URL:http://localhost:3000/products
Body: → JSON

```json
{
  "name": "Anillo Sol",
  "price": 10000
}
```



Método:PUT
URL: http://localhost:3000/products/1
Body:

```json
{
  "id": 1,
  "name": "Aros Cherry Premium",
  "price": 15000
}
```


Método:DELETE
URL:http://localhost:3000/products/1
Respuesta:



```txt
1. GET      -> Leer productos
2. POST     -> Crear producto
3. GET      -> Ver que se creó
4. PUT      -> Modificar producto
5. GET      -> Ver cambio
6. DELETE   -> Eliminar producto
7. GET      -> Confirmar eliminación
```







































































































## crud con mockapi


```txt
src/
├── App.vue
├── main.js
├── stores/
│   └── productStore.js
└── components/
    ├── ProductList.vue
    └── ProductForm.vue
```

### 1. Instalar Axios

```bash
npm install axios
```



### 2. Store de productos

`src/stores/productStore.js`

```js
import { defineStore } from 'pinia'
import { computed, ref } from 'vue'
import axios from 'axios'

const API_URL = 'http://localhost:3000/products'

export const useProductStore = defineStore('product', () => {
  // STATE
  const products = ref([])
  const loading = ref(false)
  const error = ref(null)

  // GETTER
  const totalProducts = computed(() => {
    return products.value.length
  })

  // ACTIONS
  async function fetchProducts() {
    loading.value = true
    error.value = null

    try {
      const response = await axios.get(API_URL)
      products.value = response.data
    } catch (err) {
      error.value = 'Error al cargar productos'
      console.error(err)
    } finally {
      loading.value = false
    }
  }

  async function createProduct(product) {
    const response = await axios.post(API_URL, product)

    products.value.push(response.data)
  }

  async function deleteProduct(id) {
    await axios.delete(`${API_URL}/${id}`)

    products.value = products.value.filter((product) => {
      return product.id !== id
    })
  }

  async function updateProduct(product) {
    const response = await axios.put(
      `${API_URL}/${product.id}`,
      product
    )

    const index = products.value.findIndex((item) => {
      return item.id === product.id
    })

    products.value[index] = response.data
  }

  return {
    products,
    loading,
    error,
    totalProducts,
    fetchProducts,
    createProduct,
    deleteProduct,
    updateProduct,
  }
})
```



### 3. Formulario para crear productos

`src/components/ProductForm.vue`

```vue
<script setup>
import { ref } from 'vue'
import { useProductStore } from '@/stores/productStore'

const productStore = useProductStore()

const name = ref('')
const price = ref('')
const category = ref('')

async function handleSubmit() {
  const newProduct = {
    name: name.value,
    price: Number(price.value),
    category: category.value,
  }

  await productStore.createProduct(newProduct)

  name.value = ''
  price.value = ''
  category.value = ''
}
</script>

<template>
  <form @submit.prevent="handleSubmit">
    <h2>Crear producto</h2>

    <input
      v-model="name"
      type="text"
      placeholder="Nombre"
    >

    <input
      v-model="price"
      type="number"
      placeholder="Precio"
    >

    <input
      v-model="category"
      type="text"
      placeholder="Categoría"
    >

    <button type="submit">
      Guardar
    </button>
  </form>
</template>
```



### 4. Lista de productos

`src/components/ProductList.vue`

```vue
<script setup>
import { onMounted } from 'vue'
import { useProductStore } from '@/stores/productStore'

const productStore = useProductStore()

onMounted(() => {
  productStore.fetchProducts()
})
</script>

<template>
  <section>
    <h2>
      Productos: {{ productStore.totalProducts }}
    </h2>

    <p v-if="productStore.loading">
      Cargando productos...
    </p>

    <p v-if="productStore.error">
      {{ productStore.error }}
    </p>

    <article
      v-for="product in productStore.products"
      :key="product.id"
    >
      <h3>{{ product.name }}</h3>

      <p>${{ product.price }}</p>

      <p>{{ product.category }}</p>

      <button
        @click="productStore.deleteProduct(product.id)"
      >
        Eliminar
      </button>
    </article>
  </section>
</template>
```



### 5. App.vue

```vue
<script setup>
import ProductForm from '@/components/ProductForm.vue'
import ProductList from '@/components/ProductList.vue'
</script>

<template>
  <main>
    <h1>Pinia + Axios + json-server</h1>

    <ProductForm />

    <ProductList />
  </main>
</template>
```



### 6. Terminales abiertas

Una para Vue:

```bash
npm run dev
```

Otra para la API:

```bash
npx json-server db.json
```

