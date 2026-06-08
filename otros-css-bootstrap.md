# Estilo CSS Bootstrap


--- 

## Indíce

- [Indíce](#indice)
- [Intro](#intro)
- [Instalación](#instalacion)
- [Estructura básica](#estructura-basica)
- [Grid responsive](#grid-responsive)
- [Breakpoints](#breakpoints)
- [Componentes](#componentes)
- [Utilidades CSS](#utilidades-css)
- [Directivas Vue](#directivas-vue)
- [Lo más usado](#lo-mas-usado)

<style>*{scroll-behavior: smooth}</style>



--- 

## Intro



https://getbootstrap.com/

**Bootstrap** es un framework CSS para crear interfaces responsive usando clases listas para usar.






## Instalación

```bash
npm i bootstrap
npm i bootstrap-icons
```

En `main.js`:

```js
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import 'bootstrap-icons/font/bootstrap-icons.css'
```

---

## Estructura básica

```html
<div class="container">
  Contenido
</div>
```

Con ancho completo:

```html
<div class="container-fluid">
  Contenido
</div>
```

---

## Grid responsive

```html
<div class="container">
  <div class="row">

    <div class="col-12 col-md-6">
      Columna 1
    </div>

    <div class="col-12 col-md-6">
      Columna 2
    </div>

  </div>
</div>
```

---

## Breakpoints

```text
col-12     -> móvil
col-sm-6   -> tablet chica
col-md-6   -> tablet / notebook
col-lg-4   -> desktop
col-xl-3   -> grande
col-xxl-3  -> muy grande
```

---

## Componentes

### Botones

```html
<button class="btn btn-primary">
  Guardar
</button>
```

Otros:

```html
<button class="btn btn-secondary">Cancelar</button>
<button class="btn btn-success">Aceptar</button>
<button class="btn btn-danger">Eliminar</button>
```

Botón con borde:

```html
<button class="btn btn-outline-primary">
  Ver más
</button>
```

---

### Cards

```html
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Título</h5>
    <p class="card-text">Contenido</p>
  </div>
</div>
```

---

### Inputs

```html
<input class="form-control" placeholder="Nombre">
```

Textarea:

```html
<textarea class="form-control" placeholder="Mensaje"></textarea>
```

Select:

```html
<select class="form-select">
  <option>Vue</option>
  <option>React</option>
  <option>Angular</option>
</select>
```

Checkbox:

```html
<input class="form-check-input" type="checkbox">
<label class="form-check-label">Acepto</label>
```

Switch:

```html
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox">
  <label class="form-check-label">Dark Mode</label>
</div>
```

---

### Imágenes

```html
<img src="imagen.jpg" class="img-fluid" alt="Imagen">
```

Redondeada:

```html
<img src="imagen.jpg" class="img-fluid rounded" alt="Imagen">
```

---

### Iconos

```html
<i class="bi bi-house"></i>
```

Ejemplos:

```text
bi-house
bi-person
bi-heart
bi-cart
bi-list
bi-x
bi-search
bi-envelope
bi-telephone
```

---

### Modales

```html
<button
  class="btn btn-primary"
  data-bs-toggle="modal"
  data-bs-target="#miModal"
>
  Abrir modal
</button>

<div class="modal fade" id="miModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Hola</h5>
      </div>

      <div class="modal-body">
        Contenido
      </div>

    </div>
  </div>
</div>
```

---

### Barra superior

```html
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container">
    <a class="navbar-brand" href="#">
      Mi App
    </a>
  </div>
</nav>
```

---

### Menú lateral

```html
<div
  class="offcanvas offcanvas-start"
  id="menu"
>
  <div class="offcanvas-header">
    <h5>Menú</h5>
  </div>

  <div class="offcanvas-body">
    Contenido del menú
  </div>
</div>
```

---

## Utilidades CSS

### Colores

```html
class="text-primary"
class="bg-primary"
```

Colores:

```text
primary
secondary
success
danger
warning
info
light
dark
white
```

---

### Padding / Margin

Padding:

```html
p-4
```

Margin:

```html
m-4
```

Padding horizontal:

```html
px-4
```

Padding vertical:

```html
py-4
```

Margin top:

```html
mt-4
```

Margin bottom:

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
text-end
```

Izquierda:

```html
text-start
```

---

### Flex

```html
d-flex
```

Centrar horizontal:

```html
justify-content-center
```

Centrar vertical:

```html
align-items-center
```

Todo centrado:

```html
d-flex justify-content-center align-items-center
```

---

### Espaciado / Gap

```html
gap-1
gap-2
gap-3
gap-4
gap-5
```

Ejemplo:

```html
<div class="d-flex gap-3">
  <button class="btn btn-primary">
    Uno
  </button>

  <button class="btn btn-secondary">
    Dos
  </button>
</div>
```

---

## Directivas Vue

### Ciclos Vue

```vue
<div
  class="card"
  v-for="item in productos"
  :key="item.id"
>
  <div class="card-body">
    {{ item.nombre }}
  </div>
</div>
```

---

### Condicionales Vue

```vue
<div
  v-if="error"
  class="alert alert-danger"
>
  Error
</div>
```

---

## Lo más usado

```text
container
container-fluid

row
col
col-12
col-md-6

btn
btn-primary
btn-secondary
btn-success
btn-danger
btn-outline-primary

card
card-body
card-title
card-text

form-control
form-select
form-check
form-switch

img-fluid
rounded

navbar
navbar-brand

offcanvas
modal

text-center

d-flex
justify-content-center
align-items-center

p-4
m-4
mt-4
mb-4

gap-3
```
