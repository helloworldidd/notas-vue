# Datos Globales

--- 

## Indíce

- []()



--- 

## 







Almacenamiento de estado en Vuex 
Qué es Vuex
Almacenamiento de estado en Vuex

Cuándo conviene utilizarlo

Estructura de la aplicación

Conceptos claves:
- State
- Mutation
- Action
- Module

Usos clásicos:
- Manejo de formularios
- Manejo de la autenticación
- Utilizando Vuex y Axios







# Almacenamiento de Estado Global con Pinia

## Pinia

Pinia es el gestor de estado oficial para Vue 3.

Permite compartir datos entre componentes sin necesidad de pasar Props constantemente.

```text
Navbar
   ↓
 Pinia
   ↑
Home
```

---

## Reemplazo a Vuex

Vuex fue el gestor oficial de Vue 2.

Pinia simplifica:

- Menos código
- Mejor TypeScript
- Más intuitivo
- Mejor integración con Composition API




















---
## Cuándo utilizarlo

No usar Pinia para todo.

Úsalo cuando varios componentes necesitan compartir datos.

Ejemplos:

- Usuario autenticado
- Tema Dark / Light
- Carrito de compras
- Favoritos
- Configuraciones globales





## Estructura de la aplicación
## Estructura de una Store


## Estructura de la aplicación con Pinia

Una aplicación Vue 3 con Pinia normalmente separa:

```sh
src/
├── main.js
├── App.vue
├── router/
│   └── index.js
├── stores/
│   ├── userStore.js
│   ├── productStore.js
│   └── cartStore.js
├── views/
│   ├── HomeView.vue
│   ├── LoginView.vue
│   └── ProductsView.vue
└── components/
    ├── Navbar.vue
    ├── ProductCard.vue
    └── CartItem.vue
```


Instalar
```
npm i pinia
```




main.js

```js
import { createApp } from 'vue';
import { createPinia } from 'pinia';

import App from './App.vue';
import router from './router';

const app = createApp(App);

app.use(createPinia());
app.use(router);

app.mount('#app');
```




Carpeta stores/

La carpeta stores/ guarda los estados globales de la aplicación.

```
stores/
├── userStore.js
├── productStore.js
└── cartStore.js
```







userStore.js
```js
import { defineStore } from 'pinia';

export const useUserStore = defineStore('user', {
  state: () => ({
    usuario: null,
    token: null,
  }),

  actions: {
    login(usuario, token) {
      this.usuario = usuario;
      this.token = token;
    },

    logout() {
      this.usuario = null;
      this.token = null;
    },
  },
});
```







productStore.js

```js
import { defineStore } from 'pinia';

export const useProductStore = defineStore('products', {
  state: () => ({
    productos: [],
  }),

  actions: {
    setProductos(productos) {
      this.productos = productos;
    },
  },
});
```



USO
```js
<script setup>
import { useUserStore } from '@/stores/userStore';

const userStore = useUserStore();
</script>

<template>
  <div>
    <p v-if="userStore.usuario">
      Hola {{ userStore.usuario.nombre }}
    </p>

    <p v-else>
      No has iniciado sesión
    </p>
  </div>
</template>
```











































## EJEMPLOS





### Usuario autenticado

Guardar el usuario y el token cuando inicia sesión.

stores/authStore.js

```js
import { defineStore } from 'pinia';

export const useAuthStore = defineStore('auth', {

  state: () => ({
    usuario: null,
    token: null,
    autenticado: false
  }),

  actions: {

    login(usuario, token) {

      this.usuario = usuario;
      this.token = token;
      this.autenticado = true;

    },

    logout() {

      this.usuario = null;
      this.token = null;
      this.autenticado = false;

    }

  }

});
````

Componente Login

```vue
<script setup>
import { useAuthStore }
from '@/stores/authStore';

const authStore =
  useAuthStore();

const usuario = {
  id: 1,
  nombre: 'Patricio',
  email: 'patricio@test.com'
};

const token =
  'abc123token';

const iniciarSesion = () => {

  authStore.login(
    usuario,
    token
  );

};

const cerrarSesion = () => {

  authStore.logout();

};
</script>

<template>

  <button @click="iniciarSesion">
    Iniciar sesión
  </button>

  <button @click="cerrarSesion">
    Cerrar sesión
  </button>

</template>
```

Ver usuario autenticado

```vue
<script setup>
import { useAuthStore }
from '@/stores/authStore';

const authStore =
  useAuthStore();
</script>

<template>

  <div v-if="authStore.autenticado">

    <h2>
      Bienvenido {{ authStore.usuario.nombre }}
    </h2>

    <p>
      {{ authStore.usuario.email }}
    </p>

  </div>

  <div v-else>

    <h2>
      No has iniciado sesión
    </h2>

  </div>

