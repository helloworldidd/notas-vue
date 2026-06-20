# Animate.css

---

## ¿Qué es?

Animate.css es una librería que incluye animaciones listas para usar mediante clases CSS.

Permite agregar efectos como:

- Fade In
- Fade Out
- Bounce
- Zoom
- Slide
- Flip
- Pulse
- Shake

Sitio oficial:

https://animate.style/

---

## Instalación

```sh
npm install animate.css
```

---

## Importar la librería

### Opción 1: Desde main.js (recomendado)

```js
import 'animate.css';
```

---

### Opción 2: Desde un archivo SCSS

```scss
@use "animate.css/animate.min.css";
```

---

## Uso básico

Agregar las clases:

```html
animate__animated
animate__nombreAnimacion
```

Ejemplo:

```vue
<template>
  <h1 class="animate__animated animate__bounce">
    Hola Vue
  </h1>
</template>
```

---

## Animaciones comunes

```txt
animate__fadeIn
animate__fadeOut

animate__bounce

animate__zoomIn
animate__zoomOut

animate__slideInLeft
animate__slideInRight

animate__slideOutLeft
animate__slideOutRight

animate__flip

animate__pulse

animate__shakeX
animate__shakeY

animate__tada
```

---

## Velocidad

```html
<h1 class="animate__animated animate__bounce animate__slow">
  Hola
</h1>
```

Clases disponibles:

```txt
animate__slow
animate__slower

animate__fast
animate__faster
```

---

## Repetir animación

```html
<h1 class="animate__animated animate__pulse animate__infinite">
  Hola
</h1>
```

---

## Animar al renderizar un componente

```vue
<template>
  <div class="animate__animated animate__fadeIn">
    Contenido cargado
  </div>
</template>
```

La animación se ejecutará cuando el componente aparezca en pantalla.

---

## En Vue con v-if

```vue
<template>
  <button @click="mostrar = !mostrar">
    Mostrar
  </button>

  <div
    v-if="mostrar"
    class="animate__animated animate__zoomIn"
  >
    Hola Vue
  </div>
</template>

<script setup>
import { ref } from 'vue'

const mostrar = ref(false)
</script>
```

---

## Documentación oficial

https://animate.style/

---

## Chuleta rápida

```sh
npm install animate.css
```

```js
import 'animate.css'
```

```html
<div class="animate__animated animate__fadeIn">
  Contenido
</div>
```