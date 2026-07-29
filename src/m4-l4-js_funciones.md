# JS Funciones
_Funciones para reutilización de código_

[INDICE]


## 1. Introducción a las funciones

### 1.1. ¿Qué es una función?

Una **función** es un bloque de código que realiza una tarea específica.

Su objetivo principal es **reutilizar código** y evitar repetir instrucciones dentro de un programa.

Una función puede:

- recibir datos de entrada
- ejecutar instrucciones
- devolver un resultado

Las funciones ayudan a que el código sea **más ordenado y fácil de mantener**.



### 1.2. Definir una función

Para crear una función en JavaScript se utiliza la palabra reservada:

```
function

```

Luego se define:

- nombre de la función
- parámetros
- cuerpo de instrucciones

Ejemplo:

```javascript
function suma(a, b){
  return a + b;
}

console.log(suma(1,2));
```












## 2. Uso de funciones


### 2.1. Invocar una función

Definir una función **no la ejecuta automáticamente**.

Para ejecutarla es necesario **invocarla**.

Esto se hace escribiendo el nombre de la función seguido de paréntesis.

```javascript
function saludar(nombre){
  return "Hola " + nombre;
}

saludar("Ana");
```

### 2.2. Parámetros en funciones

Las funciones pueden recibir **parámetros**.

Los parámetros son valores que se entregan a la función cuando se ejecuta.

Ejemplo:

```javascript
function saludar(nombre){
  return "Hola " + nombre;
}

console.log(saludar("Raul"));
```

También se pueden definir **valores por defecto**.

```javascript
function sumaTres(a, b = 3){
  return a + b;
}

console.log(sumaTres(1));
```

### 2.3 Parámetros con valores por defecto


En JavaScript es posible definir **valores por defecto para los parámetros de una función**.

Esto significa que si al invocar la función **no se envía un argumento**, el parámetro utilizará automáticamente el valor definido por defecto.

Sintaxis:

```javascript
function saludar(nombre = "invitado") {
  return "Hola " + nombre;
}
```

Uso:

```javascript
saludar("Ana");      // "Hola Ana"
saludar();           // "Hola invitado"
```

En el primer caso se entrega un valor, por lo que **se usa el argumento enviado**.

En el segundo caso **no se envía ningún valor**, entonces el parámetro toma **el valor por defecto**.

También se pueden definir varios parámetros con valores por defecto:

```javascript
function calcularTotal(precio, cantidad = 1) {
  return precio * cantidad;
}

calcularTotal(1000, 3); // 3000
calcularTotal(1000);    // 1000
```


### 2.4. Retorno de una función

Una función puede devolver un resultado utilizando la palabra:

```
return
```

El valor retornado puede guardarse en una variable.

```javascript
function suma(a, b){
  return a + b;
}

let resultado = suma(2,3);

console.log(resultado);
```




### 2.5 Funciones sin retorno

Una **función sin retorno** es una función que **no devuelve ningún valor** mediante la palabra clave `return`.

Este tipo de funciones se utiliza cuando la función **solo ejecuta una acción**, como mostrar información en pantalla, modificar datos o ejecutar algún proceso.

Ejemplo:

```javascript
function saludar(nombre){
  console.log("Hola " + nombre);
}
```

Uso:

```javascript
saludar("Ana"); 
```

Resultado en consola:

```
Hola Ana
```

En este caso la función **no devuelve un valor**, solo ejecuta la instrucción `console.log`.

Cuando una función no tiene `return`, JavaScript **retorna automáticamente `undefined`**.

Ejemplo:

```javascript
function mensaje(){
  console.log("Bienvenido");
}

let resultado = mensaje();

console.log(resultado); // undefined
```

Las funciones sin retorno se usan comúnmente para:

* mostrar mensajes
* modificar elementos del DOM
* ejecutar procesos o tareas
* registrar información en consola






## 3. Tipos de funciones


### 3.1 Función declarada  


Una **función declarada** es la forma más común de definir una función en JavaScript.

Se crea utilizando la palabra clave `function`, seguida del **nombre de la función**, sus **parámetros** entre paréntesis y un **bloque de código** entre llaves.

Sintaxis:

```javascript
function nombreFuncion(parametros){
  // código de la función
}
```

Ejemplo:

```javascript
function sumar(a, b){
  return a + b;
}
```

Uso:

```javascript
let resultado = sumar(5, 3);
console.log(resultado); // 8
```

Una característica importante de las funciones declaradas es que **pueden invocarse antes de su definición en el código**.
Esto ocurre porque JavaScript realiza un proceso llamado **hoisting**, donde las declaraciones de funciones se cargan en memoria antes de ejecutar el programa.

Ejemplo:

```javascript
saludar();

function saludar(){
  console.log("Hola mundo");
}
```

En este caso la función funciona correctamente aunque se invoque antes de ser definida.







### 3.2 Función anónima

Una **función anónima** es una función que **no tiene nombre**.

