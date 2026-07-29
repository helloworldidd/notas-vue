# JS Objetos
_Objetos preconstruidos en JavaScript_

[INDICE]









## 1. Objetos en JavaScript

### 1.1 Qué es un objeto

Un **objeto** en programación se puede comparar con un objeto del mundo real.

Un objeto tiene **propiedades** que describen sus características.

Por ejemplo, una taza podría tener:

```
color
peso
material
diseño
```

En JavaScript, un objeto es una **estructura que almacena información mediante pares clave-valor**.

Esto permite representar entidades con varias características dentro del código.

Ejemplo conceptual:

```javascript
let persona = {
  nombre: "Ana",
  edad: 25,
  ciudad: "Madrid"
}
```

En este caso:

```
nombre → clave
"Ana" → valor
```

---

### 1.2 Crear un objeto

Los objetos se crean utilizando **llaves `{}`**.

Dentro de ellas se definen las propiedades separadas por comas.

Ejemplo:

```javascript
let objeto = {
  propiedad1: "prueba",
  propiedad2: function(){
    console.log("Hola Mundo");
  }
}
```

También es posible crear objetos vacíos y luego agregar propiedades.

```javascript
let usuario = {};

usuario.nombre = "Carlos";
usuario.edad = 30;
```

En JavaScript los objetos son **dinámicos**, lo que significa que se pueden **agregar, modificar o eliminar propiedades en cualquier momento del programa**.

---

### 1.3 Propiedades de un objeto

Las **propiedades** son los datos que pertenecen a un objeto.

Cada propiedad tiene:

```
clave : valor
```

Ejemplo:

```javascript
let coche = {
  marca: "Toyota",
  modelo: "Corolla",
  año: 2022
}
```

En este objeto:

```
marca → propiedad
"Toyota" → valor
```

Las propiedades pueden almacenar diferentes tipos de datos:

```javascript
let producto = {
  nombre: "Laptop",
  precio: 1200,
  disponible: true
}
```

---

### 1.4 Métodos de un objeto

Un **método** es una función que pertenece a un objeto.

Los métodos permiten que el objeto **realice acciones**.

Ejemplo:

```javascript
let persona = {
  nombre: "Luis",
  saludar: function(){
    console.log("Hola");
  }
}
```

Para ejecutar el método:

```javascript
persona.saludar();
```

Los métodos permiten que los objetos **no solo almacenen información, sino también comportamiento**.




## 2. Acceso a propiedades

### 2.1 Notación punto

La **notación punto** permite acceder a las propiedades de un objeto utilizando el nombre de la propiedad directamente.

Ejemplo:

```javascript
let persona = {
  nombre: "Ana",
  edad: 25
}

console.log(persona.nombre);
```

También se pueden **agregar nuevas propiedades** utilizando esta misma notación.

```javascript
persona.ciudad = "Santiago";
```

La notación punto es **la forma más común y sencilla** de acceder a propiedades de un objeto.

Se utiliza cuando **el nombre de la propiedad es conocido**.

### 2.2 Notación corchete

Otra forma de acceder a las propiedades de un objeto es mediante **corchetes `[]`**.

Ejemplo:

```javascript
console.log(persona["nombre"]);
```

También permite **agregar nuevas propiedades**.

```javascript
persona["profesion"] = "Diseñadora";
```

Esta notación es especialmente útil cuando el nombre de la propiedad **se encuentra en una variable**.

Ejemplo:

```javascript
let propiedad = "edad";

console.log(persona[propiedad]);
```

En este caso JavaScript buscará la propiedad cuyo nombre esté almacenado en la variable.





## 3. Métodos del objeto Object

JavaScript incluye varios métodos del objeto global `Object` que permiten **crear, inspeccionar y controlar objetos**.

---

### 3.1 Object.create()

El método `Object.create()` permite **crear un nuevo objeto basado en otro objeto existente**.

Esto significa que el nuevo objeto puede **heredar propiedades del objeto original**.

```javascript
let animal = {
  tipo: "mamífero"
}

let perro = Object.create(animal);

perro.nombre = "Max";

console.log(perro.nombre);
console.log(perro.tipo);
```

En este caso:

```
perro.nombre → propiedad propia
perro.tipo → propiedad heredada
```

---

### 3.2 Object.keys()

El método `Object.keys()` devuelve **un arreglo con las claves (propiedades) de un objeto**.

```javascript
let persona = {
  nombre: "Ana",
  edad: 25
}

console.log(Object.keys(persona));
```

Resultado:

```
["nombre", "edad"]
```

---

### 3.3 Object.values()

El método `Object.values()` devuelve **un arreglo con los valores de las propiedades de un objeto**.

```javascript
console.log(Object.values(persona));
```

Resultado:

```
["Ana", 25]
```

---

### 3.4 Object.entries()

El método `Object.entries()` devuelve **un arreglo de pares clave-valor**.

Cada propiedad se convierte en un arreglo con dos elementos.

```javascript
console.log(Object.entries(persona));
```

Resultado:

```
[
 ["nombre", "Ana"],
 ["edad", 25]
]
```

Este método es útil para **recorrer objetos con ciclos**.

---

### 3.5 Object.assign()

El método `Object.assign()` permite **copiar propiedades de uno o varios objetos a otro objeto**.

```javascript
let datos = { edad: 25 }
let usuario = { nombre: "Ana" }

let resultado = Object.assign(usuario, datos)

console.log(resultado)
```

Resultado:

```
{ nombre: "Ana", edad: 25 }
```

---

### 3.6 Object.freeze()

El método `Object.freeze()` **bloquea completamente un objeto**.

Después de usarlo:

* no se pueden modificar propiedades
* no se pueden agregar propiedades
* no se pueden eliminar propiedades

