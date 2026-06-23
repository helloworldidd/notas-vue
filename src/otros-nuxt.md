# Nuxt

> Nuxt es un framework basado en Vue que permite crear aplicaciones web modernas con rutas automáticas, componentes, layouts, páginas y también backend dentro del mismo proyecto.

Nuxt usa una estructura de carpetas con convenciones para automatizar tareas comunes del desarrollo. :contentReference[oaicite:0]{index=0}

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 1. Requisitos

Antes de crear el proyecto necesitas tener instalado:

```bash
node -v
npm -v
```

Si ambos comandos muestran una versión, puedes continuar.

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 2. Crear el proyecto

En la terminal ejecuta:

```bash
npm create nuxt@latest mi-proyecto-nuxt
```

Este comando crea un nuevo proyecto Nuxt desde cero. :contentReference[oaicite:1]{index=1}

Luego entra a la carpeta:

```bash
cd mi-proyecto-nuxt
```

Instala las dependencias:

```bash
npm install
```

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 3. Levantar el servidor local

Ejecuta:

```bash
npm run dev
```

Luego abre el navegador en:

```txt
http://localhost:3000
```

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 4. Estructura básica del proyecto

Una estructura simple puede verse así:

```txt
mi-proyecto-nuxt/
├── app/
│   ├── app.vue
│   ├── pages/
│   │   ├── index.vue
│   │   └── productos.vue
│   └── components/
│       └── ProductCard.vue
│
├── public/
├── nuxt.config.ts
├── package.json
└── README.md
```

Nuxt organiza el proyecto usando carpetas especiales, como `pages`, `components`, `layouts` y `server`. :contentReference[oaicite:2]{index=2}

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 5. Archivo principal: `app.vue`

Ruta:

```txt
app/app.vue
```

Código:

```vue
<template>
  <div>
    <h1>Mi primera app con Nuxt</h1>

    <nav>
      <NuxtLink to="/">Inicio</NuxtLink>
      <NuxtLink to="/productos">Productos</NuxtLink>
    </nav>

    <NuxtPage />
  </div>
</template>
```

`<NuxtPage />` permite mostrar las páginas creadas dentro de la carpeta `pages`. :contentReference[oaicite:3]{index=3}

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 6. Crear una página de inicio

Ruta:

```txt
app/pages/index.vue
```

Código:

```vue
<template>
  <section>
    <h2>Inicio</h2>
    <p>Bienvenido a mi proyecto en Nuxt.</p>
  </section>
</template>
```

Nuxt crea rutas automáticamente desde los archivos dentro de `pages`. Por ejemplo, `index.vue` se transforma en `/`. :contentReference[oaicite:4]{index=4}

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 7. Crear una página de productos

Ruta:

```txt
app/pages/productos.vue
```

Código:

```vue
<script setup>
const productos = [
  {
    id: 1,
    nombre: 'Mouse',
    precio: 10000
  },
  {
    id: 2,
    nombre: 'Teclado',
    precio: 15000
  },
  {
    id: 3,
    nombre: 'Monitor',
    precio: 120000
  }
]
</script>

<template>
  <section>
    <h2>Productos</h2>

    <ul>
      <li v-for="producto in productos" :key="producto.id">
        {{ producto.nombre }} - ${{ producto.precio }}
      </li>
    </ul>
  </section>
</template>
```

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 8. Crear un componente

Ruta:

```txt
app/components/ProductCard.vue
```

Código:

```vue
<script setup>
defineProps({
  producto: {
    type: Object,
    required: true
  }
})
</script>

<template>
  <article>
    <h3>{{ producto.nombre }}</h3>
    <p>Precio: ${{ producto.precio }}</p>
  </article>
</template>
```

Nuxt importa automáticamente los componentes que están dentro de la carpeta `components`. :contentReference[oaicite:5]{index=5}

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 9. Usar el componente en la página

Actualizar:

```txt
app/pages/productos.vue
```

Código:

```vue
<script setup>
const productos = [
  {
    id: 1,
    nombre: 'Mouse',
    precio: 10000
  },
  {
    id: 2,
    nombre: 'Teclado',
    precio: 15000
  },
  {
    id: 3,
    nombre: 'Monitor',
    precio: 120000
  }
]
</script>

<template>
  <section>
    <h2>Productos</h2>

    <ProductCard
      v-for="producto in productos"
      :key="producto.id"
      :producto="producto"
    />
  </section>
</template>
```

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 10. Agregar estilos simples

Ruta:

```txt
app/app.vue
```

Código:

```vue
<template>
  <div class="layout">
    <h1>Mi primera app con Nuxt</h1>

    <nav>
      <NuxtLink to="/">Inicio</NuxtLink>
      <NuxtLink to="/productos">Productos</NuxtLink>
    </nav>

    <NuxtPage />
  </div>
</template>

<style>
.layout {
  max-width: 900px;
  margin: 0 auto;
  padding: 32px;
  font-family: Arial, sans-serif;
}

nav {
  display: flex;
  gap: 16px;
  margin-bottom: 24px;
}

a {
  color: #42b883;
}
</style>
```

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 11. Crear una API interna simple

Nuxt también permite crear endpoints backend dentro del proyecto.

Ruta:

```txt
server/api/saludo.js
```

Código:

```js
export default defineEventHandler(() => {
  return {
    mensaje: 'Hola desde la API de Nuxt'
  }
})
```

La carpeta `server/` permite registrar rutas API y lógica backend dentro de Nuxt. :contentReference[oaicite:6]{index=6}

La API queda disponible en:

```txt
http://localhost:3000/api/saludo
```

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 12. Consumir la API desde una página

Ruta:

```txt
app/pages/index.vue
```

Código:

```vue
<script setup>
const { data } = await useFetch('/api/saludo')
</script>

<template>
  <section>
    <h2>Inicio</h2>
    <p>{{ data.mensaje }}</p>
  </section>
</template>
```

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 13. Convenciones recomendadas

```txt
Componentes: ProductCard.vue
Páginas: productos.vue / index.vue
Carpetas: components, pages, layouts, server
Variables: camelCase
Constantes: MAYÚSCULAS
```

En Vue y Nuxt conviene mantener nombres claros para componentes, vistas, servicios y composables, porque ayuda a ordenar mejor el proyecto. :contentReference[oaicite:7]{index=7}

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 14. Comandos principales

```bash
npm create nuxt@latest mi-proyecto-nuxt
```

Crea el proyecto.

```bash
cd mi-proyecto-nuxt
```

Entra a la carpeta.

```bash
npm install
```

Instala las dependencias.

```bash
npm run dev
```

Levanta el servidor local.

```bash
npm run build
```

Genera la versión de producción.

















<br>
<br>
<br>
<br>
<br>
<br>

---

## 15. Resumen final

Nuxt permite trabajar con Vue, pero agrega varias ventajas:

- rutas automáticas
- componentes auto importados
- layouts reutilizables
- server/API integrada
- estructura más ordenada
- mejor preparación para proyectos grandes

En resumen:

```txt
Vue crea la interfaz.
Nuxt organiza la aplicación completa.
```

