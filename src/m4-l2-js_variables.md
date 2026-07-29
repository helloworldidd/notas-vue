# JS Variables
_Variables y condicionales en algoritmos_

[INDICE]









## 1. Variables

### 1.1. Qué es una variable

Una **variable** es un contenedor con nombre que permite almacenar un valor en memoria.

Ese valor puede ser cualquier tipo de dato soportado por JavaScript.

Ejemplo:

```javascript
let name = "Pedro";                               // String
let students = 40;                                // Number
let countries = ["Venezuela","Colombia","Chile"]; // Array
let grades = {Carlos:"B", Paula:"A"};             // Object
let success = true;                               // Boolean
let nothing = null;                               // Null
```

Las variables permiten **guardar información para usarla posteriormente en el programa**.











### 1.2. Consejos para nombrar variables

Una variable debe tener un nombre que **represente su contenido**.

Reglas básicas:

* Deben comenzar con una letra, `_` o `$`
* No pueden comenzar con números
* JavaScript distingue mayúsculas y minúsculas (**case sensitive**)
* No pueden contener espacios
* Se recomienda usar **camelCase**

Ejemplo:

```javascript
let totalPrice = 100;
let userName = "Pedro";
let productList = [];
```








JavaScript es un lenguaje **dinámicamente tipado**.

Esto significa que **una variable puede cambiar de tipo de dato según el valor que se le asigne**.

Ejemplo:
```javascript
let autos;

autos = "Mercedes Benz"; // String
autos = 3;               // Number
```







### 1.3. Declaración de variables

Se recomienda declarar las variables antes de utilizarlas.

En JavaScript existen tres formas de declarar variables:

```javascript
var nombre;
let autos;
const pi = 3.14;
```

Tipos de declaración:

#### var
* Declaración antigua
* Alcance de función
* Evitar su uso en código moderno

#### let
* Puede cambiar su valor
* Tiene alcance de bloque

#### const
* No puede cambiar su valor
* Debe inicializarse al declararse









### 1.4. Inicialización de variables

Inicializar significa **asignar un valor a una variable**.

Ejemplo:
```javascript
let nombre;
let autos;

nombre = "Pedro";
autos = 3;
```

También se puede declarar e inicializar en la misma línea.
```javascript
let nombre;          // Declaración de la variable
nombre = "Pedro";    // Inicialización (asignación de un valor)
```





### 1.5. Variables constantes

Las constantes son variables cuyo valor **no puede cambiar**.
Aunque una constante no puede cambiar su valor, **los objetos y arrays declarados con const sí pueden modificar su contenido**.

Ejemplo:
```javascript
const pi = 3.14159;
const e = 2.71828;
```
```javascript
const colores = ["rojo","azul"];
colores.push("verde"); // permitido
```

Una constante debe declararse **y asignarse en la misma línea**.

























## 2. Tipos de datos


### 2.1 Tipos primitivos

Datos simples que no poseen métodos ni propiedades.

- String
- Number
- Boolean



#### String

Se utilizan para almacenar texto.
Se pueden crear con comillas simples o dobles.

```javascript
let pregunta;
let respuesta;

pregunta = "¿Es la variable tipo 'String'?";
respuesta = 'Sí es tipo "String"';
```






#### Number

Representan valores numéricos.

Ejemplo:
```javascript
let a = 15;
let b = 20.6;
let c = 15 / 0;     // Infinity
let d = "texto" / 4; // NaN
```






#### Boolean

Solo pueden almacenar dos valores:

```
true
false
```

Ejemplo:

```javascript
let activo = true;
let disponible = false;
```





### 2.2 Tipos compuestos o referenciales

Variables que contienen estructuras más complejas.
```
Object
Array
Function
```

#### Object

Los objetos almacenan múltiples valores en forma de propiedades.

Ejemplo:

```javascript
let auto = {
  modelo: "BMW X3",
  color: "Rojo",
  patente: "XL TR 96"
};
```



#### Array

Un **array** permite almacenar múltiples valores en una sola variable.

Ejemplo:

