# 📘 Guía de Estudio Front-End

## Parte 1 — Fundamentos Web, HTML, CSS, JavaScript y Git

> **Objetivo:** comprender los conceptos fundamentales del desarrollo Front-End moderno. Esta guía no busca que memorices respuestas, sino que entiendas cómo funcionan las tecnologías y cómo se relacionan entre sí.

---

# ¿Qué es el Desarrollo Web?

El desarrollo web consiste en **crear, mantener y mejorar sitios y aplicaciones que funcionan en un navegador web**.

Cuando visitas una página como una tienda online, una red social o un banco, estás utilizando una aplicación web.

Un desarrollador Front-End construye la parte que el usuario puede ver e interactuar.

---

## Front-End vs Back-End

Un proyecto web normalmente está dividido en dos grandes áreas.

| Front-End           | Back-End                         |
| ------------------- | -------------------------------- |
| Interfaz de usuario | Lógica del negocio               |
| HTML                | Node.js, Java, PHP, Python, etc. |
| CSS                 | Base de datos                    |
| JavaScript          | APIs                             |
| Vue                 | Autenticación                    |

---

## ¿Cómo funciona una página web?

Cuando escribes una dirección en el navegador ocurre algo parecido a esto:

```text
Usuario
   │
   ▼
Navegador
   │
Solicitud HTTP
   │
   ▼
Servidor
   │
Consulta Base de Datos
   │
   ▼
Respuesta (HTML / JSON)
   │
   ▼
Navegador
   │
Renderiza la interfaz
```

Como desarrolladores Front-End trabajamos principalmente desde el navegador hacia arriba.

---

## El navegador

El navegador tiene varias responsabilidades importantes.

* Interpretar HTML.
* Aplicar estilos CSS.
* Ejecutar JavaScript.
* Mostrar la interfaz.
* Comunicarse con servidores mediante HTTP.

Ejemplos de navegadores:

* Google Chrome
* Firefox
* Edge
* Safari

---

## Tecnologías principales

Piensa siempre en esta relación:

```text
HTML
↓
Estructura

CSS
↓
Presentación

JavaScript
↓
Comportamiento

Vue
↓
Organización de la aplicación
```

Si entiendes esta relación, muchas preguntas de alternativas prácticamente se responden solas.

---

# HTML

HTML significa **HyperText Markup Language**.

No es un lenguaje de programación.

Su función es **estructurar el contenido**.

---

## Documento básico

```html
<!DOCTYPE html>

<html>

<head>

<title>Mi Sitio</title>

</head>

<body>

<h1>Hola Mundo</h1>

</body>

</html>
```

---

## Estructura principal

Siempre recordar:

```text
html

↓

head

↓

body
```

El contenido visible se encuentra dentro del `<body>`.

---

## Etiquetas semánticas

HTML5 incorporó etiquetas que describen mejor el contenido.

```html
<header>

<nav>

<main>

<section>

<article>

<aside>

<footer>
```

Estas etiquetas mejoran la organización y la accesibilidad.

---

## Encabezados

```text
h1

h2

h3

h4

h5

h6
```

Nunca existe:

```text
h7
```

---

## Formularios

Elementos más utilizados.

```html
<form>

<input>

<textarea>

<select>

<button>

<label>
```

---

## GET y POST

Dos métodos muy utilizados en formularios.

### GET

* Obtiene información.
* Los datos viajan en la URL.

Ejemplo.

```text
/productos?page=2
```

---

### POST

* Envía información.
* Los datos viajan en el cuerpo de la solicitud.

Se utiliza para:

* iniciar sesión
* registrar usuarios
* crear productos

---

⚠ Error común

Pensar que HTML da estilos.

No.

HTML solamente estructura.

---

# CSS

CSS significa

**Cascading Style Sheets**

Su objetivo es controlar la apariencia.

Permite modificar:

* colores
* tamaños
* tipografía
* márgenes
* posiciones
* sombras
* animaciones

---

## Selectores

Ejemplo.

```css
h1{

color:red;

}
```

También existen:

```css
.clase

#id

button

input
```

---

## Box Model

Todo elemento HTML posee un modelo de caja.

