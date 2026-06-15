En **Vuex** la idea es la misma, pero se escribe más “estructurado” y más largo.

En Pinia
```txt
state  → count
action → incrementar
```

En Vuex
```txt
state      → count
mutations  → modifican el state
actions    → llaman mutations
getters    → calculan datos
```

---

## 1. Instalar Vuex

```bash
npm install vuex@next
```

---

## 2. Crear store

```txt
src/
├─ store/
│  └─ index.js
```

`src/store/index.js`

```js
import { createStore } from 'vuex'

export default createStore({
  state() {
    return {
      count: 0,
    }
  },
})
```

---

## 3. Conectar Vuex en `main.js`

```js
import { createApp } from 'vue'
import App from './App.vue'
import store from './store'

createApp(App)
  .use(store)
  .mount('#app')
```

---

## 4. Mostrar el contador en `App.vue`

```vue
<script setup>
import { useStore } from 'vuex'

const store = useStore()
</script>

<template>
  <h1>{{ store.state.count }}</h1>
</template>
```

Verás:

```txt
0
```

---

## 5. Modificar estado con Mutation

En Vuex **no se recomienda modificar directo así**:

```vue
@click="store.state.count++"
```

Lo correcto es usar una **mutation**.

`src/store/index.js`

```js
import { createStore } from 'vuex'

export default createStore({
  state() {
    return {
      count: 0,
    }
  },

  mutations: {
    increment(state) {
      state.count++
    },
  },
})
```

Y en `App.vue`:

```vue
<script setup>
import { useStore } from 'vuex'

const store = useStore()
</script>

<template>
  <h1>{{ store.state.count }}</h1>

  <button @click="store.commit('increment')">
    +
  </button>
</template>
```

---

## 6. Separado en componentes

### `CounterDisplay.vue`

```vue
<script setup>
import { useStore } from 'vuex'

const store = useStore()
</script>

<template>
  <h2>{{ store.state.count }}</h2>
</template>
```

### `CounterButton.vue`

```vue
<script setup>
import { useStore } from 'vuex'

const store = useStore()
</script>

<template>
  <button @click="store.commit('increment')">
    Incrementar
  </button>
</template>
```

### `App.vue`

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

---

## Diferencia clave

En **Pinia** hacías:

```js
counterStore.count++
```

o:

```js
counterStore.increment()
```

En **Vuex** haces:

```js
store.commit('increment')
```

---

La idea final es la misma:

```txt
CounterDisplay lee el estado
CounterButton modifica el estado
No usamos props
No usamos emit
```

Pero Vuex agrega una capa más:

```txt
Componentes
   ↓
commit()
   ↓
mutation
   ↓
state
```

Por eso hoy se suele preferir Pinia: hace lo mismo, pero con menos código y más parecido a Vue 3.