Generalmente se utiliza cuando una función se **asigna a una variable** o se **usa como argumento dentro de otra función**.

Sintaxis:

```javascript
let nombreVariable = function(parametros){
  // código de la función
};
```

Ejemplo:

```javascript
let sumar = function(a, b){
  return a + b;
};
```

Uso:

```javascript
let resultado = sumar(4, 6);
console.log(resultado); // 10
```

En este caso la función **no tiene nombre propio**, pero se puede usar mediante la **variable que la almacena**.

También es común utilizar funciones anónimas en eventos o callbacks.

Ejemplo:

```javascript
document.addEventListener("click", function(){
  console.log("Se hizo clic");
});
```

Las funciones anónimas permiten escribir código **más flexible y reutilizable**, especialmente cuando se necesita una función solo en un contexto específico.




### 3.3 Función flecha (Arrow function)

La **función flecha** (Arrow function) es una forma **más corta y moderna** de escribir funciones en JavaScript.

Fue incorporada en **ES6 (ECMAScript 2015)** y utiliza el símbolo `=>` para definir la función.

Sintaxis general:

```javascript
(parametros) => {
  // código de la función
}
```

Ejemplo equivalente a una función tradicional:

```javascript
// función tradicional
function sumar(a, b){
  return a + b;
}

// función flecha
let sumar = (a, b) => {
  return a + b;
};
```

Uso:

```javascript
console.log(sumar(5, 3)); // 8
```

Cuando la función tiene **una sola expresión**, se puede escribir de forma aún más corta, sin llaves ni `return`:

```javascript
let sumar = (a, b) => a + b;
```

Si solo hay **un parámetro**, incluso se pueden omitir los paréntesis:

```javascript
let cuadrado = x => x * x;
```

Las funciones flecha se utilizan mucho en:

* callbacks
* manejo de arreglos (`map`, `filter`, `reduce`)
* funciones pequeñas o rápidas

Ejemplo con `map`:

```javascript
let numeros = [1, 2, 3, 4];

let dobles = numeros.map(n => n * 2);

console.log(dobles); // [2, 4, 6, 8]
```

Las arrow functions ayudan a escribir código **más compacto y legible**.








## 4. Variables y alcance (Scope)

En JavaScript existen dos tipos de variables según su alcance.


### 4.1. Variable global

Se declara fuera de una función y puede ser utilizada en todo el programa.

```javascript
let num1 = 10;
```


### 4.2. Variable local

Se declara dentro de una función y solo existe dentro de ella.

```javascript
function multiplicar(a){
  let resultado = a * 2;
  return resultado;
}
```

### 4.3. Alcance de variables (Scope)

Las variables definidas dentro de una función **no pueden utilizarse fuera de ella**.

Ejemplo:

```javascript
function ejemplo(){
  let numero = 5;
}

console.log(numero);
```

Esto generará un error porque **numero solo existe dentro de la función**.





## 5. Problemas y organización del código

### 5.1. Problema de las variables globales

Las variables globales pueden causar problemas porque **cualquier función puede modificarlas**.

Esto hace que el código sea más difícil de controlar.

Ejemplo:

```javascript
var a = 100;

function test(){
  console.log(a);
  var a = 10;
  console.log(a);
}

test();
console.log(a);
```

Por esta razón se recomienda **evitar el uso excesivo de variables globales**.

### 5.2. Funciones anidadas

Una función puede contener otra función dentro de ella.

A esto se le llama **función anidada**.

La función interna puede acceder a las variables de la función externa.

```javascript
function puntuacion(nombre){

  let num1 = 2;
  let num2 = 3;

  function imprimir(){
    return nombre + " anotó " + (num1 + num2);
  }

  return imprimir();
}

console.log(puntuacion("Patricio"));
```




## 6. Buenas prácticas con funciones



### 6.1 Una función debe hacer una sola tarea

Una buena práctica al programar es que **cada función tenga una única responsabilidad**.

Esto significa que una función debería **realizar solo una tarea específica** y no muchas cosas diferentes al mismo tiempo.

Cuando una función hace demasiadas tareas:

- se vuelve difícil de entender
- es más difícil de reutilizar
- es más difícil de mantener o modificar

Ejemplo poco recomendable:

```javascript
function procesarUsuario(usuario){
  guardarUsuario(usuario);
  enviarCorreo(usuario);
  mostrarMensaje("Usuario registrado");
}
```

En este caso la función realiza **varias tareas distintas**.

Una mejor organización sería separar cada tarea en funciones diferentes:

```javascript
function guardarUsuario(usuario){
  // guardar datos
}

function enviarCorreo(usuario){
  // enviar correo
}

function mostrarMensaje(mensaje){
  console.log(mensaje);
}
```

De esta forma el código se vuelve **más claro, reutilizable y fácil de mantener**.





### 6.2 Nombres claros para funciones

Los nombres de las funciones deben ser **claros y descriptivos**, de modo que indiquen fácilmente **qué hace la función**.