```text
Margin

↓

Border

↓

Padding

↓

Content
```

O desde el interior.

```text
Contenido

↓

Padding

↓

Border

↓

Margin
```

Esta es una de las preguntas más frecuentes en evaluaciones.

---

## Responsive Design

Actualmente los sitios deben funcionar correctamente en distintos dispositivos.

* computador
* notebook
* tablet
* celular

Esto se conoce como

```text
Responsive Design
```

---

## Media Queries

Permiten cambiar estilos dependiendo del tamaño de pantalla.

```css
@media (max-width:768px){

}
```

💡 Si lees

> adaptar según el dispositivo

Piensa inmediatamente en

```text
Media Queries
```

---

# Bootstrap

Bootstrap es un framework CSS.

Su objetivo es acelerar el desarrollo de interfaces.

---

## Sistema de Grillas

Bootstrap utiliza

```text
12 columnas
```

Ejemplo.

```html
<div class="row">

<div class="col-md-6">

</div>

<div class="col-md-6">

</div>

</div>
```

---

## Containers

### .container

Tiene un ancho máximo según el tamaño de pantalla.

Ideal para sitios tradicionales.

---

### .container-fluid

Ocupa siempre el

```text
100%
```

del ancho disponible.

---

💡 Tip

Si una alternativa habla de

> ocupar toda la pantalla

La respuesta normalmente será

```text
.container-fluid
```

---

# JavaScript

JavaScript agrega comportamiento a las páginas.

Con JavaScript podemos:

* validar formularios
* modificar HTML
* consumir APIs
* crear aplicaciones completas

---

## Variables

Actualmente se recomienda utilizar

```javascript
const
```

y

```javascript
let
```

Evitar

```javascript
var
```

---

## const

No permite reasignar la variable.

```javascript
const edad=20

edad=30
```

❌ Error.

Pero

```javascript
const usuario={}

usuario.nombre="Patricio"
```

✔ Correcto.

Porque no cambió la referencia del objeto.

---

## let

Se utiliza cuando el valor cambiará.

Ejemplo.

```javascript
let contador=0

contador++
```

---

## defer

```html
<script src="app.js" defer></script>
```

Ventajas.

✔ descarga el archivo mientras carga el HTML.

✔ espera que termine el DOM.

✔ mantiene el orden.

---

## async

También descarga en paralelo.

Pero ejecuta el archivo apenas termina de descargarlo.

No garantiza el orden.

---

💡 Si lees

> esperar que termine de cargar el DOM

Piensa inmediatamente en

```text
defer
```

---

# DOM

DOM significa

Document Object Model.

Es la representación del HTML en memoria.

Gracias al DOM JavaScript puede modificar la página.

Ejemplo.

```javascript
const titulo=document.getElementById("titulo")
```

Devuelve.

* un Element
* o null

---

## Antes de Vue

Para modificar una página debíamos escribir código como éste.

```javascript
document.getElementById("titulo").textContent="Hola"
```

---

## Con Vue

Simplemente modificamos una variable.

```vue
{{ titulo }}
```

Vue actualiza automáticamente el DOM.

---

# jQuery

Hace algunos años era prácticamente obligatorio.

Hoy normalmente se utiliza únicamente para.

* proyectos antiguos
* mantenimiento
* pequeños scripts

Actualmente Vue reemplaza la mayoría de esas tareas.

---

# Git

Git permite controlar versiones.

Gracias a Git podemos regresar a versiones anteriores y colaborar con otras personas.

---

## Flujo básico

```text
Modificar archivos

↓

git add

↓

git commit

↓

git push
```

---

## Comandos importantes

Inicializar un proyecto.

```bash
git init
```

---

Clonar un repositorio.

```bash
git clone
```

---

Agregar archivos.

```bash
git add .
```

---

Crear un commit.

```bash
git commit -m "Agregar Login"
```

---

Subir cambios.

```bash
git push
```

---

Traer cambios y fusionarlos.

```bash
git pull
```

---

Traer referencias sin fusionar.

```bash
git fetch
```

---

## Diferencia entre fetch y pull

```text
git fetch

↓

Descarga información

↓

NO modifica tu rama
```

