# Ejemplo M7 L3


---

## 1. INstalacion

```
npm create vue@latest

cd nombre-proyecto
npm install vue-router
npm install pinia
npm install axios
npm install -D json-server
```














---

## 2. Estructura

```txt
src/
├─ api/
│  └─ api.js
├─ stores/
│  ├─ authStore.js
│  └─ frameworksStore.js
├─ router/
│  └─ index.js
├─ views/
│  ├─ LoginView.vue
│  └─ DashboardView.vue
├─ App.vue
└─ main.js
```















---

## 3. Crear API falsa

En la raíz del proyecto crea **db.json**

```json
{
  "frameworks": [
    {
      "id": 1,
      "nombre": "Vue.js",
      "tipo": "Frontend"
    },
    {
      "id": 2,
      "nombre": "React",
      "tipo": "Frontend"
    },
    {
      "id": 3,
      "nombre": "Angular",
      "tipo": "Frontend"
    },
    {
      "id": 4,
      "nombre": "Express",
      "tipo": "Backend"
    }
  ]
}
```

Ejecutar API:

```bash
npx json-server db.json
```

La API queda en:

```txt
http://localhost:3000/frameworks
```
















---

## 4. Instancia única de Axios

src/api/api.js

```js
import axios from 'axios'

const api = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 8000
})

export default api
```


















---

## 5. Store de autenticación

src/stores/authStore.js`

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useAuthStore = defineStore(
  'auth',
  () => {

    // STATE
    const autenticado = ref(false)
    const username = ref('')
    const cargando = ref(false)
    const error = ref(null)

    // GETTER
    const isAutenticado = computed(() => {
      return autenticado.value
    })

    // ACTIONS
    const login = async (
      usuario,
      password
    ) => {

      cargando.value = true
      error.value = null

      try {

        await new Promise(resolve =>
          setTimeout(resolve, 700)
        )

        if (
          usuario === 'admin' &&
          password === '123456'
        ) {

          username.value = usuario
          autenticado.value = true

          return true

        }

        error.value =
          'Usuario o contraseña incorrectos'

        return false

      } catch (err) {

        error.value =
          'Error al iniciar sesión'

        return false

      } finally {

        cargando.value = false

      }

    }

    const logout = () => {
      autenticado.value = false
      username.value = ''
      error.value = null
    }

    return {
      autenticado,
      username,
      cargando,
      error,

      isAutenticado,

      login,
      logout
    }

  }
)
```

Credenciales:

```txt
Usuario: admin
Contraseña: 123456
```

---


































---


## 6. Store de frameworks

src/stores/frameworksStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import api from '@/api/api'

export const useFrameworksStore = defineStore(
  'frameworks',
  () => {

    // STATE
    const frameworks = ref([])
    const cargando = ref(false)
    const error = ref(null)

    // GETTERS
    const totalFrameworks = computed(() => {
      return frameworks.value.length
    })

    const hayFrameworks = computed(() => {
      return frameworks.value.length > 0
    })

    // ACTIONS
    const cargarFrameworks = async () => {

      cargando.value = true
      error.value = null

      try {

        const { data } =
          await api.get('/frameworks')

        frameworks.value = data

      } catch (err) {

        error.value =
          'Error al cargar frameworks'

      } finally {

        cargando.value = false

      }

    }

    return {
      frameworks,
      cargando,
      error,

      totalFrameworks,
      hayFrameworks,

      cargarFrameworks
    }

  }
)
```










---

## 7. main.js

src/main.js

```js
import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')
```
































---

### 8. Router con ruta protegida

src/router/index.js

```js
import {
  createRouter,
  createWebHistory
} from 'vue-router'

import LoginView
from '@/views/LoginView.vue'

import DashboardView
from '@/views/DashboardView.vue'

import { useAuthStore }
from '@/stores/authStore'

const routes = [
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/login',
    name: 'login',
    component: LoginView
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: DashboardView,
    meta: {
      requiresAuth: true
    }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to) => {

  const authStore =
    useAuthStore()

  const requiereAuth =
    to.matched.some(
      route => route.meta.requiresAuth
    )

  if (
    requiereAuth &&
    !authStore.isAutenticado
  ) {
    return {
      name: 'login'
    }
  }

})

export default router
```




















---

## 9. Vista Login

src/views/LoginView.vue

```vue
<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

