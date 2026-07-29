# Javascript
_Lenguaje que permite agregar interactividad a las páginas web_

[INDICE]


## 1. JavaScript

### 1.1 Qué es JavaScript

**JavaScript** es un lenguaje de programación que permite agregar **interactividad y comportamiento dinámico** a una página web.

Con JavaScript podemos:

* responder a acciones del usuario
* modificar contenido de la página
* validar formularios
* realizar cálculos
* comunicarnos con servidores

Ejemplo simple:

```javascript
console.log("Hola mundo");
```

JavaScript es uno de los **lenguajes fundamentales del desarrollo web** junto con:

```
HTML → estructura
CSS → diseño
JavaScript → interacción
```

### 1.2. Enlaces de interés

* Documentación JS Mozilla (https://developer.mozilla.org/es/docs/Web/JavaScript)
* Documentación W3Schools JS https://www.w3schools.com/js/
* wikipedia (https://es.wikipedia.org/wiki/JavaScript)
* Documentación Official JS https://tc39.es/ecma262/


### 1.3. Historia breve de JavaScript

JavaScript fue creado en **1995 por Brendan Eich** mientras trabajaba en **Netscape**.

El lenguaje fue desarrollado en solo **10 días**.

Inicialmente se llamó:

* Mocha
* LiveScript

Luego adoptó el nombre **JavaScript**.

En **1997** el lenguaje fue estandarizado por **ECMA International** bajo el nombre:

```
ECMAScript
```

Algunos hitos importantes:

| Año  | Evento                     |
| ---- | -------------------------- |
| 1995 | Creación de JavaScript     |
| 1997 | Estandarización ECMAScript |
| 1999 | Aparición de AJAX          |
| 2009 | Nace Node.js               |
| 2015 | ES6 moderniza el lenguaje  |

Hoy JavaScript es **el lenguaje más usado en desarrollo web**.


### 1.4. Características de JavaScript

JavaScript tiene varias características importantes.

- **Lenguaje interpretado**  
    - El navegador ejecuta el código directamente.
    - No necesita compilación previa.

- **Orientado a prototipos**
    - JavaScript usa un modelo de **objetos basados en prototipos**.
    - Los objetos pueden heredar propiedades de otros objetos.

- **Multiplataforma**. Puede ejecutarse en:
    - navegadores
    - servidores (Node.js)
    - aplicaciones
    - dispositivos

- **Tipado dinámico**
    - Una variable puede cambiar de tipo durante la ejecución.

    ```javascript
    let dato = 10
    dato = "Hola"
    ```


## 2. Conceptos básicos de programación

### 2.1 Lenguaje de programación

Es una forma de **dar instrucciones a un computador** para que realice tareas.


### 2.2 Aprender a programar

Aprender programación requiere:

* práctica constante
* pensamiento lógico
* tiempo y paciencia

El progreso suele ser gradual.


### 2.3 Indentación

La **indentación** es el uso de espacios para organizar el código.

Ejemplo:

```javascript
if (edad > 18) {
    console.log("Mayor de edad")
}
```

Mejora la **legibilidad del código**.


### 2.4 Comentarios

Los comentarios son textos que **el navegador ignora**.

Sirven para explicar el código.

```javascript
// comentario de una línea

/*
comentario
de varias líneas
*/
```


## 3. JavaScript en la web


### 3.1. Cómo agregar JavaScript a HTML

Hay dos formas principales.


**Script en línea**

```html
<script>
console.log("Hola")
</script>
```


**Script externo**

```html
<script src="js/index.js"></script>
```

Esta es la forma **más recomendada**.


### 3.2. Ubicación del script

El script puede ubicarse en distintas partes del HTML.

**En el head**

```html
<head>
<script src="app.js"></script>
</head>
```

**Antes de cerrar body (recomendado)**

```html
<body>

<script src="app.js"></script>
</body>
```
















## 4. JavaScript y el navegador


### 4.1. DOM (Document Object Model)

El **DOM** representa el documento HTML como un **árbol de objetos**.

Esto permite que JavaScript:

* acceda a elementos
* modifique contenido
* cambie estilos
* responda a eventos


### 4.2. Seleccionar elementos

**getElementById**
Permite seleccionar un elemento por su id.

```javascript
document.getElementById("titulo")
```


### 4.3. Eventos

Los **eventos** permiten reaccionar a acciones del usuario.

Ejemplos:

* click
* cambio de valor
* movimiento del mouse

Ejemplo:

```html
<button onclick="saludar()">Click</button>
```









## 5. Fundamentos del lenguaje




### 5.1. Variables

Una **variable** es un espacio de memoria donde guardamos información.

```javascript
let nombre = "Juan"
```

También existen **constantes**:

```javascript
const PI = 3.14
```


### 5.2. Tipos de datos

JavaScript maneja varios tipos de datos.

* string
* number
* boolean
* object
* array
* null
* undefined


### 5.3. Concatenación

La **concatenación** une textos o variables.

```javascript
let saludo = "Hola " + nombre
```





### 5.4. Expresiones y operadores

JavaScript permite realizar operaciones.

**Asignación**

```javascript
let x = 5
```

**Aritméticas**

```javascript
10 + 2
5 * 3
```

**Comparación**

```javascript
5 == 5
```

Estas operaciones retornan **true o false**.


### 5.5. Condicionales

Los **condicionales** permiten tomar decisiones.

**if**

```javascript
if (edad >= 18) {
    console.log("Mayor de edad")
}
```


**if / else**

```javascript
if (edad >= 18) {
    console.log("Mayor de edad")
} else {
    console.log("Menor de edad")
}
```







### 5.6. Bucles e iteraciones

Los **bucles** permiten repetir una acción varias veces.

Ejemplo conceptual:

```javascript
for (let i = 0; i < 5; i++) {
    console.log(i)
}
```

Cada repetición se llama **iteración**.






### 5.7. Funciones

Una **función** es un bloque de código reutilizable.

```javascript
function saludar() {
    console.log("Hola")
}
```

Para ejecutarla:

```javascript
saludar()
```


**Partes de una función**

* nombre
* parámetros (opcional)
* cuerpo
* retorno (opcional)



**Parámetros**
 - Son variables que se envían a una función.
 - También se llaman **argumentos**.


























## 6. Herramientas del desarrollador


### 6.1 Consola del navegador

La **consola** permite ejecutar código y ver resultados.

Se abre con:

```
Click derecho → Inspeccionar → Console
```

Ejemplo:

```javascript
console.log("Hola mundo")
```

También existen:

```javascript
console.error()
console.warn()
console.table()
```


### 6.2. Estilos en consola

Se pueden aplicar estilos usando `%c`.

```javascript
console.log("%cHola", "color:red; font-size:20px")
```








## 7. Librerías

### 7.1. jQuery, Lodash, Moment.js

Una **librería** es código reutilizable que resuelve tareas comunes.
Ejemplos conocidos:

* **jQuery**  
  Librería que facilita la manipulación del DOM, eventos y animaciones en páginas web.

* **Lodash**  
  Librería que ofrece muchas funciones útiles para trabajar con arrays, objetos y datos en JavaScript.

* **Moment.js**  
  Librería utilizada para manejar fechas y horas de forma más sencilla.