---

```text
git pull

↓

Descarga

↓

Fusiona automáticamente
```

---

## GitHub

GitHub es una plataforma para almacenar repositorios Git.

Permite.

* trabajar en equipo
* publicar proyectos
* controlar versiones
* compartir código

---

## Buenas prácticas con Git

✔ realizar commits pequeños.

✔ escribir mensajes claros.

✔ subir cambios frecuentemente.

❌ Evitar commits como.

```text
Cambios

asdf

hola

último
```

Un buen commit debería describir claramente qué hiciste.

Ejemplo.

```text
Agregar autenticación

Corregir estilos del navbar

Implementar carrito de compras
```

---

# Resumen Parte 1

```text
HTML
↓

Estructura

CSS
↓

Diseño

Bootstrap
↓

Responsive rápido

JavaScript
↓

Interactividad

DOM
↓

Manipulación del documento

Git
↓

Control de versiones

GitHub
↓

Repositorio remoto
```

---

## Lo más importante para recordar

* HTML estructura la información.
* CSS controla la presentación.
* JavaScript agrega comportamiento.
* Bootstrap facilita el diseño responsive.
* `defer` espera que el DOM termine de cargar.
* El Box Model está compuesto por **Contenido → Padding → Borde → Margin**.
* `.container-fluid` ocupa todo el ancho disponible.
* `document.getElementById()` devuelve un elemento o `null`.
* `const` no permite reasignar la referencia de una variable.
* `git push` sube cambios al repositorio remoto.
* `git fetch` descarga cambios sin fusionarlos.
* `git pull` descarga y fusiona los cambios automáticamente.

<!-- > **En la Parte 2** veremos Vue 3, Composition API, Pinia, Vue Router, consumo de APIs, JSON, JWT y HTTP, que forman el núcleo de una aplicación Front-End moderna.
 -->


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>





















---


# Parte 2 — Vue 3, Composition API, Pinia, Vue Router y APIs

En la primera parte vimos los fundamentos del desarrollo web.

Ahora aprenderemos las herramientas que permiten construir aplicaciones modernas utilizando **Vue 3**, **Composition API** y **Pinia**, que fueron las tecnologías utilizadas durante el curso.

---

# ¿Qué es Vue?

Vue es un **framework de JavaScript** que facilita la creación de interfaces web.

En lugar de escribir cientos de líneas modificando el DOM manualmente, Vue permite trabajar mediante **componentes reutilizables**.

---

## ¿Qué significa que Vue sea progresivo?

Vue puede utilizarse de distintas formas.

Desde agregar un pequeño componente en una página existente hasta construir una aplicación completa (SPA).

Por eso se dice que es un framework **progresivo**.

---

## ¿Qué problema resuelve Vue?

Sin un framework una aplicación grande puede convertirse rápidamente en miles de líneas de JavaScript difíciles de mantener.

Vue ayuda a organizar el código.

```text
Aplicación

↓

Componentes

↓

Componentes pequeños

↓

Código reutilizable
```

---

# Componentes

Los componentes son la base de Vue.

Un componente representa una parte reutilizable de la interfaz.

Ejemplos.

```text
Navbar

Footer

LoginForm

ProductCard

Sidebar

Modal
```

Cada componente debería tener una única responsabilidad.

---

## ¿Por qué dividir una aplicación?

En lugar de esto.

```text
App.vue

↓

3500 líneas
```

Es preferible esto.

```text
App.vue

├── Navbar

├── Sidebar

├── ProductList

│      └── ProductCard

├── Footer

└── Modal
```

El código será mucho más fácil de mantener.

---

# Composition API

Durante el curso utilizamos exclusivamente **Composition API**.

Concretamente utilizamos.

```vue
<script setup>
</script>
```

Esta forma es la recomendada actualmente para Vue 3.

---

## ¿Por qué Composition API?

Porque agrupa toda la lógica relacionada.

Antes.

```javascript
data()

methods

computed

watch
```

Ahora.

```javascript
ref()

computed()

watch()

function

onMounted()
```

Todo queda junto y resulta mucho más sencillo de leer.

---

# ref()