import { useAuthStore }
from '@/stores/authStore'

const router =
  useRouter()

const authStore =
  useAuthStore()

const usuario =
  ref('')

const password =
  ref('')

const iniciarSesion = async () => {

  const resultado =
    await authStore.login(
      usuario.value,
      password.value
    )

  if (resultado) {

    router.push({
      name: 'dashboard'
    })

  }

}
</script>

<template>

  <main>
    <h1>
      Login
    </h1>

    <form
      @submit.prevent="iniciarSesion"
    >

      <input
        v-model="usuario"
        type="text"
        placeholder="Usuario"
      >

      <input
        v-model="password"
        type="password"
        placeholder="Contraseña"
      >

      <button
        :disabled="authStore.cargando"
      >
        {{
          authStore.cargando
            ? 'Ingresando...'
            : 'Ingresar'
        }}
      </button>

    </form>

    <p
      v-if="authStore.error"
      style="color: red;"
    >
      {{ authStore.error }}
    </p>

    <p>
      Usuario: admin
      <br>
      Contraseña: 123456
    </p>

  </main>

</template>
```


















---

## 10. Vista Dashboard

src/views/DashboardView.vue

```vue
<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'

import { useAuthStore }
from '@/stores/authStore'

import { useFrameworksStore }
from '@/stores/frameworksStore'

const router =
  useRouter()

const authStore =
  useAuthStore()

const frameworksStore =
  useFrameworksStore()

onMounted(() => {
  frameworksStore.cargarFrameworks()
})

const cerrarSesion = () => {

  authStore.logout()

  router.push({
    name: 'login'
  })

}
</script>

<template>

  <main>
    <h1>
      Dashboard
    </h1>

    <h2>
      Hola,
      {{ authStore.username }}
    </h2>

    <button
      @click="cerrarSesion"
    >
      Cerrar sesión
    </button>

    <hr>

    <h2>
      Frameworks
    </h2>

    <p>
      Total:
      {{ frameworksStore.totalFrameworks }}
    </p>

    <p v-if="frameworksStore.cargando">
      Cargando frameworks...
    </p>

    <p
      v-else-if="frameworksStore.error"
      style="color: red;"
    >
      {{ frameworksStore.error }}
    </p>

    <ul v-else>
      <li
        v-for="framework in frameworksStore.frameworks"
        :key="framework.id"
      >
        {{ framework.nombre }}
        -
        {{ framework.tipo }}
      </li>
    </ul>

  </main>

</template>
```



















---

## 11. App.vue

src/App.vue

```vue
<script setup>
import { useAuthStore }
from '@/stores/authStore'

const authStore =
  useAuthStore()
</script>

<template>

  <nav>
    <RouterLink to="/login">
      Login
    </RouterLink>

    |

    <RouterLink
      v-if="authStore.isAutenticado"
      to="/dashboard"
    >
      Dashboard
    </RouterLink>
  </nav>

  <RouterView />

</template>
```
























---

## 12. Cómo probar

Primero levantar Vue:

```bash
npm run dev
```

En otra terminal levantar API:

```bash
npx json-server db.json
```

Probar login malo:

```txt
Usuario: pato
Contraseña: 111
```

Debe mostrar:

```txt
Usuario o contraseña incorrectos
```

Probar login correcto:

```txt
Usuario: admin
Contraseña: 123456
```

Debe entrar al dashboard.

Probar ruta protegida:

```txt
http://localhost:5173/dashboard
```

sin iniciar sesión.

Debe redirigir a:

```txt
/login
```



























---

## Ficha explicativa breve

```txt
La lógica asincrónica se trabaja en las actions porque allí se concentran los procesos como login, llamadas a APIs o validaciones. De esta forma, las vistas no se llenan de lógica y solo llaman funciones del store.

El estado centralizado en Pinia permite compartir información entre componentes, como el usuario autenticado o la lista de frameworks, sin pasar props ni emitir eventos entre muchos niveles.

El guard de navegación de Vue Router revisa antes de entrar a una ruta si esta necesita autenticación. Si la ruta tiene meta.requiresAuth y el usuario no está autenticado, lo redirige al login.

Las vistas no deberían conectarse directamente a Axios porque eso duplica lógica y hace más difícil mantener el proyecto. Lo correcto es que Axios viva en una instancia única y que las peticiones se manejen desde las actions del store.
```