</template>
```

Flujo

```text
Click iniciar sesión
      ↓
authStore.login(usuario, token)
      ↓
Guarda usuario
      ↓
Guarda token
      ↓
autenticado = true
      ↓
Los componentes muestran la sesión activa
```

























### Tema Dark / Light

Permite cambiar entre tema claro y oscuro desde cualquier componente.

stores/themeStore.js

```js
import { defineStore } from 'pinia';

export const useThemeStore = defineStore('theme', {

  state: () => ({
    dark: false
  }),

  actions: {

    toggleTheme() {

      this.dark = !this.dark;

    }

  }

});
```

Componente Botón Tema

```vue
<script setup>
import { useThemeStore }
from '@/stores/themeStore';

const themeStore =
  useThemeStore();
</script>

<template>

  <button
    @click="themeStore.toggleTheme()"
  >
    {{ themeStore.dark
      ? '☀️ Light'
      : '🌙 Dark'
    }}
  </button>

</template>
```

Aplicar tema

```vue
<script setup>
import { useThemeStore }
from '@/stores/themeStore';

const themeStore =
  useThemeStore();
</script>

<template>

  <div
    :class="{
      dark: themeStore.dark
    }"
  >

    Aplicación

  </div>

</template>

<style scoped>

.dark {
  background-color: #222;
  color: white;
}

</style>
```

Flujo

```text
Click botón
      ↓
toggleTheme()
      ↓
dark = true
      ↓
Se aplica clase dark
      ↓
Toda la aplicación cambia de tema
```


💡 En una aplicación real normalmente el estado se guarda en `localStorage` para recordar el tema:

```js
toggleTheme() {

  this.dark = !this.dark;

  localStorage.setItem(
    'dark',
    this.dark
  );

}
```

y al iniciar la app:

```js
state: () => ({
  dark:
    localStorage.getItem('dark')
    === 'true'
})
```

Así el usuario mantiene su tema incluso después de cerrar el navegador. 😎




































### Carrito de compras

Guardar productos en un carrito, aumentar cantidades y eliminar productos.

stores/cartStore.js

```js
import { defineStore } from 'pinia';

export const useCartStore = defineStore('cart', {

  state: () => ({
    carrito: []
  }),

  actions: {

    agregarAlCarrito(producto) {

      const item =
        this.carrito.find(
          p => p.id === producto.id
        );

      if (item) {

        item.cantidad++;

      } else {

        this.carrito.push({
          ...producto,
          cantidad: 1
        });

      }

    },

    quitarDelCarrito(producto) {

      this.carrito =
        this.carrito.filter(
          p => p.id !== producto.id
        );

    },

    vaciarCarrito() {

      this.carrito = [];

    }

  }

});
```

Componente Producto

```vue
<script setup>
import { useCartStore }
from '@/stores/cartStore';

const cartStore =
  useCartStore();

const producto = {
  id: 1,
  nombre: 'Pastel de Chocolate',
  precio: 5000
};
</script>

<template>

  <h2>
    {{ producto.nombre }}
  </h2>

  <p>
    ${{ producto.precio }}
  </p>

  <button
    @click="
      cartStore.agregarAlCarrito(
        producto
      )
    "
  >
    🛒 Agregar al carrito
  </button>

</template>
```

Ver carrito

```vue
<script setup>
import { useCartStore }
from '@/stores/cartStore';

const cartStore =
  useCartStore();
</script>

<template>

  <h2>
    Carrito
  </h2>

  <ul>

    <li
      v-for="item in cartStore.carrito"
      :key="item.id"
    >
      {{ item.nombre }}
      -
      ${{ item.precio }}
      -
      Cantidad: {{ item.cantidad }}

      <button
        @click="
          cartStore.quitarDelCarrito(
            item
          )
        "
      >
        Eliminar
      </button>
    </li>

  </ul>

  <button
    @click="cartStore.vaciarCarrito()"
  >
    Vaciar carrito
  </button>

</template>
```

Flujo

```text
Click agregar al carrito
      ↓
agregarAlCarrito(producto)
      ↓
Si no existe, lo agrega con cantidad 1
      ↓
Si ya existe, aumenta cantidad
      ↓
Todos los componentes actualizan el carrito
```










































### Favoritos

Permite guardar o quitar productos favoritos desde cualquier componente usando Pinia.

stores/favoriteStore.js

```js
import { defineStore } from 'pinia';

export const useFavoriteStore = defineStore('favorites', {

  state: () => ({
    favoritos: []
  }),

  actions: {

    toggleFavorito(producto) {

      const index =
        this.favoritos.findIndex(
          p => p.id === producto.id
        );

      if (index >= 0) {

        this.favoritos.splice(index, 1);

      } else {

        this.favoritos.push(producto);

      }

    }

  }

});
```

Componente Producto

```vue
<script setup>
import { useFavoriteStore }
from '@/stores/favoriteStore';