Permite crear variables reactivas.

Ejemplo.

```javascript
import { ref } from "vue"

const contador = ref(0)
```

Para acceder al valor.

```javascript
contador.value
```

Para modificarlo.

```javascript
contador.value++
```

---

## ¿Cuándo utilizar ref?

Cuando trabajes con:

* números
* texto
* booleanos

Ejemplos.

```javascript
const edad = ref(20)

const nombre = ref("Patricio")

const activo = ref(false)
```

---

⚠ Error común

```javascript
contador++
```

Incorrecto.

Debe ser.

```javascript
contador.value++
```

---

# reactive()

Se utiliza principalmente para objetos.

Ejemplo.

```javascript
const usuario = reactive({

nombre: "",

edad: 0

})
```

---

## ¿Cuándo usar reactive?

Cuando varias propiedades pertenecen al mismo objeto.

Por ejemplo.

```javascript
usuario.nombre

usuario.edad

usuario.email
```

---

# computed()

Un computed genera información automáticamente.

Ejemplo.

```javascript
const precioFinal = computed(() => {

return precio.value * 1.19

})
```

Cuando cambie

```text
precio
```

también cambiará

```text
precioFinal
```

---

## Ventajas

* evita repetir cálculos
* mejora el rendimiento
* mantiene el código limpio

---

# watch()

Observa cambios.

Ejemplo.

```javascript
watch(busqueda, () => {

buscarProductos()

})
```

Cada vez que cambia

```text
busqueda
```

se ejecuta la función.

---

## Diferencia entre computed y watch

| computed                 | watch                               |
| ------------------------ | ----------------------------------- |
| Devuelve un valor        | Ejecuta una acción                  |
| Se utiliza para cálculos | Se utiliza para efectos secundarios |
| Más declarativo          | Más reactivo                        |

---

# onMounted()

Es uno de los hooks más utilizados.

Se ejecuta cuando el componente ya fue montado.

Generalmente aquí consumimos APIs.

```javascript
onMounted(() => {

obtenerProductos()

})
```

---

# Props

Permiten enviar información desde un componente padre hacia uno hijo.

```text
Padre

↓

Props

↓

Hijo
```

Ejemplo.

```vue
<ProductCard
    :title="producto.nombre"
    :price="producto.precio"
/>
```

Las props son de solo lectura.

---

# Emits

Permiten que el componente hijo avise algo al padre.

```text
Padre

↑

Emit

↑

Hijo
```

Ejemplo.

```vue
<button

@click="$emit('delete')"

>

Eliminar

</button>
```

---

# Directivas importantes

Durante el curso utilizamos varias directivas.

---

## v-if

Agrega o elimina elementos del DOM.

Ideal cuando un elemento aparece pocas veces.

---

## v-show

No elimina el elemento.

Solo modifica.

```css
display:none;
```

Ideal cuando un elemento se muestra y oculta constantemente.

---

## Diferencia

```text
v-if

↓

Elimina del DOM
```

```text
v-show

↓

Oculta con CSS
```

---

## v-model

Realiza un enlace bidireccional.

```text
Input

↓

Variable

↓

Input
```

Esto se conoce como

```text
Two Way Binding
```

Ejemplo.

```vue
<input v-model="nombre">
```

---

## v-for

Permite recorrer listas.

```vue
<div

v-for="producto in productos"

:key="producto.id"

>

{{ producto.nombre }}

</div>
```

Siempre utilizar

```text
:key
```

---

## @submit.prevent

Equivale a.

```javascript
event.preventDefault()
```

Evita que el formulario recargue la página.

---

# Pinia

Pinia es el gestor de estado recomendado para Vue 3.

Su función consiste en compartir información entre componentes.

---

## ¿Qué problema resuelve?

Sin Pinia.

```text
App

↓

Home

↓

Products

↓

Card
```

Los datos deben viajar mediante props.

Esto recibe el nombre de

```text
Prop Drilling
```

---

Con Pinia.

```text
Store

↑

Todos los componentes
```

Mucho más limpio.

---

# Estructura de un Store

Pinia posee tres partes principales.

```text
State

↓

Getters

↓

Actions
```

