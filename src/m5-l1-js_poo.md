# JS POO
_Programación Orientada a Objetos en JavaScript_

[INDICE]



## 1. Paradigmas de programación

Un **paradigma de programación** es una forma o estilo de resolver problemas mediante código.

Los lenguajes de programación pueden utilizar distintos paradigmas.

Algunos de los más conocidos son:

```
Paradigma imperativo
Programación orientada a objetos (POO)
Paradigma reactivo

```

Cada paradigma propone una forma diferente de organizar el código para resolver un problema. 




## 2. Abstracción en programación

La **abstracción** consiste en representar un objeto enfocándose solo en las características importantes.

En programación esto significa **mostrar solo el comportamiento necesario de un objeto y ocultar los detalles internos**.

Esto permite:

- simplificar el diseño del software
- reducir la complejidad del código
- trabajar con modelos más claros del problema. 



## 3. Clase, objeto e instancia

En programación orientada a objetos existen tres conceptos clave.

### Clase
Una **clase** es un molde o plantilla que define cómo se crean los objetos.

### Objeto
Un **objeto** es una entidad creada a partir de una clase.

### Instancia
Una **instancia** es el objeto concreto generado desde una clase.



## 4. Crear una clase en JavaScript

Para crear una clase se utiliza la palabra reservada: ```class```

Ejemplo:

```javascript
class Rectangulo {

  constructor(alto, ancho){
    this.alto = alto
    this.ancho = ancho
  }

}
```

El **constructor** es un método especial que se ejecuta cuando se crea un objeto. 











## 5. Crear objetos a partir de una clase

Para crear un objeto se utiliza la palabra:

```
new
```

Ejemplo:

```javascript
class Rectangulo {

  constructor(alto, ancho){
    this.alto = alto
    this.ancho = ancho
  }

  area(){
    return this.alto * this.ancho
  }

}

const cuadrado = new Rectangulo(10,10)

console.log(cuadrado.area())
```

Una clase permite crear **muchos objetos con la misma estructura**.





## 6. Propiedades y métodos

Dentro de una clase existen dos elementos principales.

### Propiedades

Son los **datos del objeto**.

```
alto
ancho
```

### Métodos

Son **funciones que operan sobre las propiedades del objeto**.

```javascript
area(){
  return this.alto * this.ancho
}
```

También pueden existir:

```
getters
métodos estáticos
```

que permiten acceder o crear comportamientos adicionales.





## 7. Crear múltiples instancias

Una clase permite crear varios objetos distintos.

```javascript
const r1 = new Rectangulo(5,10)
const r2 = new Rectangulo(3,7)
const r3 = new Rectangulo(8,4)

console.log(r1.area())
console.log(r2.area())
console.log(r3.area())
```

Cada objeto tiene **sus propios valores**, pero todos utilizan la misma estructura de la clase.





## 8. Prototype

En JavaScript los objetos pueden compartir métodos mediante **prototype**.

Ejemplo:

```javascript
function Rectangle(height, width){
  this.height = height
  this.width = width
}

Rectangle.prototype.calcArea = function(){
  return this.height * this.width
}
```

Los objetos creados con `new` heredan los métodos definidos en `prototype`. 






## 9. Objetos literales

Otra forma de crear objetos es mediante **objetos literales**.

```javascript
let perro = {
  nombre: "Scott",
  color: "Café",
  edad: 5,
  macho: true
}
```

Este tipo de objeto se define directamente con sus propiedades.




## 10. Clases vs objetos literales

Un **objeto literal** representa una única entidad.

Una **clase** funciona como un molde que permite crear muchos objetos similares.

Ejemplo con clase:

```javascript
class Perro {

  constructor(nombre){
    this.nombre = nombre
  }

  ladrar(){
    console.log("¡Guau!")
  }

}

const miPerro = new Perro("Rocky")
```

Las clases hacen que el código sea **más reutilizable y escalable**.






## 11. Pilares de la programación orientada a objetos

La programación orientada a objetos se basa en varios principios fundamentales.

### Herencia

Permite que una clase herede propiedades y métodos de otra.

```javascript
class Mamifero {

  constructor(nombre){
    this.nombre = nombre
  }

  respirar(){
    console.log(this.nombre + " está respirando")
  }

}

class Perro extends Mamifero {

  ladrar(){
    console.log("¡Guau!")
  }

}
```

En este caso **Perro hereda de Mamifero**.

### Polimorfismo

Permite que distintos objetos respondan al mismo método de forma diferente.

Por ejemplo:

```
Perro.hacerSonido()
Gato.hacerSonido()
```

Cada objeto implementa su propio comportamiento.

### Encapsulamiento

Consiste en **agrupar datos y comportamiento dentro de una misma estructura**.

Esto permite controlar cómo se accede y modifica la información.




## 12. ¿Qué es JSON?

**JSON (JavaScript Object Notation)** es un formato utilizado para intercambiar datos.

Es fácil de leer tanto por humanos como por máquinas.

Ejemplo:

```json
{
  "nombre": "Ana",
  "edad": 25,
  "ciudad": "Valparaíso"
}
```

JSON es independiente del lenguaje y permite que distintos sistemas intercambien información. 

## 13. Idea clave

La **programación orientada a objetos (POO)** permite organizar el código en estructuras que representan entidades del mundo real.

Sus principales beneficios son:

```
reutilización de código
mejor organización
mayor escalabilidad
```

Es uno de los paradigmas más utilizados en el desarrollo de software moderno.

## 14. Ejercicio práctico

Crear un programa que:

1. defina una clase `Contacto`
2. almacene nombre y número telefónico
3. permita crear varios contactos
4. busque un número dentro de la agenda
5. muestre a quién pertenece ese número