const favoriteStore =
  useFavoriteStore();

const producto = {
  id: 1,
  nombre: 'Pastel de Chocolate',
  precio: 5000
};
</script>

<template>

  <h2>
    {{ producto.nombre }}
  </h2>

  <button
    @click="
      favoriteStore.toggleFavorito(
        producto
      )
    "
  >
    ❤️ Favorito
  </button>

</template>
```

Ver Favoritos

```vue
<script setup>
import { useFavoriteStore }
from '@/stores/favoriteStore';

const favoriteStore =
  useFavoriteStore();
</script>

<template>

  <h2>
    Mis Favoritos
  </h2>

  <ul>

    <li
      v-for="item in favoriteStore.favoritos"
      :key="item.id"
    >
      {{ item.nombre }}
    </li>

  </ul>

</template>
```

Flujo

```text
Click botón
      ↓
toggleFavorito(producto)
      ↓
Pinia Store
      ↓
Si existe lo elimina
      ↓
Si no existe lo agrega
      ↓
Todos los componentes se actualizan
```












































### Configuraciones globales

Permite guardar configuraciones utilizadas por toda la aplicación.

Ejemplos:

```text
Idioma

Moneda

Tema

Notificaciones

Cantidad de productos por página
```

stores/settingsStore.js

```js
import { defineStore } from 'pinia';

export const useSettingsStore = defineStore('settings', {

  state: () => ({
    idioma: 'es',
    moneda: 'CLP',
    notificaciones: true
  }),

  actions: {

    cambiarIdioma(idioma) {

      this.idioma = idioma;

    },

    cambiarMoneda(moneda) {

      this.moneda = moneda;

    },

    toggleNotificaciones() {

      this.notificaciones =
        !this.notificaciones;

    }

  }

});
```

Componente Configuración

```vue
<script setup>
import { useSettingsStore }
from '@/stores/settingsStore';

const settingsStore =
  useSettingsStore();
</script>

<template>

  <h2>
    Configuración
  </h2>

  <button
    @click="
      settingsStore.cambiarIdioma(
        'en'
      )
    "
  >
    Inglés
  </button>

  <button
    @click="
      settingsStore.cambiarIdioma(
        'es'
      )
    "
  >
    Español
  </button>

  <button
    @click="
      settingsStore.toggleNotificaciones()
    "
  >
    Notificaciones
  </button>

</template>
```

Usar configuración

```vue
<script setup>
import { useSettingsStore }
from '@/stores/settingsStore';

const settingsStore =
  useSettingsStore();
</script>

<template>

  <p>
    Idioma:
    {{ settingsStore.idioma }}
  </p>

  <p>
    Moneda:
    {{ settingsStore.moneda }}
  </p>

  <p>
    Notificaciones:
    {{ settingsStore.notificaciones }}
  </p>

</template>
```

Flujo

```text
Usuario cambia configuración
            ↓
settingsStore
            ↓
Actualiza estado global
            ↓
Todos los componentes
ven la nueva configuración
```























### Manejo de Formularios

Permite compartir los datos de un formulario entre varios componentes utilizando Pinia.

Ejemplo:

```text
Formulario de registro

Formulario de contacto

Checkout

Perfil de usuario
```

stores/formStore.js

```js
import { defineStore } from 'pinia';

export const useFormStore = defineStore('form', {

  state: () => ({
    nombre: '',
    email: '',
    mensaje: ''
  }),

  actions: {

    actualizarFormulario(datos) {

      this.nombre = datos.nombre;
      this.email = datos.email;
      this.mensaje = datos.mensaje;

    },

    limpiarFormulario() {

      this.nombre = '';
      this.email = '';
      this.mensaje = '';

    }

  }

});
```

Componente Formulario

```vue
<script setup>
import { useFormStore }
from '@/stores/formStore';

const formStore =
  useFormStore();
</script>

<template>

  <input
    v-model="formStore.nombre"
    placeholder="Nombre"
  >

  <input
    v-model="formStore.email"
    placeholder="Email"
  >

  <textarea
    v-model="formStore.mensaje"
    placeholder="Mensaje"
  />

  <button
    @click="formStore.limpiarFormulario()"
  >
    Limpiar
  </button>

</template>
```

Ver datos del formulario

```vue
<script setup>
import { useFormStore }
from '@/stores/formStore';

const formStore =
  useFormStore();
</script>

<template>

  <h2>
    Vista previa
  </h2>

  <p>
    Nombre:
    {{ formStore.nombre }}
  </p>

  <p>
    Email:
    {{ formStore.email }}
  </p>

  <p>
    Mensaje:
    {{ formStore.mensaje }}
  </p>

