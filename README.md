# GUÍA Vue.js


**Repos**
- Directivas y sass: https://github.com/helloworldidd/p67-app-demo
- Rutas: https://github.com/helloworldidd/p68-vue-rutas
- Estructura: https://github.com/helloworldidd/p69-vue-base
- Props, v-if, v-for, v-model, Forms, @sumit y @click: https://github.com/helloworldidd/p70-vue-form-events
- Eventos y PopUp, @click, @mouseover, @input, @keydown, @submit: https://github.com/helloworldidd/p71-vue-events
- Eventos, Modificadores y ejercicio M6-L4 parcial https://github.com/helloworldidd/p72-vue-events-modifiers


**Ejemplos**
- https://github.com/helloworldidd/e-m6-l1


**Indice**

1. Inicialización
2. Enlace de Datos  (data binding)
3. Pinia (Guardar datos Globales)
4. Prettier (formatear code)
5. EsLint(corregir código)
6. Bootstrap (Estilo css)
7. Bootstrap Icons
8. Animate
9. SASS
10. Rourter (Rutas)
11. Formularios





---
## 1. Inicialización



### 1.1 Inicio

```sh
# opción A
npm create vite@latest

# opcion B
npm create vue@latest

cd mi-proyecto
npm i
nopm run dev
```

### 1.2 Extenciones

https://marketplace.visualstudio.com/items?itemName=Vue.volar



https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets











### 1.3 Estructura


- **index.html**
- **main.js**
```vue
import './assets/sass/main.scss'

import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
```


- **App.js**

```vue
<script setup>

</script>

<template>

</template>

<style scoped >

</style>
```








---
## 2. Enlace de Datos  (data binding)


### 2.1 One-way 

```vue
<template>
  <p>{{ mensaje }}</p>
</template>

<script setup>
const mensaje = "Hola 😎";
</script>
```





### 2.2 Directiva v-bind

```vue
<template>
  <img :src="imagen">
</template>

<script setup>
	const imagen = "https://picsum.photos/200"
</script>
```



### 2.3 Directiva v-model
(Two-way binding)


```vue
<template>
  <input v-model="mensaje">
  <p>{{ mensaje }}</p>
</template>

<script setup>
import { ref } from 'vue';
const mensaje = ref("Hola 😎");
</script>
```










### 2.4 Directiva v-for
```vue
<template>
  <ul>
    <li v-for="fruta in frutas">
      {{ fruta }}
    </li>
  </ul>
</template>

<script setup>
const frutas = [
  "Manzana",
  "Pera",
  "Plátano",
  "Frutilla"
]
</script>
```





### 2.5. Directiva v-if
mostrar o ocultar HTML según una condición 🚀

```vue
<template>
<h1 v-if="mostrar">
    Hola Vue 😎
</h1>
</template>

<script setup>
const mostrar = true
</script>
```

















<!-- 
      -----------------------------------------
      ## Directiva `v-show`
      También muestra u oculta elementos.
      La diferencia es que: v-show usa CSS

      <template>
        <h1 v-show="mostrar">
          Hola Vue 🚀
        </h1>
      </template>

      <script setup>
      const mostrar = true
      </script>





      -----------------------------------------
      ## Directiva `v-model`
      Hace: Two-way binding

      <template>
        <input v-model="mensaje">
        <p>{{ mensaje }}</p>
      </template>

      <script setup>
      import { ref } from 'vue'
      const mensaje = ref("Hola 😎")
      </script>


      -----------------------------------------
      ## Directiva `v-bind`
      Conecta atributos HTML.

      <template>
        <img :src="imagen">
      </template>

      <script setup>
      const imagen = "https://picsum.photos/200"
      </script>





      -----------------------------------------
      ## Directiva `v-on` 😎
      Escucha eventos.

      <template>
        <button @click="saludar">
          Click 😎
        </button>
      </template>

      <script setup>
      function saludar() {
        alert("Hola Vue 🚀")
      }
      </script>





      -----------------------------------------
      ## Directiva `v-text` 😎
      Inserta texto.

      <template>
        <p v-text="mensaje"></p>
      </template>

      <script setup>
      const mensaje = "Hola 😎"
      </script>




      -----------------------------------------
      ## Directiva `v-html`
      Inserta HTML real.

      <template>
        <div v-html="html"></div>
      </template>

      <script setup>
      const html = "<h1>Hola 🚀</h1>"
      </script>






      -----------------------------------------
      ## Directiva `v-cloak`
      Oculta contenido hasta que Vue cargue.


      <template>
        <h1 v-cloak>
          {{ mensaje }}
        </h1>
      </template>

      <script setup>
      	const mensaje = "Hola 😎"
      </script>



      -----------------------------------------
      ## Directiva `v-once`
      Renderiza SOLO una vez.

      <template>
        <h1 v-once>
          {{ mensaje }}
        </h1>
      </template>

      <script setup>
      	const mensaje = "Hola 🚀"
      </script>

 -->






