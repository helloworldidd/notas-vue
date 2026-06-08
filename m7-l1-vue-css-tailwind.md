# Estilo CSS Tailwind



--- 

## Indíce

- []()
<style>*{scroll-behavior: smooth}</style>



--- 

## 



https://tailwindcss.com/

**Tailwind CSS** es un framework Utility First que permite crear interfaces mediante clases utilitarias directamente en el HTML.

```text
Índice

- Instalación
- Estructura básica
- Grid Responsive
- Breakpoints

- Componentes
  - Botones
  - Cards
  - Inputs
  - Imágenes
  - Iconos
  - Modales
  - Navbar
  - Sidebar

- Utilidades CSS
  - Colores
  - Padding
  - Margin
  - Texto centrado
  - Flex
  - Gap

- Directivas
  - Ciclos Vue
  - Condicionales Vue

- Lo más usado
```

---

## Instalación

```bash
npm install tailwindcss @tailwindcss/vite
```

vite.config.js

```js
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  plugins: [
    vue(),
    tailwindcss(),
  ],
});
```

main.css

```css
@import "tailwindcss";
```

main.js

```js
import "./assets/main.css";
```

---

## Estructura básica

```html
<div class="container mx-auto">
  Contenido
</div>
```

Ancho completo:

```html
<div class="w-full">
  Contenido
</div>
```

---

## Grid Responsive

```html
<div class="grid grid-cols-1 md:grid-cols-2 gap-4">

  <div>
    Columna 1
  </div>

  <div>
    Columna 2
  </div>

</div>
```

---

## Breakpoints

```text
sm: 640px
md: 768px
lg: 1024px
xl: 1280px
2xl: 1536px
```

Ejemplo:

```html
<div class="w-full md:w-1/2">
  Contenido
</div>
```

---

## Componentes

### Botones

```html
<button
  class="
    bg-blue-500
    text-white
    px-4
    py-2
    rounded
  "
>
  Guardar
</button>
```

Hover:

```html
<button
  class="
    bg-blue-500
    hover:bg-blue-700
    text-white
    px-4
    py-2
    rounded
  "
>
  Guardar
</button>
```

---

### Cards

```html
<div
  class="
    bg-white
    shadow
    rounded
    p-4
  "
>
  <h2 class="text-xl font-bold">
    Título
  </h2>

  <p>
    Contenido
  </p>
</div>
```

---

### Inputs

Texto:

```html
<input
  type="text"
  class="
    border
    rounded
    px-3
    py-2
    w-full
  "
>
```

Textarea:

```html
<textarea
  class="
    border
    rounded
    px-3
    py-2
    w-full
  "
></textarea>
```

Select:

```html
<select
  class="
    border
    rounded
    px-3
    py-2
    w-full
  "
>
  <option>Vue</option>
  <option>React</option>
  <option>Angular</option>
</select>
```

Checkbox:

```html
<input type="checkbox">
```

---

### Imágenes

```html
<img
  src="imagen.jpg"
  class="
    w-full
    rounded
  "
>
```

---

### Iconos

Heroicons:

```bash
npm install @heroicons/vue
```

Ejemplo:

```vue
<HomeIcon class="w-6 h-6" />
```

---

### Modales

```html
<div
  class="
    fixed
    inset-0
    flex
    justify-center
    items-center
    bg-black/50
  "
>
  <div
    class="
      bg-white
      p-6
      rounded
    "
  >
    Hola Mundo
  </div>
</div>
```

---

### Navbar

```html
<nav
  class="
    bg-gray-800
    text-white
    p-4
  "
>
  Mi App
</nav>
```

---

### Sidebar

```html
<aside
  class="
    w-64
    min-h-screen
    bg-gray-200
    p-4
  "
>
  Menú
</aside>
```

---

## Utilidades CSS

### Colores

Texto:

```html
text-blue-500
```

Fondo:

```html
bg-blue-500
```

Ejemplos:

```text
red-500
blue-500
green-500
yellow-500
purple-500
pink-500
gray-500
```

---

### Padding

```html
p-4
```

Horizontal:

```html
px-4
```

Vertical:

```html
py-4
```

Top:

```html
pt-4
```

Bottom:

```html
pb-4
```

---

### Margin

```html
m-4
```

Horizontal:

```html
mx-4
```

Vertical:

```html
my-4
```

Top:

```html
mt-4
```

Bottom:

```html
mb-4
```

---

### Texto centrado

```html
text-center
```

Derecha:

```html
text-right
```

Izquierda:

```html
text-left
```

---

### Flex

```html
flex
```

Centrar horizontal:

```html
justify-center
```

Centrar vertical:

```html
items-center
```

Todo centrado:

```html
flex justify-center items-center
```

---

### Gap

```html
gap-1
gap-2
gap-4
gap-6
gap-8
```

Ejemplo:

```html
<div class="flex gap-4">
  <button>Uno</button>
  <button>Dos</button>
</div>
```

---

## Directivas

### Ciclos Vue

```vue
<div
  v-for="item in productos"
  :key="item.id"
  class="
    bg-white
    shadow
    rounded
    p-4
  "
>
  {{ item.nombre }}
</div>
```

---

### Condicionales Vue

```vue
<div
  v-if="error"
  class="
    bg-red-500
    text-white
    p-4
    rounded
  "
>
  Error
</div>
```

---

## Lo más usado

```text
container
mx-auto

grid
grid-cols-1
md:grid-cols-2

flex
justify-center
items-center

w-full
h-screen

bg-white
bg-blue-500

text-white
text-center

border
rounded

shadow

p-4
px-4
py-2

m-4
mx-4
my-4

gap-4

hover:bg-blue-700

hidden
block

fixed
absolute
relative
sticky

overflow-hidden
overflow-auto
```