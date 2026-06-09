# Router (Rutas)



---

## Indíce

- [Instalación](#instalación)
- [Crear router](#crear-router)
- [Crear vistas](#crear-vistas)
- [Conectar en main.js](#conectar-en-mainjs)
- [Crear menú en App.vue](#crear-menú-en-appvue)
- [Rutas estáticas](#rutas-estáticas)
- [Rutas dinámicas](#rutas-dinámicas)
- [Rutas anidadas](#rutas-anidadas)
- [Pasar props según ruta](#pasar-props-según-ruta)
- [Redirecciones](#redirecciones)
- [Alias](#alias)
- [Transiciones entre rutas](#transiciones-entre-rutas)
- [Transiciones para rutas dinámicas](#transiciones-para-rutas-dinámicas)
- [Transiciones por ruta](#transicionesd-por-ruta)
- [Usando Animate.css](#usando-animatecss)
- [Ruta 404](#ruta-404)
- [1. Scroll suave a una sección](#1-scroll-suave-a-una-sección)
- [2. Menú lateral simple](#2-menú-lateral-simple)



---

## Instalación

Vue Router permite crear navegación entre páginas dentro de una SPA.

```sh
npm install vue-router
```

---

## Crear router

Crear:

```txt
src/router/index.js
```

```js
import { createRouter, createWebHistory } from "vue-router";

import HomeView from "../views/HomeView.vue";
import AboutView from "../views/AboutView.vue";

const routes = [
  {
    path: "/",
    component: HomeView
  },
  {
    path: "/about",
    component: AboutView
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
```

---

## Crear vistas

```txt
src/views/HomeView.vue
```

```vue
<template>
  <h1>Home</h1>
</template>
```

```txt
src/views/AboutView.vue
```

```vue
<template>
  <h1>About</h1>
</template>
```

---

## Conectar en main.js

```js
import { createApp } from "vue";
import App from "./App.vue";

import router from "./router";

createApp(App)
  .use(router)
  .mount("#app");
```

---

## Crear menú en App.vue

```vue
<template>
  <nav>
    <router-link to="/">Inicio</router-link>
    |
    <router-link to="/about">About</router-link>
  </nav>

  <router-view />
</template>
```

---

## Rutas estáticas

Son rutas fijas.

```js
{
  path: "/about",
  component: AboutView
}
```

Ejemplos:

```txt
/
/about
/contacto
/servicios
```

---

## Rutas dinámicas

Sirven cuando una parte de la URL cambia.

```js
{
  path: "/productos/:id",
  component: ProductoView
}
```

Ejemplos:

```txt
/productos/1
/productos/2
/productos/3
```

Crear vista:

```txt
src/views/ProductoView.vue
```

```vue
<script setup>
import { useRoute } from "vue-router";

const route = useRoute();
</script>

<template>
  <h1>Producto {{ route.params.id }}</h1>
</template>
```

Link:

```vue
<router-link to="/productos/1">
  Producto 1
</router-link>
```
o

```
<router-link
	v-for="i in 3"
	:key="i"
	:to="`/product/${i}`"
>
	product {{ i }}
</router-link>

```


---

## Rutas anidadas

Sirven para tener rutas dentro de otras rutas.

```js
{
  path: "/dashboard",
  component: DashboardView,
  children: [
    {
      path: "profile",
      component: ProfileView
    },
    {
      path: "configuration",
      component: ConfigurationView
    }
  ]
}
```

La URL sería:

```txt
/dashboard/profile
/dashboard/configuration
```

En `DashboardView.vue` debe ir:

```vue
<template>
  <h1>Dashboard</h1>

  <router-link to="/dashboard/profile">
    Profile
  </router-link>

  <router-link to="/dashboard/configuration">
    Configuration
  </router-link>

  <router-view />
</template>
```

---

## Pasar props según ruta

En vez de leer con `useRoute()`, puedes pasar parámetros como props.

```js
{
  path: "/product/:id",
  component: ProductView,
  props: true
}
```

En `ProductView.vue`:

```vue
<script setup>
defineProps({
  id: String
});
</script>

<template>
  <h1>Producto {{ id }}</h1>
</template>
```

Esto es más limpio porque el componente no depende directamente del router.

---

## Redirecciones

Sirven para mandar una ruta a otra.

```js
{
  path: "/inicio",
  redirect: "/"
}
```

Si el usuario entra a:

```txt
/inicio
```

Vue lo manda a:

```txt
/
```

---

## Alias

Sirve para que una misma ruta tenga otro nombre.

```js
{
  path: "/about",
  component: AboutView,
  alias: "/sobre-nosotros"
}
```

Entonces estas dos URLs muestran lo mismo:

```txt
/about
/sobre-nosotros
```

---

## Transiciones entre rutas
Las transiciones permiten animar el cambio entre páginas de una SPA.


#### Transición básica (Fade)

En `App.vue`:

```vue
<template>
  <router-view v-slot="{ Component }">

    <transition
      name="fade"
      mode="out-in"
    >
      <component :is="Component" />
    </transition>

  </router-view>
</template>

<style scoped>

.fade-enter-active,
.fade-leave-active {
  transition: opacity .3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

</style>
```

**¿Qué hace cada parte?**

- RouterView:`<router-view v-slot="{ Component }">` Obtiene el componente de la ruta actual.
- Transition: `<transition name="fade">` Envuelve el componente y le aplica una animación.
- Component: `<component :is="Component" />` Renderiza dinámicamente el componente actual.

**clases creadas autmaticamente**

```
<transition name="demo">
  <div>Hola</div>
</transition>
```

Vue generará:
```css
.demo-enter-active {}
.demo-enter-from {}
.demo-enter-to {}

.demo-leave-active {}
.demo-leave-from {}
.demo-leave-to {}
```



#### mode="out-in"

```vue
<transition
  name="fade"
  mode="out-in"
>
</transition>
```

Significa:

```txt
1. Sale la vista actual
2. Entra la nueva vista
```

Sin esto ambas pueden mostrarse al mismo tiempo.



#### Fade

Animación más utilizada.

```css
.fade-enter-active,
.fade-leave-active {
  transition: opacity .3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
```

Resultado:

```txt
Desaparece
↓
Aparece
```



#### Zoom

```vue
<transition name="zoom">
</transition>
```

```css
.zoom-enter-active,
.zoom-leave-active {
  transition: all .3s ease;
}

.zoom-enter-from,
.zoom-leave-to {
  opacity: 0;
  transform: scale(.8);
}
```

Resultado:

```txt
Pequeño
↓
Tamaño normal
```



#### Slide Left

```vue
<transition name="slide-left">
</transition>
```

```css
.slide-left-enter-active,
.slide-left-leave-active {
  transition: all .3s ease;
}

.slide-left-enter-from {
  transform: translateX(100%);
}

.slide-left-leave-to {
  transform: translateX(-100%);
}
```

Resultado:

```txt
Entra desde la derecha
↓
Sale por la izquierda
```


#### Slide Right

```vue
<transition name="slide-right">
</transition>
```

```css
.slide-right-enter-active,
.slide-right-leave-active {
  transition: all .3s ease;
}

.slide-right-enter-from {
  transform: translateX(-100%);
}

.slide-right-leave-to {
  transform: translateX(100%);
}
```

Resultado:

```txt
Entra desde la izquierda
↓
Sale por la derecha
```


#### Slide Up

```vue
<transition name="slide-up">
</transition>
```

```css
.slide-up-enter-active,
.slide-up-leave-active {
  transition: all .3s ease;
}

.slide-up-enter-from {
  transform: translateY(100%);
}

.slide-up-leave-to {
  transform: translateY(-100%);
}
```

Resultado:

```txt
Sube desde abajo
```


#### Rotate

```vue
<transition name="rotate">
</transition>
```

```css
.rotate-enter-active,
.rotate-leave-active {
  transition: all .4s ease;
}

.rotate-enter-from,
.rotate-leave-to {
  opacity: 0;
  transform: rotate(-180deg);
}
```

Resultado:

```txt
Gira mientras aparece
```



## Transiciones para rutas dinámicas

Problema:

```txt
/productos/1
/productos/2
/productos/3
```

Todas usan:

```vue
<ProductoView />
```

Vue reutiliza el componente.

Por eso la transición puede no ejecutarse.



### Solución

```vue
<router-view
  v-slot="{ Component, route }"
>

  <transition
    name="fade"
  >

    <component
      :is="Component"
      :key="route.fullPath"
    />

  </transition>

</router-view>
```

---

**route.fullPath**

Ejemplos:

```txt
/productos/1
/productos/2
/productos/3
```

Cada URL es distinta.

Vue destruye el componente anterior y crea uno nuevo.

La animación vuelve a ejecutarse.



## Transiciones por ruta

Router:

```js
{
  path: "/usuarios",
  component: UsuariosView,
  meta: {
    transition: "slide-left"
  }
},
{
  path: "/productos",
  component: ProductosView,
  meta: {
    transition: "slide-right"
  }
}
```

App.vue:

```vue
<router-view
  v-slot="{ Component, route }"
>

  <transition
    :name="route.meta.transition || 'fade'"
  >

    <component :is="Component" />

  </transition>

</router-view>
```

Resultado:

```txt
/usuarios  -> slide-left
/productos -> slide-right
```



## Usando Animate.css

Instalación:`npm i animate.css`

main.js:

```js
import "animate.css";
```

Uso:

```vue
<transition
  enter-active-class="
    animate__animated
    animate__fadeIn
  "
  leave-active-class="
    animate__animated
    animate__fadeOut
  "
>
  <component :is="Component" />
</transition>
```









## Ruta 404

Sirve para páginas no encontradas.

```js
{
  path: "/:pathMatch(.*)*",
  component: NotFoundView
}
```

Crear:

```txt
src/views/NotFoundView.vue
```

```vue
<template>
  <h1>404</h1>
  <p>Página no encontrada</p>
</template>
```
































































v-slot="{ Component }


<component :is="Component" />



<transition name="slide-up" mode="out-in">



    

/* ACTIVE */

.slide-up-enter-active {
  transition: opacity 0.5s ease;
}

.slide-up-leave-active {
  transition: opacity 0.5s ease;
}


/* ENTER */
.slide-up-enter-from {
  opacity: 0;
}

.slide-up-enter-to {
}


/* LEAVE */
.slide-up-leave-from {
}

.slide-up-leave-to {
  opacity: 0;
}
</style>











<router-view v-slot="{ Component }">
  <transition name="fade">
    <component
      :is="Component"
      :key="$route.fullPath"
      class="route-page"
    />
  </transition>
</router-view>



.router-container {
  position: relative;
  min-height: 80vh;
}

.route-page {
  width: 100%;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 1s ease;
  position: absolute;
  width: 100%;
}

.fade-enter-from {
  opacity: 0;
}

.fade-enter-to {
  opacity: 1;
}

.fade-leave-from {
  opacity: 1;
}

.fade-leave-to {
  opacity: 0;
}




































<script setup>


</script>

<template>
  <div>
    <img src="@/assets/img/logo.png" alt="" class="logo">

    <nav>
      <router-link to="/">Home</router-link>
      <router-link to="/about">About</router-link>
      <router-link to="/contact">Contact</router-link>
      <router-link class="anidacion" to="/dashboard/profile">Profile</router-link>
      <router-link class="anidacion" to="/dashboard/configuration">Configuration</router-link>
    </nav>

    <nav>
      <router-link to="/product/1">Product 1</router-link>
      <router-link to="/product/2">Product 2</router-link>
      <router-link to="/product/3">Product 3</router-link>
      <router-link to="/product/4">Product 4</router-link>
    </nav>

    <nav>
      <router-link v-for="i in 4" :key="i" :to="`/product/${i}`">Product {{ i }}</router-link>
    </nav>

<router-view v-slot="{ Component }">
  <transition name="fade">
    <component
      :is="Component"
      :key="$route.fullPath"
      class="route-page"
    />
  </transition>
</router-view>

  </div>
</template>

<style scoped>
.logo{
    width: 100px;
}

.page{
    background-color: #b5cfb0;
    padding: 20px;
    min-height: 80vh;
}

nav{
    margin-bottom: 20px;
    border: 1px solid #333;
    width: fit-content;
    padding: 10px;
}

nav a{
    margin-right: 10px;
    text-decoration: none;
    background-color: rgb(168, 143, 46);
    color: #fff;

    padding: 5px 10px;
    border-radius: 5px;
}

nav a.anidacion{
    background-color: rgb(69, 137, 60);
}

.router-container {
  position: relative;
  min-height: 80vh;
}

.route-page {
  width: 100%;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 1s ease;
  position: absolute;
  width: 100%;
}

.fade-enter-from {
  opacity: 0;
}

.fade-enter-to {
  opacity: 1;
}

.fade-leave-from {
  opacity: 1;
}

.fade-leave-to {
  opacity: 0;
}
</style>





































Sí, totalmente 😎 Con Vue puedes hacer las dos cosas:

## 1. Scroll suave a una sección

```vue
<script setup>
const irASeccion = (id) => {
  document.getElementById(id)?.scrollIntoView({
    behavior: 'smooth',
  });
};
</script>

<template>
  <nav>
    <button @click="irASeccion('inicio')">Inicio</button>
    <button @click="irASeccion('servicios')">Servicios</button>
    <button @click="irASeccion('contacto')">Contacto</button>
  </nav>

  <section id="inicio">Inicio</section>
  <section id="servicios">Servicios</section>
  <section id="contacto">Contacto</section>
</template>
```































## 2. Menú lateral simple

<script setup>
import { ref } from 'vue';

const abierto = ref(false);
</script>

<template>
  <button @click="abierto = true">
    ☰
  </button>

  <aside
    class="sidebar"
    :class="{ abierto }"
  >
    <button
      class="cerrar"
      @click="abierto = false"
    >
      ✕
    </button>

    <a href="#">Inicio</a>
    <a href="#">Servicios</a>
    <a href="#">Contacto</a>
  </aside>
</template>

<style scoped>
.sidebar {
  position: fixed;
  left: -250px;
  top: 0;

  width: 250px;
  height: 100vh;

  background: #333;
  color: white;

  padding: 20px;

  transition: 0.3s;
}

.sidebar.abierto {
  left: 0;
}

.cerrar {
  display: block;
  margin-left: auto;
  margin-bottom: 20px;

  background: transparent;
  color: white;

  border: none;
  font-size: 24px;

  cursor: pointer;
}

.sidebar a {
  display: block;
  color: white;
  margin-bottom: 15px;
  text-decoration: none;
}
</style>