---

## State

Guarda información.

Ejemplo.

```javascript
products

usuario

favoritos

carrito
```

---

## Getters

Obtienen información calculada.

Ejemplos.

* cantidad de productos

* total del carrito

* productos favoritos

---

## Actions

Contienen la lógica.

Ejemplos.

```javascript
agregarProducto()

eliminarProducto()

login()

logout()

cargarProductos()
```

También pueden consumir APIs.

---

⚠ Importante

Pinia

NO tiene

```text
Mutations
```

---

# Vuex vs Pinia

La evaluación puede mencionar Vuex.

Nosotros trabajamos con Pinia.

## Vuex

```text
State

Mutations

Actions

Getters
```

---

## Pinia

```text
State

Actions

Getters
```

No existen

* mutations

* commit()

* dispatch()

Las actions modifican directamente el estado.

```javascript
this.products = datos
```

---

# Vue Router

Vue Router permite navegar entre distintas páginas.

Sin recargar completamente la aplicación.

---

## RouterLink

En lugar de utilizar.

```html
<a>
```

utilizamos.

```vue
<RouterLink>
```

---

## router.push()

Permite navegar mediante JavaScript.

```javascript
router.push("/productos")
```

---

## Params

Los params forman parte de la ruta.

```text
/users/10
```

---

## Query

Las query van después del signo.

```text
?
```

Ejemplo.

```text
/products?page=2
```

---

## Diferencia

| Params                 | Query               |
| ---------------------- | ------------------- |
| Identifican recursos   | Filtran información |
| Forman parte de la URL | Van después del ?   |

---

# APIs

Una API permite comunicar aplicaciones.

Generalmente un Front-End consume información mediante HTTP.

---

## Flujo

```text
Vue

↓

fetch()

↓

API

↓

JSON

↓

Mostrar datos
```

---

# Fetch

Durante el curso utilizamos

```javascript
fetch()
```

Ejemplo.

```javascript
const response = await fetch(url)

const data = await response.json()
```

---

## Manejo de errores

Siempre utilizar.

```javascript
try{

}catch(error){

}
```

Nunca asumir que Internet siempre funcionará.

---

# HTTP

Los verbos más importantes.

| Verbo  | Acción     |
| ------ | ---------- |
| GET    | Obtener    |
| POST   | Crear      |
| PUT    | Actualizar |
| DELETE | Eliminar   |

---

# JSON

Es el formato más utilizado para intercambiar datos.

Ejemplo.

```json
{

"name":"Juan",

"edad":25

}
```

Las claves deben escribirse entre comillas dobles.

No admite comentarios.

---

# JWT

JWT significa

JSON Web Token.

Está compuesto por.

```text
Header

↓

Payload

↓

Signature
```

Se utiliza principalmente para autenticación.

---

# Resumen Parte 2

```text
Vue

↓

Componentes

↓

Composition API

↓

Pinia

↓

Vue Router

↓

Fetch

↓

API

↓

HTTP

↓

JSON
```

---

# Lo más importante para recordar

* Vue organiza aplicaciones mediante componentes.
* Composition API es la forma recomendada para Vue 3.
* `ref()` crea variables reactivas.
* `computed()` calcula valores automáticamente.
* `watch()` observa cambios.
* `onMounted()` suele utilizarse para consumir APIs.
* `v-if` elimina elementos del DOM.
* `v-show` solamente cambia `display`.
* `v-model` crea un enlace bidireccional.
* Pinia gestiona el estado global.
* Pinia **no tiene mutations**.
* `RouterLink` reemplaza normalmente a `<a>` en aplicaciones Vue.
* Los **params** forman parte de la ruta.
* Las **query** van después del signo `?`.
* `fetch()` consume APIs.
* HTTP utiliza GET, POST, PUT y DELETE.
* JSON intercambia información entre aplicaciones.
* JWT se utiliza para autenticación.






<br>
<br>
<br>
<br>
<br>
<br>


<br>
<br>
<br>
<br>
<br>
<br>




# 📘 Guía de Estudio Front-End

# Parte 3 — Testing, Buenas Prácticas, Arquitectura y Chuleta Final

