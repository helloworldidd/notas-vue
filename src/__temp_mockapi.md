# Mockapi



--- 
## 1. probar MockApi



### Instalacion

```sh
# json-server es una herramienta que convierte un
# archivo JSON en una API REST completa.
npm install -D json-server


```

### estructura

Crear archivo `db.json` En la raíz del proyecto, al lado de `package.json`
```txt
mi-proyecto/
├── db.json
├── package.json
├── src/
```


### db.json

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

### Levantar la API

```bash
npx json-server db.json
```


### instalar extension **Thunder Client**

metodo: GET
```
url: http://localhost:3000/products
```

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





---
## 2. crud







### instalcion

```sh
npm i axios

npm i bootstrap
npm i bootstrap-icons


npm i pinia
npm i vue-router


npm i -D json-server
```

### estructura

```txt
src/
├── App.vue
│
├── main.js
│
├── stores/
│   └── productStore.js
|
└── router/
|   └── index.js
|
└── components/
│   ├── ProductList.vue
│   └── ProductForm.vue
│
└── views/
│   └── AboutView.vue
│   └── EditView.vue
│   └── HomeView.vue

```


### Terminales abiertas

Una para Vue:

```bash
npm run dev
```

Otra para la API:

```bash
npx json-server db.json
```





### App.vue

```vue
<template>
  <div class="container">
    <router-link class="btn btn-secondary m-2" to="/">Home</router-link>
    <router-link class="btn btn-secondary m-2" to="/about">About</router-link>

    <router-view />
  </div>
</template>
```

### src/main.js

```js
import "../node_modules/bootstrap/dist/css/bootstrap.css";

import { createApp } from "vue";
import { createPinia } from "pinia";
import router from "./router";

import App from "./App.vue";

createApp(App).use(createPinia()).use(router).mount("#app");
```

### src/stores/productStore.js

```js
import { defineStore } from "pinia";
import { ref, computed } from "vue";
import axios from "axios";

const API_URL = "http://localhost:3000/products";

export const useProductStore = defineStore("product", () => {
  // State
  const products = ref([]);
  const loading = ref(false);
  const error = ref(null);

  // Getters
  const totalProducts = computed(() => {
    return products.value.length;
  });

  // Actions

  async function fetchProducts() {
    loading.value = true;
    error.value = null;

    try {
      const response = await axios.get(API_URL);
      products.value = response.data;
    } catch (err) {
      error.value = "Error al obtener los productos 🦕☄️";
      console.log(err);
    } finally {
      loading.value = false;
    }
  }

  async function createProduct(product) {
    const response = await axios.post(API_URL, product);

    products.value.push(response.data);
  }

  async function deleteProduct(id) {
    await axios.delete(`${API_URL}/${id}`);

    products.value = products.value.filter((product) => product.id !== id);
  }

  async function updateProduct(id, productData) {
    const response = await axios.put(`${API_URL}/${id}`, productData);

    const index = products.value.findIndex((product) => {
      return product.id === id;
    });

    products.value[index] = response.data;
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
  };
});
```

### src/router/index.js

```js
import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import AboutView from "../views/AboutView.vue";
import EditView from "../views/EditView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/about",
    name: "about",
    component: AboutView,
  },
  {
    path: "/products/:id/edit",
    name: "product-edit",
    component: EditView,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
```

### src/components/ProductList.vue

```vue
<script setup>
import { onMounted } from "vue";
import { useProductStore } from "@/stores/productStore";

const productStore = useProductStore();

onMounted(() => {
  productStore.fetchProducts();
});
</script>

<template>
  <div>
    <h2>Total de productos: {{ productStore.totalProducts }}</h2>
    <div class="row">
      <div
        v-for="product in productStore.products"
        class="p-2 col-4"
        :key="product.id"
      >
        <div class="card p-2 bg-warning">
          <h3>{{ product.name }}</h3>
          <p>{{ product.description }}</p>
          <p class="text-danger fw-bold">{{ product.price }}</p>
          <button
            class="btn btn-danger m-1"
            @click="productStore.deleteProduct(product.id)"
          >
            Borrar
          </button>
          <router-link
            class="btn btn-primary m-1"
            :to="{
              name: 'product-edit',
              params: {
                id: product.id,
              },
            }"
          >
            Editar
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
```