```javascript
let colores = ["rojo", "amarillo", "azul"];
```

#### Function

Una **función** es un bloque de código que se puede reutilizar y ejecutar cuando sea necesario.

Permite organizar instrucciones para realizar una tarea específica.

Ejemplo:

```javascript
function saludar() {
  console.log("Hola");
}
```

Para ejecutar la función:

```javascript
saludar();
```


### 2.3 Tipos especiales

#### undefined

Significa que una variable **existe pero no tiene valor asignado**.

```javascript
let dato;
```

#### null

Representa **la ausencia intencional de valor**.

```javascript
let usuario = null;
```




### 2.4. Identificar tipos de datos


#### typeof

JavaScript permite conocer el tipo de una variable usando el operador `typeof`.

Ejemplo:

```javascript
typeof "hola"
typeof 10
typeof true
```

Resultado:

```
string
number
boolean
```

Ejemplo en una variable:

```javascript
let edad = 25;

console.log(typeof edad);
```

Resultado:

```
number
```






## 3. Scope de una variable

El **scope** define **dónde puede ser utilizada una variable dentro del programa**.



#### Variable global

Una **variable global** está disponible en todo el programa.

Se declara fuera de funciones o bloques.

```javascript
let colores = ["rojo", "amarillo", "azul"];
```

Esta variable puede usarse en cualquier parte del código.



#### Variable local

Una **variable local** solo existe dentro del bloque o función donde fue declarada.

```javascript
function ejemplo(){
  let variable = "Hola";
  console.log(variable);
}
```

Fuera de la función no se puede acceder a esa variable.

```javascript
console.log(variable); // Error
```







## 4. Operadores

### 4.1 Operadores aritméticos

JavaScript incluye operadores matemáticos básicos.

- + suma
- - resta
- * multiplicación
- / división
- % módulo (resto de una división)


Ejemplo:

```javascript
let a = 2;
let b = 2;

a + b; // 4
a - b; // 0
a * b; // 4
a / b; // 1
a % b; // 0
```



### 4.2 Precedencia de operadores

Cuando una expresión tiene varios operadores, JavaScript sigue un **orden de prioridad**.

En operaciones aritméticas básicas el orden es:

1. multiplicación
1. división
1. resto
1. suma
1. resta


Ejemplo:

```javascript
let a = 2;
let b = 3;
let c = 4;

a + b * c; // 14
```

Porque primero se ejecuta la multiplicación.

---

### 4.3 Incremento y decremento

Permiten aumentar o disminuir una variable en **1 unidad**.

- ++
- --


Ejemplo:

```javascript
let a = 3;
let b = ++a; // prefijo

a = 3;
let c = a++; // sufijo
```

Diferencia:

```javascript
++a  // primero incrementa, luego usa el valor
a++  // primero usa el valor, luego incrementa
```



### 4.4 Operadores de comparación

Comparan valores y devuelven un **booleano** (`true` o `false`).


- ==   igual
- ===  igual estricto
- !=   distinto
- !==  distinto estricto
- >    mayor
- >=   mayor o igual
- <    menor
- <=   menor o igual


Ejemplo:

```javascript
let a = 3;

a == 3;   // true
a === 3;  // true
a != 3;   // false
a > 1;    // true
a >= 3;   // true
a < 3;    // false
```

---

### 4.5 Operadores lógicos

Permiten combinar condiciones.

- &&  AND
- ||  OR
- !   NOT


Ejemplo:

```javascript
true && true   // true
true && false  // false
false || true  // true
!true          // false
```

















## 5. Cadenas de caracteres

Un **string** es un tipo de dato que representa texto.

Los strings tienen **propiedades** y **métodos** que permiten trabajar con texto.

Ejemplo:

```javascript
"cadena".charAt(1); // "a"
"cadena".length;    // 6
```

- `charAt()` es un **método** que obtiene un carácter específico.
- `length` es una **propiedad** que indica la cantidad de caracteres.

---

### 5.1 Manipulación de strings

JavaScript incluye varios métodos para trabajar con cadenas.

Ejemplos:

```javascript
"hola".toUpperCase(); // "HOLA"
"hola".toLowerCase(); // "hola"
"hola mundo".includes("mundo"); // true
```

---

### 5.2 Concatenación

Se pueden unir cadenas usando el operador `+`.

```javascript
let nombre = "Ignacio";
let apellido = "Sepúlveda";

console.log(nombre + " " + apellido);
```

Resultado:

```
Ignacio Sepúlveda
```

También es común usar **template strings** con backticks.

```javascript
let nombre = "Ignacio";
let apellido = "Sepúlveda";

console.log(`${nombre} ${apellido}`);
```

Resultado:

```
Ignacio Sepúlveda
```




















## 6. Expresiones y sentencias

Una **sentencia** es una instrucción completa que el programa ejecuta.

Las sentencias indican **qué acción debe realizar el programa**.

Ejemplos de sentencias:

```javascript
let edad = 20;

console.log("Hola");

edad = 25;
````

Cada una de estas instrucciones es una **sentencia**, porque el programa ejecuta una acción.



### 6.1 Tipos comunes de sentencias

En JavaScript existen diferentes tipos de sentencias, por ejemplo:

```
declaración de variables
asignación de valores
llamadas a funciones
estructuras de control
```

Ejemplos:

```javascript
let numero = 10;      // declaración
numero = 20;          // asignación
console.log(numero);  // llamada a función
```



### 6.2 Expresiones y sentencias

Una **expresión** es cualquier fragmento de código que **produce un valor**.

Ejemplo:

```javascript
2 + 2
```

Resultado:

```
4
```

También son expresiones:

```javascript
"Hola"
true
10 * 5
```

Una **sentencia** ejecuta una acción completa.

Ejemplo:

```javascript
console.log(2 + 2);
```

Aquí ocurre lo siguiente:

```
2 + 2             → expresión
console.log(...)  → llamada a función
console.log(2+2); → sentencia
```

💡 Regla simple:

```
Expresión → produce un valor
Sentencia → ejecuta una acción
```

Ejemplo:

```javascript
2 + 2           // expresión
let x = 2 + 2;  // sentencia
```























## 7. Condicionales

Las **estructuras condicionales** permiten ejecutar código dependiendo de si una condición es verdadera o falsa.

---

### 7.1 if

La estructura `if` ejecuta un bloque de código **solo si la condición es verdadera**.

```javascript
if (condicion){
   // código si es verdadero
}
```

Ejemplo:

```javascript
let edad = 20;

if (edad >= 18){
   console.log("Puede entrar");
}
```

---

### 7.2 if else

La estructura `if else` permite ejecutar un bloque de código si la condición es verdadera y **otro bloque si es falsa**.

```javascript
if (condicion){
   // código si es verdadero
}else{
   // código si es falso
}
```

Ejemplo:

```javascript
let edad = 16;

if (edad >= 18){
   console.log("Puede entrar");
}else{
   console.log("No puede entrar");
}
```

---

### 7.3 else if

Permite evaluar **múltiples condiciones**.

```javascript
if (condicion1){
   // código
}else if (condicion2){
   // código
}else{
   // código final
}
```

---

### 7.4 Ejemplo de condicional

```javascript
if (edad < 12){
   return "es un/a niño/niña";
}else if (edad < 18){
   return "es un/a adolescente";
}else if (edad < 60){
   return "es un adulto";
}else{
   return "es un adulto mayor";
}
```




## 8. Manejo de condiciones de borde

Al crear algoritmos es importante considerar **todas las posibles entradas que puede recibir el programa**.

Las **condiciones de borde** son casos especiales o extremos que pueden provocar errores si no se manejan correctamente.

Ejemplos de condiciones de borde:

* edad vacía
* edad negativa
* edad nula (`null`)
* valores incorrectos
* datos inesperados

Ejemplo:

```javascript
if (edad === null || edad === undefined){
   console.log("Edad no válida");
}else if (edad < 0){
   console.log("Edad incorrecta");
}else{
   console.log("Edad válida");
}
```

Considerar estas situaciones permite **hacer programas más seguros y evitar errores**.