</template>
```

Flujo

```text
Usuario escribe
        ↓
v-model
        ↓
Pinia Store
        ↓
Actualiza el estado global
        ↓
Otros componentes ven los cambios
en tiempo real
```




















































### Utilizando Pinia y Axios

Permite consumir datos desde una API y guardarlos en una store global.

stores/userStore.js

```js
import { defineStore } from 'pinia';
import axios from 'axios';

export const useUserStore = defineStore('users', {

  state: () => ({
    usuarios: [],
    cargando: false,
    error: null
  }),

  actions: {

    async cargarUsuarios() {

      this.cargando = true;
      this.error = null;

      try {

        const { data } =
          await axios.get(
            'https://jsonplaceholder.typicode.com/users'
          );

        this.usuarios = data;

      } catch (error) {

        this.error =
          'Error al cargar usuarios';

      } finally {

        this.cargando = false;

      }

    }

  }

});
```

Componente Usuarios

```vue
<script setup>
import { onMounted } from 'vue';

import { useUserStore }
from '@/stores/userStore';

const userStore =
  useUserStore();

onMounted(() => {

  userStore.cargarUsuarios();

});
</script>

<template>

  <h2>
    Usuarios
  </h2>

  <p v-if="userStore.cargando">
    Cargando...
  </p>

  <p v-if="userStore.error">
    {{ userStore.error }}
  </p>

  <ul v-else>

    <li
      v-for="usuario in userStore.usuarios"
      :key="usuario.id"
    >
      {{ usuario.name }}
    </li>

  </ul>

</template>
```

Flujo

```text
Componente se monta
        ↓
onMounted()
        ↓
userStore.cargarUsuarios()
        ↓
Axios consulta la API
        ↓
Pinia guarda los datos
        ↓
El componente muestra los usuarios
```






















### ### ### ### EJERCICIO ### ### ### ### 
### ### ### ### EJERCICIO ### ### ### ### 
### ### ### ### EJERCICIO ### ### ### ### 


Objetivos
Construir una mini-app con login y un dashboard que lista datos desde una API, aplicando Vuex para
centralizar estado y Vue Router para proteger rutas.

Requisitos previos
- Vue 3
- Vuex 4
- Vue Router 4
- Axios.

• Una API simple. Si no tienes, prepara un json-server con un recurso frameworks (GET lista).

Instrucciones

1. Estructura del proyecto
• Crea un proyecto Vue 3.
• Añade carpetas/archivos:
    src/api/
    src/store/
    src/store/modules/
    src/router/
    src/views/

• Conecta store y router a la app antes de montar.


2. Instancia única de Axios
• Crea src/api/api.js con una instancia configurada (baseURL y timeout).
• Nota: si después agregas autenticación, aquí irá el Authorization.


3. Módulo Vuex: auth (sesión)
• State mínimo: auth (boolean), username (string), loading, error.
• Getters: isAuthenticated (deriva de auth).
• Mutations: doLogin, doLogout, setLoading, setError.
• Actions:
o doLogin({ username, password }): valida mínimamente, manipula loading/error, y al final
comitea doLogin.
o doLogout(): limpia sesión.
• Reglas: toda asincronía aquí; nunca en mutations.



4. Módulo Vuex: frameworks (datos remotos)
• State: items (array), loading, error.
• Mutations: setItems, setLoading, setError.
• Action: cargar() → hace GET a /frameworks, maneja loading/error y comitea los datos.
• Extensión (opcional): filtros/paginación vía params.

5. Store principal
• Registra ambos módulos con namespaced: true.
• Activa strict en desarrollo.



6. Conecta el componente en App.vue
• Rutas: /login (pública) y /dashboard (privada con meta.requiresAuth: true).
• Guard global beforeEach: si la ruta requiere auth y no hay sesión, redirige a Login.


7. Vista AppLogin.vue
• Formulario local (no en el store) con username y password.
• Al enviar: despacha auth/doLogin y, si resulta, navega a Dashboard.
• Muestra loading y error del módulo auth.
• No uses Axios aquí: solo dispatch.


8. Vista UserDashboard.vue
• Encabezado con saludo: “Hola, {username}”.
• Botón Salir que despacha auth/doLogout y vuelve a Login.
• Al montar: despacha frameworks/cargar.
• Muestra loading, error y la lista de items desde el store.
• Nada de Axios directo en la vista.



Entregables
• Proyecto comprimido (sin node_modules).
• Archivo Word con capturas:
1. Login con error mostrado.
2. Dashboard con saludo y lista cargada.
3. Intento de acceder a /dashboard sin sesión → redirección a Login.
• Breve ficha (1 página) explicando: por qué async en actions, mutations sincrónicas, y cómo
funciona el guard.

















































































































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


