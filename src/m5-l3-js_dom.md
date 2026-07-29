# JS DOM
_DOM y manipulación HTML_

[INDICE]






## 1. Document Object Model (DOM)

El **DOM (Document Object Model)** es una representación en forma de **árbol de objetos** de un documento HTML.

Cada elemento de la página se convierte en un **objeto que JavaScript puede leer y modificar**.

El DOM es definido y mantenido por el **W3C**.

Gracias al DOM podemos:

* acceder a elementos HTML
* modificar contenido
* cambiar estilos
* responder a eventos del usuario







## 2. Jerarquía del DOM

El DOM funciona como una **estructura jerárquica**.

El objeto principal es:

```
window
```

Dentro de él existe:

```
document
```

Y dentro de `document` están todos los elementos HTML.

Ejemplo simplificado:

```
window
 └── document
      ├── html
      │    ├── head
      │    └── body
      │          ├── h1
      │          ├── p
      │          └── div
```

Cada uno de estos nodos puede ser manipulado con JavaScript.







## 3. Seleccionar elementos del DOM

Para manipular un elemento primero debemos **seleccionarlo**.

Los selectores en JavaScript funcionan de forma similar a **CSS**.

Existen **dos formas principales**.







## 3.1 Método tradicional

Son funciones disponibles desde versiones antiguas de JavaScript.

Funciones principales:

```
getElementById()
getElementsByClassName()
getElementsByName()
getElementsByTagName()
```

Ejemplo:

```javascript
const page = document.getElementById("page");

const items = document.getElementsByClassName("item");

const nicknames = document.getElementsByName("nickname");

const divs = document.getElementsByTagName("div");
```







## 3.2 Método moderno

Más flexible y parecido a los **selectores CSS**.

Funciones principales:

```
querySelector()
querySelectorAll()
```

Ejemplo:

```javascript
const page = document.querySelector("#page");

const info = document.querySelector(".main.info");

const infos = document.querySelectorAll(".info");

const nicknames = document.querySelectorAll('[name="nickname"]');

const divs = document.querySelectorAll("div");
```







## 4. Modificar elementos del DOM

Una vez seleccionado un elemento podemos **modificar sus propiedades o atributos**.

Por ejemplo:

* contenido
* atributos
* clases
* estilos

Ejemplo:

```javascript
const titulo = document.querySelector("h1");

titulo.textContent = "Nuevo título";
```







## 5. Manipular clases

JavaScript permite modificar clases CSS fácilmente usando `classList`.

Ejemplo:

```javascript
element.classList.add("activo");

element.classList.remove("activo");

element.classList.toggle("activo");
```

Esto permite **activar o desactivar estilos dinámicamente**.







## 6. Crear elementos en el DOM

JavaScript puede **crear elementos HTML nuevos**.

Para ello usamos:

```
createElement()
```

Ejemplo:

```javascript
const div = document.createElement("div");

const span = document.createElement("span");

const img = document.createElement("img");
```

Esto crea el elemento pero **aún no aparece en la página**.







## 7. Insertar elementos en el DOM

Para insertar el elemento debemos agregarlo a un **elemento padre**.

Se usa:

```
appendChild()
```

Ejemplo:

```javascript
const img = document.createElement("img");

img.src = "https://lenguajejs.com/assets/logo.svg";
img.alt = "Logo Javascript";
img.width = 100;

document.body.appendChild(img);
```







## 8. Modificar estilos desde JavaScript

También es posible modificar CSS usando la propiedad:

```
style
```

Ejemplo:

```javascript
const box = document.createElement("div");

box.style.marginTop = "30px";
box.style.marginLeft = "30px";
box.style.height = "100px";
box.style.width = "100px";
box.style.backgroundColor = "#000";

document.body.appendChild(box);
```







## 9. Eventos en JavaScript

Los **eventos** permiten reaccionar a acciones del usuario.

Un evento es una **acción que ocurre en la página**.

Ejemplos:

* hacer clic
* escribir en un input
* mover el mouse
* presionar una tecla

JavaScript puede **escuchar estos eventos y ejecutar funciones**.







## 10. Evento onClick

Se ejecuta cuando el usuario hace clic en un elemento.

Ejemplo:

```javascript
let p = document.getElementById("foo");

p.onclick = muestraAlerta;

function muestraAlerta() {
  alert("Evento onclick ejecutado!");
}
```







## 11. Evento onBlur

Se ejecuta cuando un elemento **pierde el foco**.

Ejemplo:

```javascript
let input = document.getElementById("fname");

input.addEventListener("blur", () => {
  input.value = input.value.toUpperCase();
});
```

En este caso el texto se convierte a **mayúsculas al salir del input**.







## 12. Evento onKeyDown

Se ejecuta cuando el usuario **presiona una tecla**.

Ejemplo:

```javascript
let input = document.getElementById("fname");

input.addEventListener("keydown", (e) => {
  alert("tecla presionada " + e.key);
});
```







## 13. Otros eventos importantes

Algunos eventos comunes en JavaScript:

```
click
mouseover
mouseout
keydown
keyup
submit
change
load
```

Estos permiten crear **interfaces interactivas**.







## Ejercicio práctico

Diseñar una aplicación web que:

1️⃣ tenga un formulario
2️⃣ el usuario ingrese una temperatura en **°C**
3️⃣ al presionar un botón se muestre la temperatura en **°F**

Recordatorio de la fórmula:

```
°F = (°C × 9/5) + 32
```

