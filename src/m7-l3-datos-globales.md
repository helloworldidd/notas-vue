# Datos Globales

<br>

---

## Índice

  * [Qué es Pinia](#que-es-pinia)
  * [Pinia vs Vuex](#pinia-vs-vuex)
  * [Instalar Pinia](#instalar-pinia)
  * [State, Actions y Getters](#state-actions-y-getters)
    + [Ejemplo con los 3 conceptos](#ejemplo-con-los-3-conceptos)
  * [Ejemplos Simples](#ejemplos-simples)
    + [contador base](#contador-base)
    + [varios Componentes](#varios-componentes)
  * [Ejemplos Aplicados](#ejemplos-aplicados)
    + [Usuario autenticado](#usuario-autenticado)
    + [Tema Dark / Light](#tema-dark--light)
    + [Carrito de compras](#carrito-de-compras)
    + [Favoritos](#favoritos)
    + [Configuraciones globales](#configuraciones-globales)
    + [Manejo de Formularios](#manejo-de-formularios)
    + [Utilizando Pinia y Axios](#utilizando-pinia-y-axios)
  * [Rutas Protegidas](#rutas-protegidas)


<br>

---

## Qué es Pinia

> Pinia es la librería oficial de gestión de estado para Vue. Permite compartir y administrar datos entre distintos componentes de forma centralizada y organizada.

Sirve para guardar datos compartidos entre varios componentes, como:

- usuario logueado
- carrito de compras
- favoritos
- productos
- configuraciones
- formularios largos
- datos traídos desde una API









<br>
<br>
<br>
<br>
<br>
<br>


---

## Pinia vs Vuex

> Aunque Vuex fue durante años la solución oficial para manejar estado global, Pinia ofrece una sintaxis más simple, moderna y compatible con Vue 3.


| Vuex | Pinia | ¿Para qué sirve? |
|-------|-------|------------------|
| State | State | Almacena los datos globales de la aplicación. |
| Getters | Getters | Obtienen datos calculados o derivados del state. Son similares a `computed`. |
| Mutations | ❌ No existen | En Vuex modificaban el state. Pinia las elimina para simplificar el flujo. |
| Actions | Actions | Contienen la lógica de la aplicación y modifican el state. También pueden ser asíncronas. |
| Modules | Stores | Permiten organizar la aplicación en diferentes áreas o responsabilidades. |


Ejemplo de equivalencia

| Vuex | Pinia |
|-------|-------|
| `store.state.usuario` | `authStore.usuario` |
| `store.getters.isLogged` | `authStore.isLogged` |
| `store.commit('login')` | `authStore.login()` |
| `store.dispatch('cargarUsuarios')` | `userStore.cargarUsuarios()` |
| `modules/auth.js` | `stores/authStore.js` |



```
FLUJO PINIA           FLUJO VUEX

Componente            Componente
   ↓                      ↓
Action                 dispatch()
   ↓                      ↓
State                   Action
   ↓                      ↓
Getter                 commit()
   ↓                      ↓
Vista                  Mutation
                          ↓
                        State
                          ↓
                        Getter
                          ↓
                        Vista
```





<br>
<br>
<br>
<br>
<br>
<br>

---

## Instalar Pinia

> Antes de utilizar Pinia es necesario instalarla y registrarla dentro de la aplicación para que los stores puedan utilizarse desde cualquier componente.

```bash
npm install pinia
```

Conectar Pinia a Vue `src/main.js`

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



Estructura recomendada

```txt
src/
├── api/
│   └── api.js
│
├── stores/
│   ├── counterStore.js
│   ├── authStore.js
│   ├── productStore.js
│   ├── formStore.js
│   └── frameworksStore.js
│
├── router/
│   └── index.js
│
├── views/
│   ├── AppLogin.vue
│   ├── UserDashboard.vue
│   └── FrameworksView.vue
│
├── App.vue
└── main.js
```























































<br>
<br>
<br>
<br>
<br>
<br>



---

## State, Actions y Getters

> Pinia organiza la información mediante tres conceptos fundamentales: State para almacenar datos, Actions para modificar esos datos y Getters para obtener información derivada.


En Pinia tenemos tres conceptos básicos:

- **State**: almacena la información de la aplicación.
- **Getters**: obtienen o calculan información a partir del state.
- **Actions**: ejecutan lógica y modifican el state.

<br>

**State** Son los datos.

```js
const count = ref(0)
const user = ref(null)
const products = ref([])
```



**Actions** Son funciones que modifican el estado o ejecutan lógica.

```js
function increment() {
  count.value++
}

function login(userData) {
  user.value = userData
}
```


**Getters** Son valores calculados a partir del state. En Vue equivalen casi a un `computed`.

```js
const doubleCount = computed(() => {
  return count.value * 2
})
```

o

```js
const isLogged = computed(() => {
  return user.value !== null
})
```





```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useCounterStore = defineStore(
  'counter',
  () => {
    const count = ref(0)

    const doubleCount = computed(() => {
      return count.value * 2
    })

    function increment() {
      count.value++
    }

    return {
      count,
      doubleCount,
      increment
    }
  }
)
```

Y en el componente:

```vue
<template>
  <h2>{{ counterStore.count }}</h2>
  <h2>{{ counterStore.doubleCount }}</h2>

  <button @click="counterStore.increment">
    +
  </button>
</template>
```


resumen
```js
const products = ref([])      // State

const total = computed(...)   // Getter

function addProduct() {}      // Action
```

























<br>
<br>

### Ejemplo con los 3 conceptos

> En este ejemplo veremos cómo definir un estado, modificarlo mediante acciones y obtener valores calculados utilizando getters.


<br>
<br>

stores/counterStore.js

```js
import { defineStore } from 'pinia'
import { computed, ref } from 'vue'

export const useCounterStore = defineStore('counter', () => {
  // State
  const count = ref(0)

  // Getter
  const doubleCount = computed(() => {
    return count.value * 2
  })

  // Actions
  function increment() {
    count.value++
  }

  function decrement() {
    count.value--
  }

  function reset() {
    count.value = 0
  }

  return {
    count,
    doubleCount,
    increment,
    decrement,
    reset,
  }
})
```

<br>
<br>

Este componente solo muestra datos.
components/CounterDisplay.vue

```vue
<script setup>
import { useCounterStore } from '@/stores/counterStore'

const counterStore = useCounterStore()
</script>

<template>
  <section>
    <h2>Contador: {{ counterStore.count }}</h2>
    <p>Doble: {{ counterStore.doubleCount }}</p>
  </section>
</template>
```


<br>
<br>
Este componente solo ejecuta acciones.
components/CounterActions.vue

```vue
<script setup>
import { useCounterStore } from '@/stores/counterStore'

const counterStore = useCounterStore()
</script>

<template>
  <section>
    <button @click="counterStore.decrement">
      -
    </button>

    <button @click="counterStore.increment">
      +
    </button>

    <button @click="counterStore.reset">
      Reset
    </button>
  </section>
</template>
```


<br>

App.vue
App solo arma la pantalla.

```vue
<script setup>
import CounterDisplay from '@/components/CounterDisplay.vue'
import CounterActions from '@/components/CounterActions.vue'
</script>

<template>
  <main>
    <h1>Ejemplo Pinia</h1>

    <CounterDisplay />
    <CounterActions />
  </main>
</template>
```
resumen
```txt
CounterDisplay  → lee el state/getter
CounterActions  → ejecuta actions
counterStore    → guarda y modifica el estado
App.vue         → junta los componentes
```





































































<br>
<br>
<br>
<br>
<br>
<br>

---

## Ejemplos Simples

> Comenzaremos con ejemplos básicos para comprender cómo funciona Pinia antes de aplicarlo en escenarios más cercanos a proyectos reales.


<br>
<br>


### Contador Base

> Un contador es uno de los ejemplos más simples para entender cómo almacenar y actualizar datos dentro de un store de Pinia.


carpeta stores

```txt
src/
├─ stores/
│  └─ counterStore.js
```

src/stores/counterStore.js

```js
import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useCounterStore = defineStore(
  'counter',
  () => {
    const count = ref(0)

    return {
      count
    }
  }
)
```




App.vue

```vue
<script setup>
import { useCounterStore } from './stores/counterStore'

const counterStore = useCounterStore()
</script>

<template>
  <h1>{{ counterStore.count }}</h1>

  <button
    @click="counterStore.count++"
  >
    +
  </button>
</template>
```











<br>
<br>


### Varios Componentes

> Uno de los principales beneficios de Pinia es compartir información entre múltiples componentes sin necesidad de pasar datos manualmente mediante props.


src/components/CounterDisplay.vue

```vue
<script setup>
import { useCounterStore } from '@/stores/counterStore'

const counterStore = useCounterStore()
</script>

<template>
  <h2>{{ counterStore.count }}</h2>
</template>
```

src/components/CounterButton.vue

```vue
<script setup>
import { useCounterStore } from '@/stores/counterStore'

const counterStore = useCounterStore()
</script>

<template>
  <button
    @click="counterStore.count++"
  >
    Incrementar
  </button>
</template>
```

App.vue

```vue
<script setup>
import CounterDisplay from './components/CounterDisplay.vue'
import CounterButton from './components/CounterButton.vue'
</script>

<template>
  <CounterDisplay />
  <CounterButton />
</template>
```











































































<br>
<br>
<br>
<br>
<br>
<br>


---

## Ejemplos Aplicados

> A continuación veremos casos prácticos donde Pinia ayuda a centralizar información utilizada por distintas partes de una aplicación.


- Usuario autenticado
- Tema Dark / Light
- Carrito de compras
- Favoritos
- Configuraciones globales
- Manejo de Formularios
- Utilizando Pinia y Axios


| Caso                 | State               | Actions            | Getters           |
| -------------------- | ------------------- | ------------------ | ----------------- |
| Contador             | `count`             | `increment()`      | `doubleCount`     |
| Dark / Light         | `theme`             | `toggleTheme()`    | `isDark`          |
| Favoritos            | `favorites[]`       | `addFavorite()`    | `totalFavorites`  |
| Carrito              | `cart[]`            | `addProduct()`     | `totalPrice`      |
| Usuario autenticado  | `user`              | `login()`          | `isAuthenticated` |
| Configuración global | `language`, `theme` | `changeLanguage()` | `currentLanguage` |
| Formularios          | `formData`          | `saveForm()`       | `isValid`         |
| Axios/API            | `products[]`        | `fetchProducts()`  | `productCount`    |
















<br>
<br>


### Usuario autenticado

> Permite almacenar información del usuario que ha iniciado sesión y compartirla entre distintas vistas y componentes de la aplicación.


Credenciales para probar  
- Email: admin@test.com
- Contraseña: 123456

<br>

src/store/authStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useAuthStore = defineStore('auth', () => {

  // STATE

  const usuario = ref(null)
  const token = ref(null)
  const autenticado = ref(false)

  // GETTERS

  const isAutenticado = computed(
    () => autenticado.value
  )

  const nombreUsuario = computed(() => {

    return usuario.value
      ? usuario.value.nombre
      : 'Invitado'

  })

  // ACTIONS

  const login = (
    email,
    password
  ) => {

    if (
      email === 'admin@test.com' &&
      password === '123456'
    ) {

      usuario.value = {
        id: 1,
        nombre: 'Administrador',
        email
      }

      token.value = 'abc123token'

      autenticado.value = true

      return true

    }

    return false

  }

  const logout = () => {

    usuario.value = null
    token.value = null
    autenticado.value = false

  }

  return {
    usuario,
    token,
    autenticado,

    isAutenticado,
    nombreUsuario,

    login,
    logout
  }

})
```


src/views/LoginView.vue

```vue
<script setup>
import { ref } from 'vue'

import UserAuth
from '@/components/UserAuth.vue'

import { useAuthStore }
from '@/stores/authStore'

const authStore =
  useAuthStore()

const email = ref('')
const password = ref('')

const iniciarSesion = () => {

  const resultado =
    authStore.login(
      email.value,
      password.value
    )

  if (!resultado) {

    alert(
      'Usuario o contraseña incorrectos'
    )

  }

}
</script>

<template>

  <UserAuth />

  <h1>Login</h1>

  <form
    @submit.prevent="iniciarSesion"
  >

    <input
      v-model="email"
      type="email"
      placeholder="Email"
    >

    <input
      v-model="password"
      type="password"
      placeholder="Contraseña"
    >

    <button>
      Iniciar sesión
    </button>

  </form>

  <button
    @click="authStore.logout"
  >
    Cerrar sesión
  </button>

</template>
```

src/components/UserAuth.vue

```vue
<script setup>
import { useAuthStore }
from '@/stores/authStore'

const authStore =
  useAuthStore()
</script>

<template>

  <div
    v-if="authStore.isAutenticado"
  >

    <h2>
      Bienvenido
      {{ authStore.nombreUsuario }}
    </h2>

    <p>
      {{ authStore.usuario.email }}
    </p>

    <p>
      Token:
      {{ authStore.token }}
    </p>

  </div>

  <div v-else>

    <h2>
      No has iniciado sesión
    </h2>

  </div>

</template>
```


























<br>
<br>
<br>
<br>


### Tema Dark / Light

> Un store puede gestionar la apariencia visual de la aplicación, permitiendo cambiar entre modo claro y oscuro desde cualquier componente.


<br>

src/stores/themeStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useThemeStore = defineStore('theme', () => {

  // STATE
  const dark = ref(
    localStorage.getItem('dark') === 'true'
  )

  // GETTERS
  const isDark = computed(() => dark.value)

  const themeText = computed(() => {
    return dark.value
      ? '☀️ Light'
      : '🌙 Dark'
  })

  const themeClass = computed(() => {
    return dark.value
      ? 'dark'
      : 'light'
  })

  // ACTIONS
  const toggleTheme = () => {
    dark.value = !dark.value

    localStorage.setItem(
      'dark',
      dark.value
    )
  }

  const setDark = () => {
    dark.value = true

    localStorage.setItem(
      'dark',
      true
    )
  }

  const setLight = () => {
    dark.value = false

    localStorage.setItem(
      'dark',
      false
    )
  }

  return {
    dark,

    isDark,
    themeText,
    themeClass,

    toggleTheme,
    setDark,
    setLight
  }

})
```

src/components/ButtonTheme.vue

```vue
<script setup>
import { useThemeStore }
from '@/stores/themeStore'

const themeStore =
  useThemeStore()
</script>

<template>

  <button
    @click="themeStore.toggleTheme"
  >
    {{ themeStore.themeText }}
  </button>

</template>
```


App.vue
```vue
<script setup>
import { useThemeStore }
from '@/stores/themeStore'

import ButtonTheme
from '@/components/ButtonTheme.vue'

const themeStore =
  useThemeStore()
</script>

<template>

  <div
    class="app"
    :class="themeStore.themeClass"
  >

    <ButtonTheme />

    <h1>
      Aplicación
    </h1>

    <p>
      Tema actual:
      {{ themeStore.isDark ? 'Dark' : 'Light' }}
    </p>

  </div>

</template>

<style scoped>
.app {
  min-height: 100vh;
  padding: 30px;
}

.light {
  background-color: white;
  color: #222;
}

.dark {
  background-color: #222;
  color: white;
}
</style>
```


























<br>
<br>
<br>
<br>




### Carrito de compras

> Pinia facilita la gestión de productos agregados al carrito, cantidades, totales y otras operaciones comunes en aplicaciones de comercio electrónico.


src/stores/cartStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'



export const useCartStore = defineStore('cart', () => {
    
    // STATE, GETTERS, ACTIONS


    // STATE - datos
    const carrito = ref([])


    //GETTERS - calculos
    const total = computed(() => {
        return carrito.value.reduce(
            (acumulador, producto) => acumulador + producto.precio,
            0
        )
        
    })
     
    // ACTIONS - funciones
    const addToCart = (producto) => {
        carrito.value.push(producto)
    }

    const removeFromCart = (index) => {
        carrito.value = carrito.value.filter(
            (producto, indexEnrrito) => indexEnrrito !== index
        )
    }

    return {
        carrito,
        addToCart,
        removeFromCart,
        total
    }


})
```




src/views/ProductsView.vue
```vue
<script setup>
import CounterDisplay from '@/components/CounterDisplay.vue';
import CounterButton from '@/components/CounterButton.vue';
import {productos} from '../data/products'

import { useCartStore } from '@/stores/cartStore'
const cartStore = useCartStore()

const comprar = (producto) => {
  cartStore.addToCart(producto)
}


</script>

<template>
  <div>
    <h1>Productos</h1>
  
    <CounterDisplay />
    <CounterButton />

    <ul>
      <li v-for="producto in productos" :key="producto.id">
        {{ producto.nombre }} - {{ producto.precio }}

        <button @click="comprar(producto)">Agregar a carrito</button>
      </li>
    </ul>

  </div>
</template>

<style scoped>

li{
  list-style: none;
  width: 200px;
  height: 100px;
  padding: 10px;
  margin: 10px;
  border: 1px solid #ccc;
}
</style>
```

src/views/CartView.vue
```vue
<script setup>

import { useCartStore } from '@/stores/cartStore'

const cartStore = useCartStore()


</script>

<template>
  <div>
    <h1>Carrito</h1>
    
    <ul>
      <li v-for="(item, index) in cartStore.carrito"
        :key="item.id">
        {{ item.nombre }} - {{ item.precio }}


        <button @click="cartStore.removeFromCart(index)">
            Eliminar
        </button>
      </li>
    </ul>

    <h2>Total: {{ cartStore.total }}</h2>


  </div>
</template>

<style scoped>

</style>
```




































<br>
<br>
<br>
<br>




### Favoritos

> Permite almacenar elementos marcados como favoritos y acceder a ellos desde distintas secciones de la aplicación.


stores/favoriteStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useFavoriteStore = defineStore(
  'favorites',
  () => {

    // STATE
    const favoritos = ref([])

    // GETTERS
    const totalFavoritos = computed(() => {
      return favoritos.value.length
    })

    const isFavorite = (id) => {
      return favoritos.value.some(
        producto => producto.id === id
      )
    }

    // ACTIONS
    const toggleFavorito = (producto) => {

      const index =
        favoritos.value.findIndex(
          p => p.id === producto.id
        )

      if (index >= 0) {

        favoritos.value.splice(
          index,
          1
        )

      } else {

        favoritos.value.push(
          producto
        )

      }

    }

    return {
      favoritos,
      totalFavoritos,
      isFavorite,
      toggleFavorito
    }

  }
)
```




src/views/Products.vue en script
```js
import { useFavoriteStore }
from '@/stores/favoriteStore'

const favoriteStore = useFavoriteStore()
```
src/views/Products.vue en TEMPLATE EN v-for

```html
  <button
    @click="
      favoriteStore.toggleFavorito(
        producto
      )
    "
  >
    {{
      favoriteStore.isFavorite(
        producto.id
      )
        ? '❤️ Quitar'
        : '🤍 Favorito'
    }}
  </button>
```

src/views/FavoritesView.vue
```vue
<script setup>
import { useFavoriteStore }
from '@/stores/favoriteStore'

const favoriteStore =
  useFavoriteStore()
</script>

<template>

  <h1>
    Mis Favoritos
  </h1>

  <ul>

    <li
      v-for="
        producto
        in favoriteStore.favoritos
      "
      :key="producto.id"
    >

      {{ producto.nombre }}

    </li>

  </ul>

</template>
```










































<br>
<br>
<br>
<br>


### Configuraciones globales

> Las configuraciones compartidas, como idioma, preferencias o ajustes de usuario, pueden administrarse de forma centralizada mediante un store.

src/stores/settingsStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useSettingsStore = defineStore(
  'settings',
  () => {

    // STATE
    const idioma = ref('es')
    const moneda = ref('CLP')
    const notificaciones = ref(true)
    const productosPorPagina = ref(10)

    // GETTERS
    const idiomaActual = computed(() => {
      return idioma.value === 'es'
        ? 'Español'
        : 'Inglés'
    })

    const monedaActual = computed(() => {
      return moneda.value
    })

    const notificacionesTexto = computed(() => {
      return notificaciones.value
        ? 'Activadas'
        : 'Desactivadas'
    })

    const resumenConfiguracion = computed(() => {
      return `
        Idioma: ${idiomaActual.value},
        Moneda: ${moneda.value},
        Notificaciones: ${notificacionesTexto.value},
        Productos por página: ${productosPorPagina.value}
      `
    })

    // ACTIONS
    const cambiarIdioma = (nuevoIdioma) => {
      idioma.value = nuevoIdioma
    }

    const cambiarMoneda = (nuevaMoneda) => {
      moneda.value = nuevaMoneda
    }

    const toggleNotificaciones = () => {
      notificaciones.value =
        !notificaciones.value
    }

    const cambiarProductosPorPagina = (cantidad) => {
      productosPorPagina.value = cantidad
    }

    return {
      // state
      idioma,
      moneda,
      notificaciones,
      productosPorPagina,

      // getters
      idiomaActual,
      monedaActual,
      notificacionesTexto,
      resumenConfiguracion,

      // actions
      cambiarIdioma,
      cambiarMoneda,
      toggleNotificaciones,
      cambiarProductosPorPagina
    }

  }
)
```


src/components/SettingsPanel.vue
```vue
<script setup>
import { useSettingsStore }
from '@/stores/settingsStore'

const settingsStore =
  useSettingsStore()
</script>

<template>

  <section>
    <h2>
      Configuración
    </h2>

    <h3>
      Idioma
    </h3>

    <button
      @click="
        settingsStore.cambiarIdioma('es')
      "
    >
      Español
    </button>

    <button
      @click="
        settingsStore.cambiarIdioma('en')
      "
    >
      Inglés
    </button>

    <h3>
      Moneda
    </h3>

    <button
      @click="
        settingsStore.cambiarMoneda('CLP')
      "
    >
      CLP
    </button>

    <button
      @click="
        settingsStore.cambiarMoneda('USD')
      "
    >
      USD
    </button>

    <h3>
      Notificaciones
    </h3>

    <button
      @click="
        settingsStore.toggleNotificaciones()
      "
    >
      Cambiar notificaciones
    </button>

    <h3>
      Productos por página
    </h3>

    <button
      @click="
        settingsStore.cambiarProductosPorPagina(10)
      "
    >
      10
    </button>

    <button
      @click="
        settingsStore.cambiarProductosPorPagina(20)
      "
    >
      20
    </button>

  </section>

</template>
```


src/components/SettingsDisplay.vue
```vue
<script setup>
import { useSettingsStore }
from '@/stores/settingsStore'

const settingsStore =
  useSettingsStore()
</script>

<template>

  <section>
    <h2>
      Configuración actual
    </h2>

    <p>
      Idioma:
      {{ settingsStore.idiomaActual }}
    </p>

    <p>
      Moneda:
      {{ settingsStore.monedaActual }}
    </p>

    <p>
      Notificaciones:
      {{ settingsStore.notificacionesTexto }}
    </p>

    <p>
      Productos por página:
      {{ settingsStore.productosPorPagina }}
    </p>

  </section>

</template>
```


views/SettingsView.vue
```vue
<script setup>
import SettingsPanel
from '@/components/SettingsPanel.vue'

import SettingsDisplay
from '@/components/SettingsDisplay.vue'
</script>

<template>

  <main>
    <h1>
      Configuraciones globales
    </h1>

    <SettingsPanel />

    <hr>

    <SettingsDisplay />
  </main>

</template>
```


















<br>
<br>
<br>
<br>


### Manejo de Formularios


> Pinia puede utilizarse para almacenar y sincronizar información de formularios complejos entre distintas vistas o componentes.

src/stores/formStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useFormStore = defineStore(
  'form',
  () => {

    // STATE
    const nombre = ref('')
    const email = ref('')
    const mensaje = ref('')

    // GETTERS
    const formularioCompleto = computed(() => {
      return (
        nombre.value.trim() !== '' &&
        email.value.trim() !== '' &&
        mensaje.value.trim() !== ''
      )
    })

    const resumenFormulario = computed(() => {
      return {
        nombre: nombre.value,
        email: email.value,
        mensaje: mensaje.value
      }
    })

    const cantidadCaracteres = computed(() => {
      return mensaje.value.length
    })

    // ACTIONS
    const actualizarFormulario = (datos) => {
      nombre.value = datos.nombre
      email.value = datos.email
      mensaje.value = datos.mensaje
    }

    const limpiarFormulario = () => {
      nombre.value = ''
      email.value = ''
      mensaje.value = ''
    }

    const enviarFormulario = () => {
      if (!formularioCompleto.value) {
        alert('Completa todos los campos')
        return
      }

      console.log('Formulario enviado:', {
        nombre: nombre.value,
        email: email.value,
        mensaje: mensaje.value
      })

      limpiarFormulario()
    }

    return {
      // state
      nombre,
      email,
      mensaje,

      // getters
      formularioCompleto,
      resumenFormulario,
      cantidadCaracteres,

      // actions
      actualizarFormulario,
      limpiarFormulario,
      enviarFormulario
    }

  }
)
```

src/components/FormContact.vue

```vue
<script setup>
import { useFormStore }
from '@/stores/formStore'

const formStore =
  useFormStore()
</script>

<template>

  <section>
    <h2>
      Formulario de contacto
    </h2>

    <input
      v-model="formStore.nombre"
      placeholder="Nombre"
    >

    <input
      v-model="formStore.email"
      type="email"
      placeholder="Email"
    >

    <textarea
      v-model="formStore.mensaje"
      placeholder="Mensaje"
    />

    <p>
      Caracteres:
      {{ formStore.cantidadCaracteres }}
    </p>

    <button
      @click="formStore.enviarFormulario"
      :disabled="!formStore.formularioCompleto"
    >
      Enviar
    </button>

    <button
      @click="formStore.limpiarFormulario"
    >
      Limpiar
    </button>

  </section>

</template>
```

src/components/FormPreview.vue

```vue
<script setup>
import { useFormStore }
from '@/stores/formStore'

const formStore =
  useFormStore()
</script>

<template>

  <section>
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

    <p>
      ¿Formulario completo?
      {{ formStore.formularioCompleto ? 'Sí' : 'No' }}
    </p>

  </section>

</template>
```

src/views/FormView.vue

```vue
<script setup>
import FormContact
from '@/components/FormContact.vue'

import FormPreview
from '@/components/FormPreview.vue'
</script>

<template>

  <main>
    <h1>
      Manejo de formularios con Pinia
    </h1>

    <FormContact />

    <hr>

    <FormPreview />
  </main>

</template>
```


















































<br>
<br>
<br>
<br>


### Utilizando Pinia y Axios

> Es común combinar Pinia con Axios para obtener datos desde APIs y almacenarlos en un estado global accesible desde toda la aplicación.


- Instalar Axios `npm install axios`

<br>

src/stores/userStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import axios from 'axios'

export const useUserStore = defineStore(
  'users',
  () => {

    // STATE
    const usuarios = ref([])
    const cargando = ref(false)
    const error = ref(null)

    // GETTERS
    const totalUsuarios = computed(() => {
      return usuarios.value.length
    })

    const hayUsuarios = computed(() => {
      return usuarios.value.length > 0
    })

    const nombresUsuarios = computed(() => {
      return usuarios.value.map(
        usuario => usuario.name
      )
    })

    // ACTIONS
    const cargarUsuarios = async () => {

      cargando.value = true
      error.value = null

      try {

        const { data } =
          await axios.get(
            'https://jsonplaceholder.typicode.com/users'
          )

        usuarios.value = data

      } catch (err) {

        error.value =
          'Error al cargar usuarios'

        console.error(err)

      } finally {

        cargando.value = false

      }

    }

    const limpiarUsuarios = () => {
      usuarios.value = []
    }

    return {
      // state
      usuarios,
      cargando,
      error,

      // getters
      totalUsuarios,
      hayUsuarios,
      nombresUsuarios,

      // actions
      cargarUsuarios,
      limpiarUsuarios
    }

  }
)
```

src/components/UserList.vue

```vue
<script setup>
import { onMounted } from 'vue'

import { useUserStore }
from '@/stores/userStore'

const userStore =
  useUserStore()

onMounted(() => {
  userStore.cargarUsuarios()
})
</script>

<template>

  <section>
    <h2>
      Usuarios
    </h2>

    <p>
      Total:
      {{ userStore.totalUsuarios }}
    </p>

    <p v-if="userStore.cargando">
      Cargando...
    </p>

    <p v-else-if="userStore.error">
      {{ userStore.error }}
    </p>

    <ul v-else>

      <li
        v-for="usuario in userStore.usuarios"
        :key="usuario.id"
      >
        {{ usuario.name }}
        -
        {{ usuario.email }}
      </li>

    </ul>

    <button
      @click="userStore.limpiarUsuarios"
    >
      Limpiar usuarios
    </button>

  </section>

</template>
```

src/views/UsersView.vue

```vue
<script setup>
import UserList
from '@/components/UserList.vue'
</script>

<template>

  <main>
    <h1>
      Pinia + Axios
    </h1>

    <UserList />
  </main>

</template>
```




























































































































<br>
<br>
<br>
<br>
<br>
<br>



---

## Rutas Protegidas

> Las rutas protegidas permiten restringir el acceso a determinadas páginas según condiciones específicas, como la autenticación de un usuario almacenada en Pinia.



src/stores/authStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useAuthStore = defineStore(
  'auth',
  () => {

    // STATE

    const usuario = ref(null)
    const token = ref(null)
    const autenticado = ref(false)

    // GETTERS

    const isLogged = computed(() => {
      return autenticado.value
    })

    // ACTIONS

    const login = (
      email,
      password
    ) => {

      if (
        email === 'admin@test.com' &&
        password === '123456'
      ) {

        usuario.value = {
          id: 1,
          nombre: 'Administrador',
          email
        }

        token.value = 'abc123token'

        autenticado.value = true

        return true

      }

      return false

    }

    const logout = () => {

      usuario.value = null
      token.value = null
      autenticado.value = false

    }

    return {
      usuario,
      token,
      autenticado,

      isLogged,

      login,
      logout
    }

  }
)
```



src/views/DashboardView.vue

```vue
<script setup>
import { useAuthStore }
from '@/stores/authStore'

const authStore =
  useAuthStore()
</script>

<template>

  <h1>
    Dashboard
  </h1>

  <h2>
    Bienvenido
    {{ authStore.usuario.nombre }}
  </h2>

</template>
```

src/router/index.js

```js
import {
  createRouter,
  createWebHistory
}
from 'vue-router'

import LoginView
from '@/views/LoginView.vue'

import DashboardView
from '@/views/DashboardView.vue'

import { useAuthStore }
from '@/stores/authStore'

const routes = [

  {
    path: '/',
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
    !authStore.isLogged
  ) {

    return {
      name: 'login'
    }

  }

})

export default router
```

src/views/LoginView.vue

Después del login exitoso:

```vue
<script setup>
import { ref } from 'vue'

import { useRouter }
from 'vue-router'

import { useAuthStore }
from '@/stores/authStore'

const router =
  useRouter()

const authStore =
  useAuthStore()

const email =
  ref('')

const password =
  ref('')

const iniciarSesion = () => {

  const resultado =
    authStore.login(
      email.value,
      password.value
    )

  if (resultado) {

    router.push({
      name: 'dashboard'
    })

  } else {

    alert(
      'Credenciales incorrectas'
    )

  }

}
</script>
```






App.vue

```vue
<script setup>
import { useAuthStore } from '@/stores/authStore'

const authStore = useAuthStore()
</script>

<template>
  <nav>
    <router-link to="/">
      Home
    </router-link>

    <router-link
      v-if="!authStore.isAutenticado"
      to="/login"
    >
      Login
    </router-link>

    <router-link
      v-if="authStore.isAutenticado"
      to="/dashboard"
    >
      Dashboard
    </router-link>
  </nav>
</template>
```


## ★