### src/components/ProductForm.vue

```vue
<script setup>
import { ref, computed } from "vue";
import { useProductStore } from "@/stores/productStore";

const productStore = useProductStore();

const name = ref("");
const description = ref("");
const price = ref("");

const msg = ref("");

const formEmpty = computed(() => {
  return !name.value || !description.value || !price.value;
});

async function handleSubmit() {
  const newProduct = {
    name: name.value,
    description: description.value,
    price: Number(price.value),
  };

  await productStore.createProduct(newProduct);

  name.value = "";
  description.value = "";
  price.value = "";

  msg.value = "Producto creado con exito";

  setTimeout(() => {
    msg.value = "";
  }, 2000);
}
</script>

<template>
  <div>
    <h1>ProductForm</h1>

    <form @submit.prevent="handleSubmit">
      <h2>Crear Producto</h2>

      <input v-model="name" type="text" placeholder="Nombre" /><br />

      <input
        v-model="description"
        type="text"
        placeholder="Descripción"
      /><br />

      <input v-model="price" type="number" placeholder="Precio" /><br />

      <p v-if="msg">{{ msg }}</p>

      <button :disabled="formEmpty">Guardar</button>
    </form>
  </div>
</template>

<style scoped></style>
```

### src/views/AboutView.vue

```vue
<template>
  <div>
    <h1 class="text-center">About</h1>
    <p>
      Lorem ipsum dolor sit amet consectetur. Rem possimus rerum voluptatum
      molestias natus. Recusandae eveniet illo dolores excepturi consectetur.
      Dolorem saepe facilis porro amet possimus? Officiis inventore neque itaque
      obcaecati aliquam. Adipisci non quos voluptas ex ipsa? Illo quaerat
      reprehenderit dolore alias magni! Unde cumque consequatur quos? Minus,
      quis. Laboriosam quae fugit aspernatur eos delectus! Incidunt ea ipsum
      architecto reprehenderit et. Saepe, impedit! Possimus error commodi
      itaque. Tenetur, quo excepturi. Nulla, tenetur id! Fuga porro labore rerum
      nobis modi. Perspiciatis sint inventore doloribus aut dolorem. At
      repellendus nostrum magni cum modi. Quam quisquam maiores reprehenderit
      nisi beatae? Et consequuntur assumenda alias nostrum sit! Rem repudiandae
      nobis eos perspiciatis rerum? Dolorum harum dicta eos voluptatem illo.
      Reprehenderit placeat dicta eaque sunt earum.
    </p>
  </div>
</template>
```

### src/views/EditView.vue

```vue
<script setup>
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useProductStore } from "@/stores/productStore";

const route = useRoute();
const router = useRouter();
const productStore = useProductStore();

const name = ref("");
const description = ref("");
const price = ref("");

onMounted(async () => {
  await productStore.fetchProducts();

  const product = productStore.products.find((item) => {
    return item.id == route.params.id;
  });

  name.value = product.name;
  description.value = product.description;
  price.value = product.price;
});

async function updateProduct() {
  const id = route.params.id;

  const productData = {
    name: name.value,
    description: description.value,
    price: Number(price.value),
  };

  await productStore.updateProduct(id, productData);

  router.push("/");
}
</script>

<template>
  <div class="container">
    <router-link to="/" class="btn btn-secondary mb-3"> ← Volver </router-link>

    <h1>Editar producto</h1>

    <form @submit.prevent="updateProduct">
      <input v-model="name" class="form-control mb-2" type="text" />
      <input v-model="description" class="form-control mb-2" type="text" />
      <input v-model="price" class="form-control mb-2" type="number" />

      <button class="btn btn-primary">Actualizar</button>
    </form>
  </div>
</template>
```

### src/views/HomeView.vue

```vue
<script setup>
import ProductForm from "../components/ProductForm.vue";
import ProductList from "../components/ProductList.vue";
</script>

<template>
  <div>
    <h1 class="text-center">CRUD</h1>
    <ul>
      <li><b>c</b>rear,</li>
      <li><b>r</b>eal,</li>
      <li><b>u</b>pdate,</li>
      <li><b>d</b>elete</li>
    </ul>

    <ProductForm />
    <hr />
    <ProductList />
  </div>
</template>

<style scoped>
b {
  font-size: 120%;
}
</style>
```
