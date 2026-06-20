<!-- estructura ---------------------------- -->



```text
src/
├── App.vue
├── main.js
├── router/
│   └── index.js
└── views/
    ├── HomeView.vue
    ├── CatalogView.vue
    ├── ProductView.vue
    └── AboutView.vue
```




<!-- main.js ---------------------------- -->



```js
import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";

createApp(App)
  .use(router)
  .mount("#app");
```








<!-- router/index.js ---------------------------- -->


```js
import { createRouter, createWebHistory } from "vue-router";

import HomeView from "../views/HomeView.vue";
import CatalogView from "../views/CatalogView.vue";
import ProductView from "../views/ProductView.vue";
import AboutView from "../views/AboutView.vue";

const routes = [
  {
    path: "/",
    component: HomeView,
  },
  {
    path: "/inicio",
    redirect: "/",
  },
  {
    path: "/catalog",
    component: CatalogView,
  },
  {
    path: "/product/:id",
    component: ProductView,
    props: true,
  },
  {
    path: "/about",
    component: AboutView,
    alias: "/acerca",
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
```



<!-- App.vue ---------------------------- -->


```vue
<template>
  <nav>
    <router-link to="/">Home</router-link>
    |
    <router-link to="/catalog">Catalog</router-link>
    |
    <router-link to="/about">About</router-link>
  </nav>

  <hr />

  <router-view />
</template>
```










<!--    ## views/HomeView.vue ---------------------------- -->


```vue
<template>
  <h1>Home</h1>
  <p>Bienvenido a la mini-SPA con Vue Router.</p>
</template>
```










<!--    ## views/CatalogView.vue ---------------------------- -->

```vue
<script setup>
const productos = [
  {
    id: 1,
    nombre: "Mouse",
  },
  {
    id: 2,
    nombre: "Teclado",
  },
  {
    id: 3,
    nombre: "Monitor",
  },
];
</script>

<template>
  <h1>Catalog</h1>

  <ul>
    <li
      v-for="producto in productos"
      :key="producto.id"
    >
      <router-link :to="`/product/${producto.id}`">
        {{ producto.nombre }}
      </router-link>
    </li>
  </ul>
</template>
```













<!--  ## views/ProductView.vue ---------------------------- -->
 

```vue
<script setup>
defineProps({
  id: String,
});
</script>

<template>
  <h1>Detalle del producto</h1>

  <p>ID recibido como prop: {{ id }}</p>

  <router-link to="/catalog">
    Volver al catálogo
  </router-link>
</template>
```














<!--    ## views/AboutView.vue   ---------------------------- -->

```vue
<template>
  <h1>About</h1>
  <p>Esta página también se puede visitar desde /acerca.</p>
</template>
```







