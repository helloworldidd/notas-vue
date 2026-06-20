#  Enlace de Datos  (data binding)

---
## indice

- [Interpolación](#interpolación)
- Directivas:
  - [v-bind](#directiva-v-bind)
  - [v-model](#directiva-v-model)
  - [v-for](#directiva-v-for)
  - [v-if](#directiva-v-if)
  - [v-show](#directiva-v-show)
  - [v-on](#directiva-v-on)
  - [v-text](#directiva-v-text)
  - [v-html](#directiva-v-html)
  - [v-cloak](#directiva-v-cloak)
  - [v-once](#directiva-v-once)



---

##  Interpolación

```vue
<script setup>
const mensaje = "Hola 😎";
</script>

<template>
  <p>{{ mensaje }}</p>
</template>

```




---

## Directiva `v-bind`

```vue
<script setup>
	const imagen = "https://picsum.photos/200"
</script>

<template>
  <img :src="imagen">
</template>

```



---

## Directiva `v-model`
(Two-way binding)


```vue
<script setup>
import { ref } from 'vue';
const mensaje = ref("Hola");
</script>

<template>
  <input v-model="mensaje">
  <p>{{ mensaje }}</p>
</template>

```









---

## Directiva `v-for`

```vue
<script setup>
const frutas = [
  "Manzana",
  "Pera",
  "Plátano",
  "Frutilla"
]
</script>

<template>
  <ul>
    <li v-for="fruta in frutas">
      {{ fruta }}
    </li>
  </ul>
</template>
```




---

## Directiva `v-if`
mostrar o ocultar HTML según una condición 🚀

```vue
<script setup>
const mostrar = true
</script>
<template>

<h1 v-if="mostrar">
    Hola Vue 😎
</h1>
</template>
```

















---

## Directiva `v-show`
También muestra u oculta elementos.
La diferencia es que: v-show usa CSS

```vue
<script setup>
const mostrar = true
</script>

<template>
<h1 v-show="mostrar">
  Hola Vue 🚀
</h1>
</template>
```










---

## Directiva `v-on`
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

## Directiva `v-text`
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
