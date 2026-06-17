# guard **Vue Router + Pinia**




## install

```bash
# 1. Crear proyecto Vue
npm create vue@latest mi-app-pinia

# 2. Entrar a la carpeta
cd mi-app-pinia

# 3. Instalar dependencias base
npm install

# 4. Instalar Axios
npm install axios

# 5. Instalar json-server para API falsa
npm install -D json-server

# 6. Crear archivo db.json
touch db.json

# 7. Levantar el proyecto Vue
npm run dev

npm i pinia
```

Y en otra terminal, para levantar la API:

```bash
npx json-server db.json
```











src/stores/authStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useAuthStore = defineStore('auth', () => {

  const auth = ref(false)

  const isAuthenticated = computed(() => auth.value)

  const login = () => {
    auth.value = true
  }

  const logout = () => {
    auth.value = false
  }

  return {
    auth,
    isAuthenticated,
    login,
    logout
  }
})
```



src/router/index.js

```js
import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '@/views/HomeView.vue'
import LoginView from '@/views/LoginView.vue'
import DashboardView from '@/views/DashboardView.vue'

import { useAuthStore } from '@/stores/authStore'

const routes = [
  {
    path: '/',
    component: HomeView
  },
  {
    path: '/login',
    component: LoginView
  },
  {
    path: '/dashboard',
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

  const authStore = useAuthStore()

  if (
    to.meta.requiresAuth &&
    !authStore.isAuthenticated
  ) {
    return '/login'
  }
})

export default router
```

src/views/HomeView.vue

```vue
<template>
  <div>
    <h1>Home</h1>

    <RouterLink to="/login">
      Ir al Login
    </RouterLink>

    <br><br>

    <RouterLink to="/dashboard">
      Ir al Dashboard
    </RouterLink>
  </div>
</template>
```

src/views/LoginView.vue

```vue
<script setup>
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const router = useRouter()
const authStore = useAuthStore()

const ingresar = () => {
  authStore.login()
  router.push('/dashboard')
}
</script>

<template>
  <div>
    <h1>Login</h1>

    <button @click="ingresar">
      Iniciar sesión
    </button>
  </div>
</template>
```



src/views/DashboardView.vue

```vue
<script setup>
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const router = useRouter()
const authStore = useAuthStore()

const salir = () => {
  authStore.logout()
  router.push('/login')
}
</script>

<template>
  <div>
    <h1>Dashboard Privado</h1>

    <p>Solo usuarios autenticados pueden entrar.</p>

    <button @click="salir">
      Cerrar sesión
    </button>
  </div>
</template>
```


### Proceso

1. Entras a `/`.
2. Haces clic en **Dashboard**.
3. El guard (`beforeEach`) se ejecuta.
4. Como `auth = false`, te manda a `/login`.
5. Presionas **Iniciar sesión**.
6. `auth = true`.
7. Te lleva a `/dashboard`.
8. Ahora el guard sí te deja pasar.
9. Si haces clic en **Cerrar sesión**, vuelve a `auth = false`.
10. Si intentas entrar nuevamente a `/dashboard`, te redirige al login.

