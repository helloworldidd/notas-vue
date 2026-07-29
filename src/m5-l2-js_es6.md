# JS ES6
_Nuevas funcionalidades de ES6+_

[INDICE]



## 1. ¿Qué es ES6?

**ES6 (ECMAScript 2015)** es una actualización importante del lenguaje JavaScript publicada en 2015.

Esta versión introdujo nuevas características que permiten escribir código:

- más claro
- más moderno
- más fácil de mantener

Entre sus novedades se encuentran:

```
clases
funciones flecha
módulos
desestructuración
spread operator
```

Estas mejoras permiten trabajar con JavaScript de forma más cercana a otros lenguajes modernos.



## 2. Compatibilidad de ES6

No todos los navegadores antiguos soportan todas las características de ES6.

Para revisar compatibilidad se puede usar:

```

[https://compat-table.github.io/compat-table/es6/](https://compat-table.github.io/compat-table/es6/)

```id="1n4k4y"

Esta tabla muestra qué características funcionan en cada navegador.



## 3. Webpack

**Webpack** es una herramienta que permite organizar proyectos JavaScript.

Sirve para:

- gestionar dependencias
- combinar archivos
- trabajar con módulos
- optimizar código

Se instala utilizando npm:

```bash
npm install -g webpack
```

Se utiliza principalmente en **aplicaciones grandes con muchos archivos JavaScript**. 

## 4. Babel

**Babel** es una herramienta que transforma código moderno de JavaScript para que funcione en navegadores antiguos.

Convierte código **ES6+ → JavaScript compatible**.

Ejemplo:

```bash
node_modules/.bin/babel script.js -o script-compiled.js
```

Esto genera una versión del script compatible con más navegadores. 

## 5. Polyfill

Un **polyfill** es un fragmento de código que agrega funcionalidades modernas en navegadores antiguos.

Ejemplo:

```javascript
if(!String.prototype.startsWith){
  String.prototype.startsWith = function(searchString, position){
    position = position || 0;
    return this.indexOf(searchString, position) === position;
  };
}
```

Esto permite usar funciones nuevas incluso si el navegador no las soporta.

## 6. Variables: let y const

ES6 introduce nuevas formas de declarar variables.

### let

Tiene **alcance de bloque**.

```javascript
function ejemplo(){

  let a = 3;

  if(a < 5){
    let b = 10
    console.log(a + b)
  }

}
```

La variable `b` solo existe dentro del bloque `if`.

### const

Se usa para declarar **constantes**.

```javascript
const PI = 3.1416
```

Una vez definida, su valor no puede cambiar.

## 7. Parámetros por defecto

Las funciones pueden tener **valores predeterminados**.

```javascript
function multiply(a, b = 1){
  return a * b
}

multiply(5,2)
multiply(5)
```

Si no se pasa un parámetro, se usa el valor por defecto. 

## 8. Funciones flecha

Las **arrow functions** permiten escribir funciones de forma más compacta.

Función tradicional:

```javascript
function suma(a){
  return a + 100
}
```

Función flecha:

```javascript
let suma = (a) => a + 100
```

## 9. Interpolación de cadenas

Permite insertar variables dentro de un texto utilizando **template literals**.

```javascript
let nombre = "Juan"

console.log(`Hola ${nombre}`)
```

Esto hace que concatenar texto sea más simple.

## 10. Desestructuración

La **desestructuración** permite extraer valores de arreglos u objetos.

Ejemplo con arreglo:

```javascript
const x = [1,2,3,4]

const [a,b] = x

console.log(a)
console.log(b)
```

Ejemplo con objeto:

```javascript
const user = {
  id: 42,
  activo: true
}

const {id, activo} = user
```

## 11. Operador Spread

El operador **spread (`...`)** permite expandir elementos de un arreglo.

```javascript
const numbers = [1,2,3]

console.log(...numbers)
```

Salida:

```
1 2 3
```

## 12. Operador Rest

El operador **rest (`...`)** permite recibir múltiples argumentos en una función.

```javascript
function suma(...numeros){
  return numeros.reduce((a,b) => a + b)
}

console.log(suma(1,2,3))
```

Esto permite trabajar con un número variable de parámetros.

## 13. Clases y herencia en ES6

ES6 introduce una sintaxis moderna para trabajar con clases.

```javascript
class Persona{

  constructor(nombre, edad){
    this.nombre = nombre
    this.edad = edad
  }

  saludar(){
    console.log(`Hola, soy ${this.nombre}`)
  }

}

const persona1 = new Persona("Sofía",30)
```

También permite **herencia entre clases**.

```javascript
class Forma{
  constructor(){
    console.log("Soy una forma geométrica")
  }
}

class Cuadrado extends Forma{

  constructor(){
    super()
    console.log("Soy un cuadrado")
  }

}
```

## 14. Map y Set

### Map

Permite almacenar datos usando claves de cualquier tipo.

```javascript
let map = new Map()

map.set("1","texto")
map.set(1,"numero")
map.set(true,"boolean")
```

### Set

Permite almacenar **valores únicos**.

```javascript
let set = new Set()

set.add("Ana")
set.add("Juan")
set.add("Ana")

console.log(set.size)
```

El valor duplicado no se guarda.

## 15. Módulos

Los módulos permiten dividir el código en varios archivos.

Archivo:

```javascript
export function decirHola(nombre){
  alert(`Hola ${nombre}`)
}
```

Importación:

```javascript
import {decirHola} from "./hola.js"
```

## 16. Promesas

Una **promesa** representa el resultado de una operación asíncrona.

Puede tener tres estados:

```
pending
fulfilled
rejected
```

## 17. Async / Await

Permite trabajar con promesas de forma más sencilla.

```javascript
async function obtenerDatos(){

  let datos = await fetch("api")

  return datos

}
```

`await` pausa la ejecución hasta que la promesa se resuelva. 

## 18. Idea clave

ES6 introdujo mejoras importantes que hacen que JavaScript sea:

```
más moderno
más legible
más potente
```

Muchas de estas características son utilizadas en el desarrollo web actual.