---
## 3. Pinia (Guardar datos Globales)

```sh
npm install pinia
```



### 3.1 Pinia: guardar theme

main.js
```js

import { createPinia } from 'pinia'
const app = createApp(App)
app.use(createPinia())
app.mount('#app')

```




src/stores/themeStore.js
```js
import { defineStore } from "pinia";
import { ref } from "vue";

export const useThemeStore = defineStore("theme", () => {
  const darkMode = ref(false);

  const toggleTheme = () => {
    darkMode.value = !darkMode.value;
  };

  return {
    darkMode,
    toggleTheme,
  };
});

```


App.js
```js
<script setup>
import { useThemeStore } from "./stores/themeStore";
const themeStore = useThemeStore();
</script>


<template>
<div :class="{ dark: themeStore.darkMode }">

      <button @click="themeStore.toggleTheme">
        Cambiar tema
      </button>
</template>
```





### 3.2 Pinia: guardar datos (Fetch)

src/stores/filmStore.js

```js
import { defineStore } from "pinia";
import { ref } from "vue";

export const useFilmStore = defineStore("films", () => {
  const films = ref([]);
  const loading = ref(false);

  const getFilms = async () => {
    loading.value = true;

    try {
      const response = await fetch(
        "https://ghibliapi.vercel.app/films"
      );

      const data = await response.json();

      films.value = data;
    } catch (error) {
      console.log(error);
    } finally {
      loading.value = false;
    }
  };

  return {
    films,
    loading,
    getFilms,
  };
});

```




HomeView.vue

```vue
<script setup>
import { onMounted } from "vue";
import { useFilmStore } from "@/stores/filmStore";

const filmStore = useFilmStore();

onMounted(() => {
  filmStore.getFilms();
});
</script>

<template>
  <div>
    <h1>Studio Ghibli Films</h1>

    <p v-if="filmStore.loading">
      Cargando películas...
    </p>

    <div
      v-for="film in filmStore.films"
      :key="film.id"
      class="card"
    >
      <h2>{{ film.title }}</h2>

      <p>{{ film.description }}</p>

      <p>
        Director:
        {{ film.director }}
      </p>


    </div>
  </div>
</template>

```







---
## 4. Prettier (formatear code)


```sh
npm install -D prettier
npm install -D prettier eslint-plugin-prettier
```


Ctrl + Shift + P

```
Preferences: Open User Settings (JSON)
```


```json
"editor.formatOnSave": true,


"[html]": {
    "editor.defaultFormatter": "vscode.html-language-features"
},

"[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
},

"[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
},

"[vue]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
},

"editor.formatOnSave": true,
```



---
## 5. EsLint(corregir código)

```sh
npm install -D eslint
```




---
## 6. Bootstrap (Estilo css)

```sh
npm install bootstrap@5.3.8
```


desde vendors
```sass
@use "bootstrap/scss/bootstrap";
```





---
## 7. Bootstrap Icons

```sh
npm install bootstrap-icons
```






---
## 8. Animate

```sh
npm install animate.css --save
```


```css
@use "animate.css/animate.min.css";
```




---
## 9. SASS

```sh
npm install -D sass
```

```sh
mkdir src/assets/sass/abstracts,

src/assets/sass/base,
src/assets/sass/theme,
src/assets/sass/vendors

ni src/assets/sass/main.scss,
src/assets/sass/abstracts/_variables.scss,
src/assets/sass/abstracts/_mixins.scss,
src/assets/sass/abstracts/_functions.scss,
src/assets/sass/base/_reset.scss,
src/assets/sass/base/_typography.scss,
src/assets/sass/base/_general.scss,
src/assets/sass/theme/_dark.scss,
src/assets/sass/vendors/_bootstrap.scss
src/assets/sass/vendors/_animate.scss
```