En esta última parte veremos temas que normalmente aparecen cuando un proyecto comienza a crecer: pruebas, organización, despliegue, buenas prácticas y conceptos que todo desarrollador Front-End debería conocer.

---

# ¿Por qué realizar pruebas?

Cuando una aplicación crece aparecen nuevos errores constantemente.

Las pruebas permiten comprobar que nuestro código sigue funcionando incluso después de realizar modificaciones.

Su objetivo no es encontrar errores únicamente, sino **evitar que aparezcan nuevamente**.

---

# Tipos de pruebas

## Pruebas Unitarias

Prueban una única pieza del sistema.

Ejemplos.

* una función
* un composable
* un componente pequeño

Ejemplo.

```javascript
function sumar(a,b){

return a+b

}
```

Se prueba únicamente esa función.

---

## Pruebas de Componentes

Comprueban el comportamiento de un componente Vue.

Ejemplos.

* props
* botones
* formularios
* emits
* renderizado

---

## Pruebas de Integración

Comprueban que varios componentes funcionen correctamente juntos.

Ejemplo.

```text
ProductList

↓

ProductCard

↓

CartStore
```

---

## End To End (E2E)

Simulan el comportamiento completo de un usuario.

Ejemplo.

```text
Abrir sitio

↓

Iniciar sesión

↓

Agregar producto

↓

Comprar

↓

Cerrar sesión
```

Son las pruebas más cercanas al uso real.

---

# Vitest

Durante el curso utilizamos

```text
Vitest
```

Vitest es el framework de pruebas recomendado para proyectos creados con **Vite**.

---

## ¿Qué permite hacer?

* ejecutar pruebas
* comparar resultados
* crear mocks
* crear spies
* medir cobertura

---

## Estructura básica

```javascript
import { describe,it,expect } from "vitest"

describe("Calculadora",()=>{

it("2+2=4",()=>{

expect(2+2).toBe(4)

})

})
```

---

## describe()

Agrupa varias pruebas relacionadas.

---

## it()

Representa una prueba específica.

---

## expect()

Compara el resultado esperado con el obtenido.

---

## Algunas assertions

```javascript
expect(valor).toBe(10)

expect(lista).toHaveLength(3)

expect(usuario).toEqual({...})

expect(nombre).toContain("Pat")
```

---

# Vue Test Utils

Vue Test Utils permite probar componentes Vue.

No prueba la aplicación completa.

Prueba únicamente componentes.

---

## Funciones más utilizadas

```javascript
mount()

shallowMount()

find()

findAll()

trigger()

setValue()
```

---

## ¿Qué podemos probar?

* props
* eventos
* botones
* formularios
* renderizado
* emits

---

# Jest vs Vitest

La evaluación puede mencionar Jest.

Nosotros utilizamos Vitest.

La filosofía es prácticamente la misma.

| Jest          | Vitest               |
| ------------- | -------------------- |
| Más antiguo   | Más moderno          |
| Muy utilizado | Optimizado para Vite |
| describe      | describe             |
| it            | it                   |
| expect        | expect               |
| mocks         | mocks                |
| spies         | spies                |

Si una alternativa describe un framework con:

* runner
* assertions
* mocks

Puede referirse perfectamente a Jest.

Nosotros simplemente trabajamos con su equivalente moderno:

**Vitest**.

---

# Arquitectura de un Proyecto Vue

Una buena organización facilita el mantenimiento.

Ejemplo.

```text
src/

├── assets/
│
├── components/
│
├── composables/
│
├── router/
│
├── services/
│
├── stores/
│
├── views/
│
├── App.vue
│
└── main.js
```

---

## assets

Contiene.

* imágenes
* iconos
* estilos

---

## components

Componentes reutilizables.

Ejemplos.

```text
Navbar.vue

Footer.vue

ProductCard.vue
```

---

## views

Representan páginas completas.

```text
HomeView.vue

LoginView.vue

ProductsView.vue
```

---

## stores

Contienen los Store de Pinia.

```text
authStore.js

cartStore.js

productStore.js
```

---

## services

Aquí normalmente ubicamos funciones relacionadas con APIs.

