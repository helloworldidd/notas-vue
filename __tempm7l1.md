oo   oo  ooooooo           oo       ooooo  
ooo ooo      oo            oo         ooo  
ooooooo     oo             oo         ooo  
oo   oo   oo               oo         ooo  
oo   oo  oo                ooooooo    ooo  





# m7l1

## Estructura

```txt
src/
│
├── components/
│   ├── Padre.vue
│   └── Hijo.vue
│
├── App.vue
└── main.js
```

---

## App.vue

```vue
<script setup>
import { ref } from 'vue'
import Padre from './components/Padre.vue'

const mostrarPadre = ref(true)
</script>

<template>
  <button @click="mostrarPadre = !mostrarPadre">
    Mostrar / Ocultar Padre
  </button>

  <Padre v-if="mostrarPadre" />
</template>
```

---

## Padre.vue

```vue
<script setup>
import { ref, onMounted, onUpdated, onBeforeUnmount } from 'vue'
import Hijo from './Hijo.vue'

const mensajePadre = 'Hola desde el componente padre'
const respuesta = ref('')

const recibirRespuesta = (mensaje) => {
  respuesta.value = mensaje
}

onMounted(() => {
  console.log('Padre montado')
})

onUpdated(() => {
  console.log('Padre actualizado')
})

onBeforeUnmount(() => {
  console.log('Padre se va a desmontar')
})
</script>

<template>
  <div>
    <h2>Componente Padre</h2>

    <Hijo
      :mensaje="mensajePadre"
      @respuestaHijo="recibirRespuesta"
    />

    <p v-if="respuesta">
      {{ respuesta }}
    </p>
  </div>
</template>
```

---

## Hijo.vue

```vue
<script setup>
const props = defineProps({
  mensaje: String
})

const emit = defineEmits(['respuestaHijo'])

const enviarRespuesta = () => {
  emit(
    'respuestaHijo',
    'Hola padre, recibí tu mensaje'
  )
}
</script>

<template>
  <div>
    <h3>Componente Hijo</h3>

    <p>{{ mensaje }}</p>

    <button @click="enviarRespuesta">
      Enviar respuesta
    </button>
  </div>
</template>
```

---

# Explicación

### ¿Cómo se pasan datos con props?

Las props permiten que
un componente padre envíe
información a un componente hijo.

Ejemplo:
El componente hijo recibe ese dato mediante `defineProps()`.

```vue
<Hijo :mensaje="mensajePadre" />
```


---

### ¿Cómo se emiten eventos con emit?

Los eventos permiten que
un componente hijo envíe información al padre.

En el hijo:

```js
emit('respuestaHijo', 'Hola padre')
```

En el padre:

```vue
<Hijo @respuestaHijo="recibirRespuesta" />
```

---

### Hooks utilizados

#### onMounted()

Se ejecuta cuando el componente ya fue renderizado en pantalla.

```js
onMounted(() => {
  console.log('Padre montado')
})
```

#### onUpdated()

Se ejecuta cada vez que los datos reactivos cambian y el componente se vuelve a renderizar.

```js
onUpdated(() => {
  console.log('Padre actualizado')
})
```

#### onBeforeUnmount()

Se ejecuta justo antes de que el componente sea eliminado del DOM.

```js
onBeforeUnmount(() => {
  console.log('Padre se va a desmontar')
})
```