```javascript
let usuario = {
  nombre: "Ana"
}

Object.freeze(usuario)

usuario.nombre = "Luis"

console.log(usuario.nombre)
```

El valor **no cambiará**.

---

### 3.7 Object.seal()

El método `Object.seal()` **permite modificar propiedades existentes**, pero **no permite agregar ni eliminar propiedades**.

```javascript
let producto = {
  nombre: "Laptop",
  precio: 1200
}

Object.seal(producto)

producto.precio = 1000

console.log(producto.precio)
```

El valor se puede modificar, pero **no se pueden agregar nuevas propiedades al objeto**.










## 4. Objetos preconstruidos en JavaScript

JavaScript incluye varios **objetos integrados en el lenguaje** que permiten realizar operaciones comunes sin necesidad de programarlas desde cero.

Algunos de los más utilizados son:

```

Math
String
Array
Number
Boolean
Date
JSON
RegExp

```

Estos objetos proporcionan **propiedades y métodos útiles** para trabajar con datos, texto, números, fechas y estructuras de información.

---

### 4.1 Math

El objeto **Math** incluye constantes y funciones matemáticas.

Ejemplos:

```javascript
Math.PI
Math.sqrt(16)
Math.random()
Math.round(4.7)
```

Se utiliza para realizar cálculos matemáticos como:

* raíces cuadradas
* redondeos
* números aleatorios
* potencias
* funciones trigonométricas

El objeto `Math` **no puede modificarse**.

---

### 4.2 String

El objeto **String** permite manipular texto.

Ejemplo de una cadena:

```javascript
let saludo = "Hola mundo";
```

Algunos métodos útiles:

```javascript
saludo.length
saludo.toUpperCase()
saludo.toLowerCase()
saludo.slice(0,4)
saludo.includes("Hola")
```

Aunque las cadenas se declaren como **valores primitivos**, JavaScript las convierte temporalmente en **objetos String** para poder utilizar estos métodos.

---

### 4.3 Array

El objeto **Array** permite almacenar **listas de valores**.

Ejemplo:

```javascript
let numeros = [1,2,3,4];
```

Algunos métodos comunes:

```javascript
numeros.push(5)
numeros.pop()
numeros.length
numeros.includes(3)
numeros.slice(1,3)
```

Los arreglos se utilizan para **almacenar y manipular colecciones de datos**.

---

### 4.4 Number

El objeto **Number** proporciona métodos y propiedades para trabajar con números.

Ejemplo:

```javascript
let numero = 10;
```

Métodos útiles:

```javascript
numero.toFixed(2)
Number.isInteger(10)
Number.parseInt("20")
```

Permite realizar **conversiones y validaciones numéricas**.

---

### 4.5 Boolean

El objeto **Boolean** representa valores lógicos.

Un booleano puede tener dos valores:

```
true
false
```

Ejemplo:

```javascript
let activo = true;
```

Se utilizan principalmente en **condiciones y comparaciones**.

---

### 4.6 Date

El objeto **Date** permite trabajar con **fechas y horas**.

Ejemplo:

```javascript
let fecha = new Date();
```

Algunos métodos útiles:

```javascript
fecha.getFullYear()
fecha.getMonth()
fecha.getDate()
fecha.getHours()
```

Se utiliza para manejar:

* fechas
* horas
* calendarios
* tiempos de ejecución

---

### 4.7 JSON

El objeto **JSON** permite convertir datos entre **texto JSON y objetos JavaScript**.

Ejemplo:

```javascript
let usuario = {
  nombre: "Ana",
  edad: 25
}
```

Convertir objeto a texto JSON:

```javascript
JSON.stringify(usuario)
```

Convertir texto JSON a objeto:

```javascript
JSON.parse('{"nombre":"Ana","edad":25}')
```

Se usa mucho para **intercambiar datos entre aplicaciones y servidores**.

---

### 4.8 RegExp

El objeto **RegExp** permite trabajar con **expresiones regulares** para buscar patrones en texto.

Ejemplo:

```javascript
let patron = /hola/;
```

Métodos comunes:

```javascript
patron.test("hola mundo")
patron.exec("hola mundo")
```

Las expresiones regulares se utilizan para:

* validar formularios
* buscar texto
* reemplazar patrones







## 5. Objetos del navegador

Además de los objetos propios del lenguaje, JavaScript puede interactuar con **objetos proporcionados por el navegador**.

Estos objetos forman parte de las **Web APIs** y permiten manipular la página, mostrar información o controlar el comportamiento del navegador.

---

### 5.1 console

El objeto **console** permite mostrar información en la consola del navegador.

Es muy utilizado para **depurar código y visualizar valores durante el desarrollo**.

Ejemplos:

```javascript
console.log("Hola mundo");
console.error("Ha ocurrido un error");
console.warn("Advertencia");
console.table([1,2,3]);
console.clear();
```

La consola se puede abrir desde las **herramientas de desarrollo del navegador (DevTools)**.

---

### 5.2 document

El objeto **document** representa el **documento HTML de la página**.

Permite acceder y modificar elementos del DOM.

Ejemplos:

```javascript
document.getElementById("titulo");
document.querySelector(".menu");
document.querySelectorAll("p");
document.createElement("div");
```

Con el objeto `document` es posible:

* seleccionar elementos HTML
* modificar contenido
* crear nuevos elementos
* manipular la estructura de la página

---

### 5.3 window

El objeto **window** representa la **ventana del navegador**.

Es el objeto global del entorno web y contiene muchas funciones y propiedades relacionadas con el navegador.

Ejemplos:

```javascript
window.innerWidth
window.innerHeight
window.location
window.alert("Hola")
window.open("https://google.com")
```

Muchas funciones del navegador pertenecen a `window`, aunque se pueden usar sin escribir `window.`.

