#  Enlace de Datos

data binding



---

## Índice

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




<br>
<br>
<br>
<br>
<br>
<br>

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



<br>
<br>
<br>
<br>
<br>
<br>

---

## Directivas

...

<br>
<br>

### Directiva `v-bind`

```vue
<script setup>
	const imagen = "https://picsum.photos/200"
</script>

<template>
  <img :src="imagen">
</template>

```



<br>
<br>

### Directiva `v-model`
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









<br>
<br>

### Directiva `v-for`

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




<br>
<br>

### Directiva `v-if`
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

















<br>
<br>

### Directiva `v-show`
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










<br>
<br>

### Directiva `v-on`
Escucha eventos.

```vue
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
```




<br>
<br>

### Directiva `v-text`
Inserta texto.

```vue
<template>
<p v-text="mensaje"></p>
</template>

<script setup>
const mensaje = "Hola :)"
</script>
```



<br>
<br>

### Directiva `v-html`
Inserta HTML real.

```vue
<template>
<div v-html="html"></div>
</template>

<script setup>
const html = "<h1>Hola 🚀</h1>"
</script>
```





<br>
<br>

### Directiva `v-cloak`
Oculta contenido hasta que Vue cargue.

```vue
<template>
<h1 v-cloak>
    {{ mensaje }}
</h1>
</template>

<script setup>
const mensaje = "Hola 😎"
</script>
```


<br>
<br>

### Directiva `v-once`
Renderiza SOLO una vez.

```vue
<template>
<h1 v-once>
    {{ mensaje }}
</h1>
</template>

<script setup>
const mensaje = "Hola 🚀"
</script>
```