```text
productApi.js

userApi.js
```

---

## composables

Lógica reutilizable.

Siempre comienzan con

```text
use
```

Ejemplos.

```text
useAuth()

useFetch()

useProducts()
```

---

# Variables de Entorno

Una variable de entorno permite almacenar información configurable.

Ejemplo.

```text
VITE_API_URL=https://api.com

VITE_API_KEY=123456
```

En Vue.

```javascript
import.meta.env.VITE_API_URL
```

---

## ¿Para qué sirven?

Evitan modificar el código cuando cambia.

Por ejemplo.

Servidor de desarrollo.

```text
localhost
```

Servidor de producción.

```text
api.miempresa.com
```

---

# package.json

Describe el proyecto.

Contiene.

* nombre
* scripts
* dependencias
* versión

---

## Scripts importantes

```bash
npm run dev
```

Inicia el servidor.

---

```bash
npm run build
```

Genera la versión de producción.

---

```bash
npm run preview
```

Permite probar el build.

---

# node_modules

Contiene todas las librerías instaladas.

Nunca debe subirse a GitHub.

Debe agregarse al.

```text
.gitignore
```

---

# Deploy

Una vez terminado el proyecto debemos publicarlo.

Esto se conoce como

```text
Deploy
```

Durante el curso utilizamos.

* Vercel
* GitHub Pages

---

## Flujo completo

```text
Proyecto

↓

Git

↓

GitHub

↓

Deploy

↓

Aplicación publicada
```

---

# Buenas prácticas

## Componentes pequeños

Un componente debería tener una única responsabilidad.

✔ Correcto.

```text
ProductCard

Navbar

Footer

LoginForm
```

❌ Evitar.

```text
App.vue

↓

2500 líneas
```

---

## Código reutilizable

Si copias y pegas mucho código...

Probablemente deberías crear.

* un componente
* una función
* un composable

---

## Const antes que let

Siempre que el valor no cambie.

```javascript
const nombre="Patricio"
```

---

## Evitar var

Es una característica antigua.

Actualmente se recomienda utilizar únicamente.

```javascript
const

let
```

---

## Nombres descriptivos

❌

```javascript
const a=10

const b=20
```

✔

```javascript
const precio=10

const descuento=20
```

---

## DRY

Significa.

```text
Don't Repeat Yourself
```

No repetir código.

---

## KISS

Significa.

```text
Keep It Simple
```

Mantener el código simple.

---

## Responsabilidad única

Cada componente debería encargarse de una única tarea.

Ejemplo.

```text
LoginForm

↓

Solo iniciar sesión
```

No debería también administrar productos.

---

# Errores comunes

❌ Usar Pinia para todo.

✔ Solo utilizarlo cuando el estado sea compartido.

---

❌ Crear componentes enormes.

✔ Dividir la interfaz.

---

❌ Consumir APIs dentro de muchos componentes.

✔ Centralizar cuando sea posible.

---

❌ Duplicar funciones.

✔ Reutilizar lógica.

---

❌ Ignorar errores.

✔ Utilizar

```javascript
try{

}catch(error){

}
```

---

# Diferencias importantes

## HTML vs CSS

HTML

↓

estructura.

CSS

↓

presentación.

---

## JavaScript vs Vue

JavaScript

↓

lenguaje.

Vue

↓

framework.

---

## Props vs Emits

Props.

```text
Padre

↓

Hijo
```

Emits.

```text
Padre

↑

Hijo
```

---

## Estado Local vs Global

Estado local.

```javascript
ref()
```

Estado global.

```text
Pinia
```

---

## computed vs watch

computed.

↓

calcula valores.

watch.

↓

ejecuta acciones.

---

## Params vs Query

Params.

```text
/products/10
```

Query.

```text
/Products?page=2
```

---

## GET vs POST

GET.

↓

obtener.

POST.

↓

crear.

---

## PUT vs DELETE

PUT.

↓

actualizar.

DELETE.

↓

eliminar.

---

# Checklist antes de entregar un proyecto

☐ El proyecto compila.

☐ No existen errores en consola.

☐ Todas las rutas funcionan.

☐ Las APIs responden correctamente.

