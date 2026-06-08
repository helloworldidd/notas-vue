#  Enlace de Datos  (data binding)


---

##  One-way 

```vue
<template>
  <p>{{ mensaje }}</p>
</template>

<script setup>
const mensaje = "Hola 😎";
</script>
```




---

## Directiva v-bind

```vue
<template>
  <img :src="imagen">
</template>

<script setup>
	const imagen = "https://picsum.photos/200"
</script>
```



---

## Directiva v-model
(Two-way binding)


```vue
<template>
  <input v-model="mensaje">
  <p>{{ mensaje }}</p>
</template>

<script setup>
import { ref } from 'vue';
const mensaje = ref("Hola");
</script>
```









---

## Directiva v-for
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




---

## Directiva v-if
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

















---

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





---

## Directiva `v-model`
Hace: Two-way binding

<template>
<input v-model="mensaje">
<p>{{ mensaje }}</p>
</template>

<script setup>
import { ref } from 'vue'
const mensaje = ref("Hola :)")
</script>


---

## Directiva `v-bind`
Conecta atributos HTML.

<template>
<img :src="imagen">
</template>

<script setup>
const imagen = "https://picsum.photos/200"
</script>





---

## Directiva `v-on` 😎
Escucha eventos.

<template>
<button @click="saludar">
    Click :)
</button>
</template>

<script setup>
function saludar() {
alert("Hola Vue 🚀")
}
</script>





---

## Directiva `v-text` :)
Inserta texto.

<template>
<p v-text="mensaje"></p>
</template>

<script setup>
const mensaje = "Hola :)"
</script>




---

## Directiva `v-html`
Inserta HTML real.

<template>
<div v-html="html"></div>
</template>

<script setup>
const html = "<h1>Hola 🚀</h1>"
</script>






---

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



---

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