```sh
src/
├── assets/
│   └── scss/
│       ├── abstracts/
│       │   ├── _variables.scss
│       │   ├── _mixins.scss
│       │   └── _functions.scss
│       │
│       ├── base/
│       │   ├── _reset.scss
│       │   └── _typography.scss
│       │
│       └── main.scss
│
└── components/
    ├── AppButton.vue
    ├── Navbar.vue
    └── Card.vue
```





---
## 10. Rourter (Rutas)

```sh
npm install vue-router
```



Crear src/router/index.js

```js
import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../views/HomeView.vue'
import AboutView from '../views/AboutView.vue'

const routes = [
  {
    path: '/',
    component: HomeView
  },
  {
    path: '/about',
    component: AboutView
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
```






Crear src/views/HomeView.vue

```js
<template>
  <h1>Home</h1>
</template>

Crear src/views/AboutView.vue
<template>
  <h1>About</h1>
</template>
```





Conectar main.js

```js
import { createApp } from 'vue'
import App from './App.vue'

import router from './router'

createApp(App)
  .use(router)
  .mount('#app')
```




Crear menú en App.vue

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
## 11. Formularios

### 11.1 Formulario Simple

```vue
<script setup>
import { ref } from "vue";

const nombre = ref("");
const email = ref("");

const enviarFormulario = () => {
  console.log("Nombre:", nombre.value);
  console.log("Email:", email.value);
};
</script>

<template>
  <form @submit.prevent="enviarFormulario">
    <label>Nombre</label>
    <input type="text" v-model="nombre" />

    <label>Email</label>
    <input type="email" v-model="email" />

    <button type="submit">Enviar</button>
  </form>

  <p>Nombre escrito: {{ nombre }}</p>
  <p>Email escrito: {{ email }}</p>
</template>
```






### 11.2 Formulario Objeto

```vue
<script setup>
import { reactive } from "vue";

const formulario = reactive({
  nombre: "",
  email: "",
  mensaje: "",
});

const enviarFormulario = () => {
  console.log(formulario);
};
</script>

<template>
  <form @submit.prevent="enviarFormulario">
    <input v-model="formulario.nombre" placeholder="Nombre" />
    <input v-model="formulario.email" placeholder="Email" />
    <textarea v-model="formulario.mensaje" placeholder="Mensaje"></textarea>

    <button type="submit">Enviar</button>
  </form>
</template>
```






### 11.3 Formularios Object Full

```vue
<script setup>
import { reactive } from "vue";

const formulario = reactive({
  nombre: "",
  email: "",
  edad: "",
  pais: "",
  nivel: "",
  intereses: [],
  aceptaTerminos: false,
  mensaje: "",
});

const enviarFormulario = () => {
  console.log("Formulario enviado:", formulario);
};
</script>

<template>
  <form @submit.prevent="enviarFormulario">
    <h2>Formulario de registro</h2>

    <label>Nombre</label>
    <input v-model="formulario.nombre" type="text" placeholder="Tu nombre" />

    <label>Email</label>
    <input v-model="formulario.email" type="email" placeholder="tu@email.com" />

    <label>Edad</label>
    <input v-model="formulario.edad" type="number" placeholder="Edad" />

    <label>País</label>
    <select v-model="formulario.pais">
      <option value="">Selecciona un país</option>
      <option value="Chile">Chile</option>
      <option value="Argentina">Argentina</option>
      <option value="Perú">Perú</option>
      <option value="México">México</option>
    </select>

    <h3>Nivel</h3>

    <label>
      <input v-model="formulario.nivel" type="radio" value="Principiante" />
      Principiante
    </label>

    <label>
      <input v-model="formulario.nivel" type="radio" value="Intermedio" />
      Intermedio
    </label>

    <label>
      <input v-model="formulario.nivel" type="radio" value="Avanzado" />
      Avanzado
    </label>

    <h3>Intereses</h3>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="Vue" />
      Vue
    </label>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="CSS" />
      CSS
    </label>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="UX/UI" />
      UX/UI
    </label>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="APIs" />
      APIs
    </label>

    <label>
      <input v-model="formulario.aceptaTerminos" type="checkbox" />
      Acepto términos y condiciones
    </label>

    <label>Mensaje</label>
    <textarea
      v-model="formulario.mensaje"
      placeholder="Escribe un mensaje"
    ></textarea>

    <button type="submit">Enviar</button>
  </form>

  <h3>Datos guardados en Vue</h3>
  <pre>{{ formulario }}</pre>
</template>

<style scoped>
form {
  max-width: 500px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

input,
select,
textarea,
button {
  padding: 10px;
}
</style>

```




