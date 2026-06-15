




oo   oo  ooooooo           oo         oooooooo  
ooo ooo      oo            oo              ooo  
ooooooo     oo             oo         oooooooo  
oo   oo   oo               oo              ooo  
oo   oo  oo                ooooooo    oooooooo  







npm create vue@latest




npm install vue-router pinia
npm install -D eslint eslint-plugin-vue prettier eslint-config-prettier

```
src/
│
├── api/
│   └── api.js
│
├── stores/
│   ├── authStore.js
│   └── frameworksStore.js
│
├── views/
│   ├── AppLogin.vue
│   └── UserDashboard.vue
│
├── App.vue
└── main.js
```






npm install axios
src/api/api.js
```js
import axios from 'axios'

export default axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 5000,
})
```



src/api/authStore.js
```js
import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    auth: false,
    username: '',
    loading: false,
    error: '',
  }),

  getters: {
    isAuthenticated: (state) => state.auth,
  },

  actions: {
    async doLogin({ username, password }) {
      if (
        username === 'admin' &&
        password === '123456'
      ) {
        this.auth = true
        this.username = username
      }
      else {
        this.error = 'Credenciales inválidas'
      }
    },

    doLogout() {
      this.auth = false
      this.username = ''
    },
  },
})
```



src/stores/frameworksStore.js
```js
import { defineStore } from 'pinia'
import api from '@/api/api'

export const useFrameworksStore = defineStore(
  'frameworks',
  {
    state: () => ({
      items: [],
      loading: false,
      error: '',
    }),

    actions: {
      async cargarFrameworks() {
        this.loading = true

        try {
          const response = await api.get(
            '/frameworks',
          )

          this.items = response.data
        }
        catch (error) {
          this.error =
            'Error al cargar frameworks'
        }
        finally {
          this.loading = false
        }
      },
    },
  },
)
```





src/router/index.js

````js
import { createRouter, createWebHistory } from 'vue-router'

import AppLogin from '@/views/AppLogin.vue'
import UserDashboard from '@/views/UserDashboard.vue'
import { useAuthStore } from '@/stores/authStore'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),

  routes: [
    {
      path: '/',
      redirect: '/login',
    },
    {
      path: '/login',
      name: 'login',
      component: AppLogin,
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: UserDashboard,
      meta: {
        requiresAuth: true,
      },
    },
  ],
})

router.beforeEach((to) => {
  const authStore = useAuthStore()

  if (to.meta.requiresAuth && !authStore.isAuthenticated) {
    return {
      name: 'login',
    }
  }
})

export default router
```




src/views/AppLogin.vue
```vue
<script setup>
import { reactive } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const router = useRouter()
const authStore = useAuthStore()

const form = reactive({
  username: '',
  password: '',
})

const enviarLogin = async () => {
  await authStore.doLogin(form)

  if (authStore.isAuthenticated) {
    router.push({
      name: 'dashboard',
    })
  }
}
</script>

<template>
  <main>
    <h1>Login</h1>

    <form @submit.prevent="enviarLogin">
      <div>
        <label for="username">Usuario</label>
        <input
          id="username"
          v-model="form.username"
          type="text"
        />
      </div>

      <div>
        <label for="password">Contraseña</label>
        <input
          id="password"
          v-model="form.password"
          type="password"
        />
      </div>

      <button type="submit">
        Ingresar
      </button>
    </form>

    <p v-if="authStore.loading">
      Cargando...
    </p>

    <p v-if="authStore.error">
      {{ authStore.error }}
    </p>
  </main>
</template>
```




src/views/UserDashboard.vue
```
<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'

import { useAuthStore } from '@/stores/authStore'
import { useFrameworksStore } from '@/stores/frameworksStore'

const router = useRouter()
const authStore = useAuthStore()
const frameworksStore = useFrameworksStore()

onMounted(() => {
  frameworksStore.cargarFrameworks()
})

const salir = () => {
  authStore.doLogout()

  router.push({
    name: 'login',
  })
}
</script>

<template>
  <main>
    <h1>Dashboard</h1>

    <h2>
      Hola, {{ authStore.username }}
    </h2>

    <button @click="salir">
      Salir
    </button>

    <hr />

    <h2>Frameworks</h2>

    <p v-if="frameworksStore.loading">
      Cargando frameworks...
    </p>

    <p v-if="frameworksStore.error">
      {{ frameworksStore.error }}
    </p>

    <ul v-if="!frameworksStore.loading">
      <li
        v-for="framework in frameworksStore.items"
        :key="framework.id"
      >
        {{ framework.nombre }} - {{ framework.tipo }}
      </li>
    </ul>
  </main>
</template>
```




App.vue

```vue
<template>
  <RouterView />
</template>
```





db.json
En la raíz del proyecto, al lado de package.json

```
{
  "frameworks": [
    {
      "id": 1,
      "nombre": "Vue",
      "tipo": "Framework progresivo"
    },
    {
      "id": 2,
      "nombre": "React",
      "tipo": "Librería para interfaces"
    },
    {
      "id": 3,
      "nombre": "Angular",
      "tipo": "Framework completo"
    }
  ]
}
```



levantar falsa api
```js
npx json-server db.json
```



npm run dev

Usuario de prueba:

admin
123456
```














