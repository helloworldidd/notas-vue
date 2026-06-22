# Inicialización


---

## Índice

- [Instalación](#instalación)
- [Extenciones](#extenciones)
- [Estructura](#estructura)



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








---

## Extenciones

https://marketplace.visualstudio.com/items?itemName=Vue.volar

https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets











---

## Estructura


- **index.html**
- **main.js**
```vue
import './assets/sass/main.scss'

import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
```


- **App.js**

```vue
<script setup>

</script>

<template>

</template>

<style scoped >

</style>
```