☐ Existe README.

☐ El proyecto está publicado.

☐ El repositorio tiene `.gitignore`.

☐ No se subió `node_modules`.

☐ Las variables sensibles están en `.env`.

☐ El sitio es responsive.

☐ Los componentes tienen nombres claros.

☐ El código está ordenado.

---

# Mapa Mental Front-End

```text
                    FRONT-END

                         │
        ┌────────────────┼────────────────┐
        │                │                │
      HTML              CSS        JavaScript
        │                │                │
   Estructura        Estilos       Interactividad
                                          │
                                          ▼
                                        Vue 3
                                          │
        ┌──────────────┬──────────────────┴──────────────┐
        │              │                                 │
   Components      Vue Router                       Pinia
        │              │                                 │
        ▼              ▼                                 ▼
  Interfaces     Navegación                      Estado Global
                                          │
                                          ▼
                                        Fetch
                                          │
                                          ▼
                                       APIs REST
                                          │
                                          ▼
                                        JSON
                                          │
                                          ▼
                                   Base de Datos

               Desarrollo
                    │
                    ▼
              Git + GitHub
                    │
                    ▼
                Vercel

           Calidad del Software
                    │
                    ▼
       Vitest + Vue Test Utils
```

---

# 🚀 Chuleta Final

## HTML

* Estructura.
* Etiquetas semánticas.
* Formularios.
* h1 hasta h6.

---

## CSS

* Presentación.
* Box Model.
* Responsive.
* Media Queries.

---

## Bootstrap

* Grid de 12 columnas.
* `.container`
* `.container-fluid`

---

## JavaScript

* `const`
* `let`
* `defer`
* DOM
* Fetch

---

## Vue

* Componentes.
* `v-if`
* `v-show`
* `v-for`
* `v-model`
* Props.
* Emits.

---

## Composition API

* `ref()`
* `reactive()`
* `computed()`
* `watch()`
* `onMounted()`

---

## Pinia

* State.
* Getters.
* Actions.
* Sin mutations.

---

## Vue Router

* RouterLink.
* router.push().
* Params.
* Query.

---

## APIs

* GET.
* POST.
* PUT.
* DELETE.
* JSON.
* JWT.

---

## Testing

* Vitest.
* Vue Test Utils.
* Unitarias.
* Integración.
* E2E.

---

## Git

* init.
* add.
* commit.
* push.
* fetch.
* pull.

---

# Si lees esto... piensa en...

| Si aparece...                  | Piensa en...          |
| ------------------------------ | --------------------- |
| Estructura                     | HTML                  |
| Presentación                   | CSS                   |
| Interactividad                 | JavaScript            |
| Componentes                    | Vue                   |
| Estado Global                  | Pinia                 |
| Compartir datos                | Pinia                 |
| Dos vías                       | `v-model`             |
| Mostrar y ocultar muchas veces | `v-show`              |
| Agregar y eliminar del DOM     | `v-if`                |
| Esperar que cargue el DOM      | `defer`               |
| Obtener datos                  | GET                   |
| Crear datos                    | POST                  |
| Actualizar datos               | PUT                   |
| Eliminar datos                 | DELETE                |
| Navegación                     | Vue Router            |
| Params                         | Parte de la ruta      |
| Query                          | Después del `?`       |
| Pruebas                        | Vitest                |
| Componentes en pruebas         | Vue Test Utils        |
| Control de versiones           | Git                   |
| Publicar aplicación            | Vercel / GitHub Pages |


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

---

# Conclusión

El desarrollo Front-End no consiste únicamente en aprender un framework.

Consiste en comprender cómo trabajan juntas distintas tecnologías para construir aplicaciones modernas.

Si dominas los fundamentos de **HTML**, **CSS**, **JavaScript**, **Vue 3**, **Composition API**, **Pinia**, **Vue Router**, **Fetch**, **Git** y **Testing**, podrás adaptarte fácilmente a nuevas herramientas y afrontar proyectos reales con una base sólida.

Aprende los conceptos, comprende el propósito de cada tecnología y utiliza esta guía como material de consulta cada vez que desarrolles una nueva aplicación.
