Claro. Antes de mezclarlo con Pinia, yo enseñaría primero **LocalStorage puro con Vue**.

---

# Guardar en LocalStorage

Supongamos un input para guardar el nombre.

```vue
<script setup>
import { ref } from 'vue'

const name = ref('')

function saveName() {
  localStorage.setItem(
    'userName',
    name.value
  )
}
</script>

<template>
  <input
    v-model="name"
    type="text"
    placeholder="Nombre"
  >

  <button @click="saveName">
    Guardar
  </button>
</template>
```

---

## ¿Qué hace?

```js
localStorage.setItem(
  'userName',
  name.value
)
```

Guarda:

```txt
Clave: userName
Valor: Patricio
```

---

# Rescatar desde LocalStorage

```vue
<script setup>
import { ref } from 'vue'

const savedName = ref('')

function loadName() {
  savedName.value = localStorage.getItem(
    'userName'
  )
}
</script>

<template>
  <button @click="loadName">
    Cargar nombre
  </button>

  <h2>
    {{ savedName }}
  </h2>
</template>
```

---

# Guardar automáticamente

Normalmente no usamos botones.

```vue
<script setup>
import { ref, watch } from 'vue'

const name = ref('')

watch(name, () => {
  localStorage.setItem(
    'userName',
    name.value
  )
})
</script>

<template>
  <input
    v-model="name"
    type="text"
  >
</template>
```

Cada vez que escribes:

```txt
P
Pa
Pat
Pato
```

se guarda automáticamente.

---

# Cargar al iniciar

```vue
<script setup>
import { ref } from 'vue'

const name = ref(
  localStorage.getItem('userName') || ''
)
</script>
```

Si existe:

```txt
Patricio
```

lo carga.

Si no existe:

```txt
''
```

deja vacío.

---

# Guardar objetos

LocalStorage solo guarda texto.

Esto NO funciona bien:

```js
localStorage.setItem(
  'user',
  {
    name: 'Patricio'
  }
)
```

Resultado:

```txt
[object Object]
```

---

## JSON.stringify()

```js
const user = {
  name: 'Patricio',
  email: 'pato@email.com',
}

localStorage.setItem(
  'user',
  JSON.stringify(user)
)
```

---

## JSON.parse()

```js
const user = JSON.parse(
  localStorage.getItem('user')
)
```

Resultado:

```js
{
  name: 'Patricio',
  email: 'pato@email.com'
}
```

---

# Ejemplo típico: Dark Mode

Guardar:

```js
function toggleTheme() {
  theme.value =
    theme.value === 'light'
      ? 'dark'
      : 'light'

  localStorage.setItem(
    'theme',
    theme.value
  )
}
```

Cargar:

```js
const theme = ref(
  localStorage.getItem('theme') || 'light'
)
```

---

# Ejemplo típico: Usuario logueado

Guardar:

```js
localStorage.setItem(
  'user',
  JSON.stringify(user)
)
```

Recuperar:

```js
const user = ref(
  JSON.parse(
    localStorage.getItem('user')
  ) || null
)
```

---

# Ejemplo típico: Carrito

Guardar:

```js
localStorage.setItem(
  'cart',
  JSON.stringify(cart.value)
)
```

Recuperar:

```js
const cart = ref(
  JSON.parse(
    localStorage.getItem('cart')
  ) || []
)
```

---

## Resumen rápido

```txt
Guardar texto
localStorage.setItem('name', 'Patricio')

Leer texto
localStorage.getItem('name')

Eliminar
localStorage.removeItem('name')

Vaciar todo
localStorage.clear()

Guardar objeto
JSON.stringify()

Recuperar objeto
JSON.parse()
```

Y después de entender esto, el siguiente paso es mostrar cómo hacer que **Pinia guarde automáticamente en LocalStorage** para que el carrito, favoritos o usuario sobrevivan al F5. Ahí es donde ambos se combinan muy bien. 🚀