Un buen nombre permite entender el propósito del código **sin necesidad de leer toda la implementación**.

Ejemplo poco claro:

```javascript
function hacer(a, b){
  return a + b;
}
```

Ejemplo más claro:

```javascript
function sumarNumeros(a, b){
  return a + b;
}
```

Es recomendable que los nombres de funciones:

* describan la acción que realizan
* usen **verbos** (calcular, obtener, validar, mostrar, guardar)
* sean fáciles de leer

Ejemplos de buenos nombres:

```javascript
calcularTotal()
mostrarMensaje()
obtenerUsuario()
validarFormulario()
```

Usar nombres claros mejora la **legibilidad del código** y facilita el trabajo en equipo.


## 7. Funciones en JavaScript

### 7.1 Funciones globales de JavaScript

Son funciones que forman parte del **lenguaje JavaScript** y pueden utilizarse directamente sin pertenecer a ningún objeto.

| Función | Descripción |
|---|---|
| `parseInt()` | convierte un texto en un número entero |
| `parseFloat()` | convierte un texto en un número decimal |
| `Number()` | convierte un valor en número |
| `String()` | convierte un valor en texto |
| `Boolean()` | convierte un valor en booleano |
| `isNaN()` | verifica si un valor no es un número |
| `isFinite()` | verifica si un número es finito |
| `encodeURI()` | codifica una URL |
| `decodeURI()` | decodifica una URL |
| `encodeURIComponent()` | codifica parte de una URL |
| `decodeURIComponent()` | decodifica parte de una URL |
| `eval()` | ejecuta código JavaScript contenido en texto (no recomendado en código moderno) |


### 7.2 Métodos de objetos preconstruidos

JavaScript incluye varios **objetos integrados** que contienen funciones útiles llamadas **métodos**.  
Estos métodos se utilizan mediante **notación punto**.

| Objeto | Ejemplo | Descripción |
|---|---|---|
| `Math` | `Math.random()` | genera un número aleatorio |
| `Math` | `Math.sqrt()` | calcula la raíz cuadrada |
| `Math` | `Math.round()` | redondea un número |
| `String` | `"hola".toUpperCase()` | convierte texto a mayúsculas |
| `String` | `"hola".includes("ho")` | verifica si el texto contiene otro texto |
| `String` | `"hola".slice(0,2)` | extrae parte de un texto |
| `Array` | `array.push()` | agrega un elemento al final |
| `Array` | `array.pop()` | elimina el último elemento |
| `Array` | `array.map()` | transforma cada elemento del arreglo |
| `Array` | `array.filter()` | filtra elementos según una condición |
| `Object` | `Object.keys(obj)` | devuelve las claves de un objeto |
| `Object` | `Object.values(obj)` | devuelve los valores de un objeto |
| `JSON` | `JSON.parse()` | convierte texto JSON en objeto |
| `JSON` | `JSON.stringify()` | convierte objeto en texto JSON |


### 7.3 Funciones del DOM

Estas funciones permiten **interactuar con el documento HTML** desde JavaScript.

| Función | Descripción |
|---|---|
| `document.getElementById()` | obtiene un elemento por su id |
| `document.querySelector()` | obtiene el primer elemento que coincide con un selector CSS |
| `document.querySelectorAll()` | obtiene todos los elementos que coinciden con un selector |
| `document.createElement()` | crea un nuevo elemento HTML |
| `document.write()` | escribe contenido directamente en la página |
| `element.appendChild()` | agrega un elemento hijo |
| `element.remove()` | elimina un elemento del DOM |
| `element.addEventListener()` | agrega un evento a un elemento |
| `element.removeEventListener()` | elimina un evento de un elemento |


### 7.4 Funciones del navegador (Web APIs)

Estas funciones son proporcionadas por el **entorno del navegador**.  
Normalmente pertenecen al objeto `window`, pero pueden usarse directamente.

| Función | Descripción |
|---|---|
| `setTimeout()` | ejecuta una función después de un tiempo |
| `setInterval()` | ejecuta una función repetidamente |
| `clearTimeout()` | cancela un `setTimeout` |
| `clearInterval()` | cancela un `setInterval` |
| `alert()` | muestra un mensaje emergente |
| `confirm()` | muestra un cuadro de confirmación |
| `prompt()` | solicita información al usuario |
| `requestAnimationFrame()` | ejecuta código antes del siguiente repintado |
| `cancelAnimationFrame()` | cancela una animación |
| `fetch()` | realiza peticiones HTTP |
| `getComputedStyle()` | obtiene los estilos calculados de un elemento |
| `matchMedia()` | evalúa media queries |
| `open()` | abre una nueva ventana |
| `close()` | cierra una ventana |
| `scroll()` | desplaza la ventana |
| `scrollTo()` | desplaza a una posición específica |
| `scrollBy()` | desplaza relativo a la posición actual |
| `print()` | abre el diálogo de impresión |
| `stop()` | detiene la carga de la página |
| `postMessage()` | envía mensajes entre ventanas o iframes |