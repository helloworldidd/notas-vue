# Bootstrap
_Framework CSS para crear interfaces web rápidamente_



[INDICE]

## 1. Bootstrap

### 1.1. Qué es Bootstrap

Bootstrap es un **framework de CSS y JavaScript** que permite construir sitios web **responsivos (adaptables a distintos dispositivos)** de forma rápida.

Funciona agregando **clases predefinidas** a los elementos HTML.

Ejemplo:

```html
<button class="btn btn-primary">Botón</button>
```
_Bootstrap aplica automáticamente estilos sin escribir CSS propio._

### 1.2. Enlaces de interés

- Documentación Bootstrap W3Schools https://www.w3schools.com/bootstrap/
- Documentación Bootstrap Oficial https://getbootstrap.com/docs/
- Ejemplos Bootstrap https://adminlte.io/blog/websites-made-with-bootstrap/
- Descripción Bootstrap Wikipedia https://es.wikipedia.org/wiki/Bootstrap_(framework)

- Autocompletado de clases [Bootstrap Class Autocomplete](https://marketplace.visualstudio.com/items?itemName=torresgol10.bootstrap-class-autocomplete)
- Autocompletado de componente [Bootstrap 5 Quick Snippet](https://marketplace.visualstudio.com/items?itemName=AnbuselvanRocky.bootstrap5-vscode)




Bootstrap funciona así:

```
HTML + clases de Bootstrap
↓
Bootstrap aplica estilos automáticamente
↓
sitio responsive y ordenado
```


Bootstrap te permite:

- 1️⃣ organizar la página con **containers y grillas**
- 2️⃣ crear **componentes visuales rápidos**
- 3️⃣ tener **diseño responsivo automáticamente**







### 2. Beneficios de usar Bootstrap

- Permite maquetar sitios **rápidamente**
- Facilita crear **diseños responsivos**
- Incluye **componentes listos** (botones, formularios, tablas, navegación)
- Tiene un **sistema de grillas flexible**
- Gran comunidad y documentación

Bootstrap combina:

* HTML
* CSS
* JavaScript

para construir interfaces completas. 



## 2. Cómo agregar Bootstrap a un proyecto

### Opción 1 – Descargar

Desde: https://getbootstrap.com descargar __Compiled CSS and JS__ y Luego incluir en HTML:


Incluir el css:
```html
<link rel="stylesheet" href="css/bootstrap.min.css">
```

Incluir el js:
```html
<script src="js/bootstrap.min.js"></script>
```



### Opción 2 – Usar CDN (más simple)

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  </head>
  <body>
    <h1>Hello, world!</h1>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  </body>
</html>
```




## 4. Elementos Bootstrap



### 4.1. Contenedor principal

Bootstrap organiza la página dentro de un **container**.

Ancho fijo centrado:
```html
<div class="container">
  contenido
</div>
```

Ocupa todo el ancho:
```html
<div class="container-fluid">
  contenido
</div>
```



### 4.2. Sistema de grillas (Grid)

Bootstrap divide la pantalla en **12 columnas**.

- Usamos clases __row__ para indicar una fila
- Usamos clases __col__ para indicar una columna


**Columnas automáticas**: Bootstrap reparte el espacio automáticamente.

```html
<div class="row">
  <div class="col">columna</div>
  <div class="col">columna</div>
  <div class="col">columna</div>
</div>
```

**Columnas especificadas**: Ejemplo 8 + 4 = 12 columnas
```html
<div class="row">
  <div class="col-8">Contenido</div>
  <div class="col-4">Sidebar</div>
</div>
```





### 4.3. Responsive (adaptable)

Bootstrap usa **breakpoints** para distintos tamaños de pantalla.

| Clase  | Pantalla |
| ------ | -------- |
| col    | todas    |
| col-sm | ≥ 576px  |
| col-md | ≥ 768px  |
| col-lg | ≥ 992px  |
| col-xl | ≥ 1200px |

Ejemplo:
- __4 columnas__ en pantallas medianas o mayores.

```html
<div class="col-md-4"></div>
```

Ejemplo:
- en __sm__ tamaño ≥ 576px Dos columnas de 12 y 12
- en __md__ tamaño ≥ 768px Dos columnas de 8 y 4
```html
<div class="row">
  <div class="col-sm-12 col-md-8">Contenido</div>
  <div class="col-sm-12 col-md-4">Sidebar</div>
</div>
```

### 4.4. Tablas

Tabla básica

```html
<table class="table">
```



Tabla con filas alternas

```html
<table class="table table-striped">
```



Tabla con bordes

```html
<table class="table table-bordered">
```



Tabla con hover

```html
<table class="table table-hover">
```



Tabla responsiva

```html
<div class="table-responsive">
```

Evita que la tabla se rompa en pantallas pequeñas. 



### 4.5. Alertas

Sirven para mostrar mensajes al usuario.

```html
<div class="alert alert-primary">Mensaje informativo</div>
<div class="alert alert-success">Operación exitosa</div>
<div class="alert alert-danger">Ocurrió un error</div>
<div class="alert alert-warning">Advertencia</div>
```

Tipos:


| Clase           | Color                                                                                                                        |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| alert-primary   | <div style="background-color:#cfe2ff; color:#084298; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en azul</div>     |
| alert-secondary | <div style="background-color:#e2e3e5; color:#41464b; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en gris</div>     |
| alert-success   | <div style="background-color:#d1e7dd; color:#0f5132; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en verde</div>    |
| alert-danger    | <div style="background-color:#f8d7da; color:#842029; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en rojo</div>     |
| alert-warning   | <div style="background-color:#fff3cd; color:#664d03; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en amarillo</div> |
| alert-info      | <div style="background-color:#cff4fc; color:#055160; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en celeste</div>  |
| alert-light     | <div style="background-color:#f8f9fa; color:#636464; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en blanco</div>   |
| alert-dark      | <div style="background-color:#d3d3d4; color:#141619; width:fit-content; padding:6px 10px; border-radius:4px;">Bloque de alerta<br> en negro</div>    |


### 4.6. Botones



Tipos de botones

| Clase         | Color                                                                                                                                           |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| btn-primary   | <div style="background-color:#0d6efd; color:white; width:fit-content; padding:6px 10px; border-radius:4px;">azul</div>                          |
| btn-secondary | <div style="background-color:#6c757d; color:white; width:fit-content; padding:6px 10px; border-radius:4px;">gris</div>                          |
| btn-success   | <div style="background-color:#198754; color:white; width:fit-content; padding:6px 10px; border-radius:4px;">verde</div>                         |
| btn-danger    | <div style="background-color:#dc3545; color:white; width:fit-content; padding:6px 10px; border-radius:4px;">rojo</div>                          |
| btn-warning   | <div style="background-color:#ffc107; color:black; width:fit-content; padding:6px 10px; border-radius:4px;">amarillo</div>                      |
| btn-info      | <div style="background-color:#0dcaf0; color:black; width:fit-content; padding:6px 10px; border-radius:4px;">celeste</div>                       |
| btn-light     | <div style="background-color:#f8f9fa; color:black; width:fit-content; padding:6px 10px; border-radius:4px; border:1px solid #ddd;">blanco</div> |
| btn-dark      | <div style="background-color:#212529; color:white; width:fit-content; padding:6px 10px; border-radius:4px;">negro</div>                         |
| btn-link      | <div style="color:#0d6efd; text-decoration:underline;">link</div>                                                                               |



Botones Outline

Son botones **solo con borde**.

| Clase               | Ejemplo                                                                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| btn-outline-primary | <div style="border:1px solid #0d6efd; color:#0d6efd; width:fit-content; padding:6px 10px; border-radius:4px;">outline azul</div>     |
| btn-outline-success | <div style="border:1px solid #198754; color:#198754; width:fit-content; padding:6px 10px; border-radius:4px;">outline verde</div>    |
| btn-outline-danger  | <div style="border:1px solid #dc3545; color:#dc3545; width:fit-content; padding:6px 10px; border-radius:4px;">outline rojo</div>     |
| btn-outline-warning | <div style="border:1px solid #ffc107; color:#ffc107; width:fit-content; padding:6px 10px; border-radius:4px;">outline amarillo</div> |
| btn-outline-dark    | <div style="border:1px solid #212529; color:#212529; width:fit-content; padding:6px 10px; border-radius:4px;">outline negro</div>    |

---

Tamaños de botones

| Clase  | Descripción   |
| ------ | ------------- |
| btn-lg | botón grande  |
| btn    | tamaño normal |
| btn-sm | botón pequeño |



Ejemplo

```html
<button class="btn btn-primary btn-lg">Grande</button>
<button class="btn btn-primary">Normal</button>
<button class="btn btn-primary btn-sm">Pequeño</button>
```

Botón de ancho completo

| Clase | Descripción               |
| ----- | ------------------------- |
| w-100 | botón ocupa todo el ancho |

```html
<button class="btn btn-primary w-100">Botón ancho completo</button>
```

### 4.7. Grupo de botones

Permite **agrupar botones juntos**.

```html
<div class="btn-group">
  <button class="btn btn-primary">Uno</button>
  <button class="btn btn-primary">Dos</button>
  <button class="btn btn-primary">Tres</button>
</div>
```



💡 **Tip simple para alumnos**

Un botón siempre sigue esta estructura:

```html
<button class="btn btn-color">Texto</button>
```

Ejemplo:

```html
<button class="btn btn-success">Guardar</button>
```





### 4.8. Imágenes responsivas

```html
<img src="foto.jpg" class="img-fluid">
```

Esto hace que la imagen:

```
max-width: 100%
height: auto
```



### 4.9. Navbar (menú de navegación)

Bootstrap permite crear menús responsivos fácilmente.

```html
<nav class="navbar navbar-expand-lg">
```

Características:

* menú principal
* enlaces
* dropdown
* buscador
* se colapsa en móviles

Ejemplo:
```html
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">

    <!-- Logo -->
    <a class="navbar-brand" href="#">MiSitio</a>

    <!-- Botón hamburguesa (móvil) -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Menú -->
    <div class="collapse navbar-collapse" id="menu">

      <!-- enlaces -->
      <ul class="navbar-nav me-auto">

        <li class="nav-item">
          <a class="nav-link active" href="#">Inicio</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Servicios</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Contacto</a>
        </li>

        <!-- dropdown -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
            Más
          </a>

          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Blog</a></li>
            <li><a class="dropdown-item" href="#">Portfolio</a></li>
          </ul>
        </li>

      </ul>

      <!-- buscador -->
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Buscar">
        <button class="btn btn-primary">Buscar</button>
      </form>

    </div>

  </div>
</nav>
```

### 4.10. Formularios

Bootstrap permite **dar estilo a formularios automáticamente** usando clases predefinidas.

Los formularios se usan para **recoger información del usuario**, por ejemplo:

- email
- nombre
- contraseña
- mensajes
- selección de opciones

Ejemplo

```html
<form>

  <div class="mb-3">
    <label class="form-label">Email</label>
    <input type="email" class="form-control" placeholder="Ingresa tu email">
  </div>

  <div class="mb-3">
    <label class="form-label">Mensaje</label>
    <textarea class="form-control"></textarea>
  </div>

  <button class="btn btn-primary">
    Enviar
  </button>

</form>
```

Componentes comunes

| Clase        | Uso                                 |
| ------------ | ----------------------------------- |
| form-control | inputs y textarea                   |
| form-label   | etiquetas del formulario            |
| form-check   | checkboxes y radios                 |
| btn          | botones                             |
| mb-3         | margen inferior para separar campos |

Ejemplo de checkbox

```html
<div class="form-check">
  <input class="form-check-input" type="checkbox">
  <label class="form-check-label">
    Acepto los términos
  </label>
</div>
```


### 4.11. Cards

Las **Cards** son componentes de Bootstrap que permiten mostrar contenido dentro de una **tarjeta con borde y estructura organizada**.

Se usan comúnmente para:

- productos
- perfiles
- artículos
- información destacada

Ejemplo

```html
<div class="card" style="width:18rem;">

  <img src="img/producto.jpg" class="card-img-top">

  <div class="card-body">
    <h5 class="card-title">Título</h5>

    <p class="card-text">
      Breve descripción del contenido de la tarjeta.
    </p>

    <a href="#" class="btn btn-primary">
      Ver más
    </a>
  </div>

</div>
```

Componentes comunes

| Clase        | Uso                     |
| ------------ | ----------------------- |
| card         | contenedor principal    |
| card-body    | contenido de la tarjeta |
| card-title   | título                  |
| card-text    | texto descriptivo       |
| card-img-top | imagen superior         |
| btn          | botón dentro de la card |



## 5. Utilidades


### 5.1. Espaciado (Margin y Padding)

Bootstrap incluye **clases utilitarias** que permiten aplicar estilos rápidos **sin escribir CSS**.

Estas clases se agregan directamente al HTML para controlar:

- márgenes
- padding
- colores
- bordes
- tamaño
- alineación
- layout




Bootstrap usa una escala de **0 a 5**.

| Número | Espacio aproximado |
|------|------|
| 0 | sin espacio |
| 1 | pequeño |
| 2 | pequeño |
| 3 | medio |
| 4 | grande |
| 5 | muy grande |



**Margin**. Controlan el **espacio exterior**:

| Clase | Uso |
|------|------|
| m-3 | margen en todos lados |
| mt-3 | margen superior |
| mb-3 | margen inferior |
| ms-3 | margen izquierda |
| me-3 | margen derecha |
| mx-3 | margen horizontal |
| my-3 | margen vertical |


```html
<div class="bg-primary text-white p-3 m-3">
  Elemento con margen
</div>
```


**Padding**. Controla el **espacio interno**:

| Clase | Uso                |
| ----- | ------------------ |
| p-3   | padding general    |
| pt-3  | padding superior   |
| pb-3  | padding inferior   |
| ps-3  | padding izquierda  |
| pe-3  | padding derecha    |
| px-3  | padding horizontal |
| py-3  | padding vertical   |

```html
<div class="bg-success text-white p-4">
  Elemento con padding
</div>
```



### 5.2. Colores

Bootstrap tiene colores predefinidos.

**Fondos**

| Clase        | Color    |
| ------------ | -------- |
| bg-primary   | azul     |
| bg-secondary | gris     |
| bg-success   | verde    |
| bg-danger    | rojo     |
| bg-warning   | amarillo |
| bg-info      | celeste  |
| bg-light     | claro    |
| bg-dark      | negro    |

```html
<div class="bg-warning text-dark p-3">
  Advertencia
</div>
```


**Colores de texto**

| Clase        | Uso        |
| ------------ | ---------- |
| text-primary | azul       |
| text-success | verde      |
| text-danger  | rojo       |
| text-warning | amarillo   |
| text-dark    | oscuro     |
| text-white   | blanco     |
| text-muted   | gris claro |

```html
<p class="text-danger">
Texto rojo
</p>
```



### 5.3. Bordes

**Bordes básicos**

| Clase          | Uso             |
| -------------- | --------------- |
| border         | agrega borde    |
| border-top     | borde superior  |
| border-bottom  | borde inferior  |
| border-primary | color del borde |

```html
<div class="border border-primary p-3">
Caja con borde
</div>
```



**Bordes redondeados**

| Clase          | Uso                  |
| -------------- | -------------------- |
| rounded        | borde redondeado     |
| rounded-0      | sin borde redondeado |
| rounded-circle | círculo              |
| rounded-pill   | forma cápsula        |

```html
<img src="img/avatar.jpg" class="rounded-circle" width="100">
```


### 5.4. Tamaños

**Ancho**:

| Clase | Uso  |
| ----- | ---- |
| w-25  | 25%  |
| w-50  | 50%  |
| w-75  | 75%  |
| w-100 | 100% |

```html
<div class="bg-info w-50 p-3">
Ancho 50%
</div>
```


### 5.5. Display

Controla cómo se muestra un elemento.

| Clase    | Uso     |
| -------- | ------- |
| d-none   | ocultar |
| d-block  | bloque  |
| d-inline | inline  |
| d-flex   | flexbox |

Ejemplo

```html
<div class="d-flex">
  <div class="p-2">1</div>
  <div class="p-2">2</div>
</div>
```


### 5.6. Flexbox

Bootstrap incluye utilidades para **alineación con flex**.

| Clase                   | Uso                |
| ----------------------- | ------------------ |
| justify-content-center  | centrar horizontal |
| justify-content-between | separar elementos  |
| align-items-center      | centrar vertical   |

```html
<div class="d-flex justify-content-center">
  <button class="btn btn-primary">Botón</button>
</div>
```

```html
<div class="bg-primary text-white p-4 m-3 rounded w-50">
Caja con utilidades de Bootstrap
</div>
```

Las utilidades permiten **crear diseño rápido sin escribir CSS**.

```html
<div class="bg-dark text-white p-4 rounded">
Caja estilizada con utilidades
</div>
```



## 6. Iconos

Bootstrap permite usar **iconos listos para usar** mediante la librería **Bootstrap Icons**.

Son útiles para:

- botones
- menús
- mensajes
- navegación
- redes sociales


### 6.1. Agregar la librería de iconos

Primero se debe incluir el CDN en el `<head>` del documento.

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
```



### 6.2. Usar un icono

Los iconos se agregan con la etiqueta `<i>`.

Ejemplo:

```html
<i class="bi bi-star"></i>
```



### 6.3. Ejemplos de iconos comunes

| Icono       | Código                         |
| ----------- | ------------------------------ |
| ⭐ estrella  | `<i class="bi bi-star"></i>`   |
| ❤️ corazón  | `<i class="bi bi-heart"></i>`  |
| 🔍 búsqueda | `<i class="bi bi-search"></i>` |
| 🏠 casa     | `<i class="bi bi-house"></i>`  |
| 👤 usuario  | `<i class="bi bi-person"></i>` |
| 🛒 carrito  | `<i class="bi bi-cart"></i>`   |



### 6.4. Iconos en botones

```html
<button class="btn btn-primary">
  <i class="bi bi-download"></i>
  Descargar
</button>
```

### 6.5. Cambiar tamaño del icono

| Clase | Tamaño     |
| ----- | ---------- |
| fs-1  | muy grande |
| fs-3  | grande     |
| fs-5  | normal     |

Ejemplo

```html
<i class="bi bi-star fs-1 text-warning"></i>
```

### 6.6. Cambiar color

```html
<i class="bi bi-heart text-danger"></i>
```


Ejemplo completo
```html
<button class="btn btn-success">
  <i class="bi bi-check-circle"></i>
  Guardar
</button>
```










## 7. Buenas prácticas con Bootstrap

### 7.1 Usar las clases de Bootstrap antes de crear CSS propio

Bootstrap ya incluye muchas utilidades.

Antes de escribir CSS nuevo, revisar si Bootstrap ya lo resuelve.

Ejemplo:

```html
<div class="container">
<button class="btn btn-primary">Guardar</button>
</div>
```

Esto evita escribir CSS innecesario.


### 7.2 Usar correctamente el sistema de grillas

Bootstrap usa un **sistema de 12 columnas** para diseño responsivo.

Ejemplo:

```html
<div class="row">
  <div class="col-12 col-md-6">
    Columna
  </div>

  <div class="col-12 col-md-6">
    Columna
  </div>
</div>
```

Buenas prácticas:

* siempre usar `row`
* las columnas deben estar dentro de `row`
* usar breakpoints (`sm`, `md`, `lg`, `xl`)


### 7.3 Usar utilidades en lugar de CSS extra

Bootstrap tiene **clases utilitarias** para muchas cosas.

Ejemplos:

```html
mt-3
p-4
text-center
d-flex
justify-content-between
```

Ejemplo real:

```html
<div class="text-center mt-4">
  Hola
</div>
```

Esto mantiene el proyecto **más simple**.

---

### 7.4 No modificar directamente el CSS de Bootstrap

Nunca editar archivos como:

```
bootstrap.css
bootstrap.min.css
```

Si necesitas cambiar estilos:

* crear tu propio archivo CSS
* o usar Sass para personalizar variables

Ejemplo:

```html
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="styles.css">
```

---

### 7.5 Usar los componentes correctamente

Bootstrap trae componentes listos como:

* navbar
* cards
* alerts
* modals
* forms

Ejemplo:

```html
<div class="card">
  <div class="card-body">
    Contenido
  </div>
</div>
```

Es mejor usar los componentes de Bootstrap que recrearlos desde cero.

---

### 7.6 No abusar de demasiadas clases

Bootstrap puede generar HTML muy largo.

Ejemplo malo:

```html
<div class="d-flex justify-content-between align-items-center text-center p-4 m-3 bg-light">
```

A veces es mejor crear una clase propia.

---

### 7.7 Mantener una estructura clara

Una estructura típica de Bootstrap es:

```
container
row
col
```

Ejemplo:

```html
<div class="container">
  <div class="row">
    <div class="col">
      Contenido
    </div>
  </div>
</div>
```
