# Inicialización


---

## Índice

- [Instalación](#instalación)
- [Extenciones](#extenciones)
- [Estructura](#estructura)


<br>
<br>
<br>
<br>
<br>
<br>

---

## Instalación

```sh
# opción A
npm create vite@latest

# opcion B
npm create vue@latest

cd mi-proyecto
npm i
npm run dev
```







<br>
<br>
<br>
<br>
<br>
<br>

---

## Extenciones

https://marketplace.visualstudio.com/items?itemName=Vue.volar

https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets







<br>
<br>
<br>
<br>
<br>
<br>

---

## Estructura


- **index.html**

```html
<!DOCTYPE html>
<html lang="">
  <head>
    <meta charset="UTF-8">
    <link rel="icon" href="/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vite App</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="/src/main.js"></script>
  </body>
</html>
```

- src/**main.js**

```vue
import './assets/sass/main.scss'

import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
```


- src/**App.js**

```vue
<script setup>

</script>

<template>

</template>

<style scoped >

</style>
```
