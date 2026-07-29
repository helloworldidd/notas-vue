# JS Estructuras
_Arreglos y ciclos en algoritmos_

[INDICE]



alarcon





## 1. Arreglo

### 1.1. ¿Qué es un arreglo?

Un **arreglo (array)** es una estructura de datos que permite almacenar múltiples valores dentro de una sola variable.

Los datos se organizan como una **colección ordenada de elementos**.

Ejemplo:

```javascript
let arreglo = ["Dato1", "Dato2", "Dato3"];
```

Los arreglos se utilizan cuando necesitamos trabajar con **grandes conjuntos de datos**.

Ejemplos de uso:

* análisis de datos
* predicciones
* cálculos científicos
* procesamiento de información







### 1.2. Crear arreglos

Para crear un arreglo se usan **corchetes `[]`**.

Ejemplo:

```javascript
let datos = [];
datos = ["Dato1", "Dato2"];
```

También podemos declarar arreglos constantes.

```javascript
const constantes = [3.1415, 2.113];
```







### 1.3. Acceder a elementos de un arreglo

Cada elemento del arreglo tiene una **posición (índice)**.

Los índices comienzan desde **0**.

Ejemplo:

```javascript
let datos = ["Dato1", "Dato2", "Dato3"];

datos[0]; // "Dato1"
datos[1]; // "Dato2"
datos[2]; // "Dato3"
```










### 1.4. Contar elementos de un arreglo

Podemos conocer la cantidad de elementos con la propiedad `length`.

```javascript
let datos = ["Dato1", "Dato2", "Dato3"];

datos.length; // 3
```

Para encontrar la posición de un elemento:

```javascript
datos.lastIndexOf("Dato2"); // 1
```










### 1.5. Iterar sobre un arreglo

Una **iteración** es repetir instrucciones varias veces.

En JavaScript se pueden recorrer arreglos usando ciclos.

#### Ejemplo con `for`

```javascript
let datos = ["Dato1", "Dato2", "Dato3"];

for (let i = 0; i < datos.length; i++){
  console.log(datos[i]);
}
```



#### Ejemplo con `while`

```javascript
let datos = ["Dato1", "Dato2", "Dato3"];
let contador = 0;
let dato = "";

while(dato != "Dato2"){
  dato = datos[contador];
  contador++;
}
```

⚠️ Es importante que los ciclos tengan una condición de término para evitar **bucles infinitos**.








## 2. Manipulación de arreglos

### 2.1. Insertar elementos en un arreglo

Podemos agregar elementos de distintas formas.

#### Insertar en una posición

```javascript
let datos = ["Dato1","Dato2","Dato3"];

datos[4] = "Dato5";
```

Resultado:

```
["Dato1","Dato2","Dato3",undefined,"Dato5"]
```



#### Insertar al final del arreglo

```javascript
datos.push("Dato6");
```


















### 2.2. Eliminar elementos de un arreglo

JavaScript ofrece distintos métodos.

#### Eliminar primer elemento

```javascript
datos.shift();
```



#### Eliminar último elemento

```javascript
datos.pop();
```



#### Eliminar por índice

```javascript
datos.splice(1,1);
```



#### Vaciar arreglo

```javascript
datos.length = 0;
```

















## 3. Operaciones con arreglos



### 3.1. Álgebra de arreglos

Podemos realizar operaciones entre arreglos.



#### Unión

Combina elementos de dos arreglos sin repetir.

```javascript
let arr1 = ["Dato1","Dato2"];
let arr2 = ["Dato2","Dato3"];

let arr3 = [...new Set([...arr1,...arr2])];
```

Resultado:

```
["Dato1","Dato2","Dato3"]
```



#### Intersección

Elementos comunes entre dos arreglos.

```javascript
let arr3 = arr1.filter(x => arr2.includes(x));
```

Resultado:

```
["Dato2"]
```



#### Diferencia

Elementos que existen en un arreglo pero no en otro.

```javascript
let arr3 = arr1.filter(x => !arr2.includes(x));
```

Resultado:

```
["Dato1"]
```



#### Concatenación

Une dos arreglos sin eliminar repetidos.

```javascript
let arr3 = arr1.concat(arr2);
```

### 3.2. Matrices

Una **matriz** es un arreglo dentro de otro arreglo.

Ejemplo:

```javascript
let matriz = [
  [3,1],
  [2,1]
];

console.log(matriz[0][0]); // 3
console.log(matriz[0][1]); // 1
console.log(matriz[1][0]); // 2
console.log(matriz[1][1]); // 1
```

### 3.3. Arreglos asociativos

Un arreglo asociativo utiliza **clave : valor**.

Ejemplo:

```javascript
let auto = [];

auto["marca"] = "BMW";
auto["color"] = "Azul";
auto["patente"] = "XM ZK 92";

console.log(auto["marca"]);
```















## 4. Ciclos

### 4.1. ¿Para qué sirven los ciclos?

Los **ciclos** permiten ejecutar un bloque de código repetidamente.

JavaScript tiene varios tipos:

```
for
while
do while
for-in
for-of
```

### 4.2. Ciclo while

Ejecuta código **mientras la condición sea verdadera**.

```javascript
let i = 0;
let x = 0;

while(i < 10){
  i++;
  x += i;
}
```


### 4.3. Ciclo do while

Primero ejecuta el código y luego evalúa la condición.

```javascript
let i = 0;

do{
  i++;
  console.log(i);
}
while(i < 5);
```



### 4.4. Ciclo for

Es uno de los ciclos más utilizados.

Estructura:

```javascript
for(inicializacion; condicion; incremento){
   // código
}
```

Ejemplo:

```javascript
for(let i = 0; i < 10; i++){
  console.log(i);
}
```




### 4.5. Ciclos anidados

Un ciclo puede estar dentro de otro.

```javascript
for(let i = 0; i < 10; i++){
   for(let j = 0; j < 10; j++){
      // código
   }
}
```

Se utilizan frecuentemente para recorrer **matrices**.

### 4.6. Cortar un ciclo

Podemos detener un ciclo usando `break`.

```javascript
for(let i = 0; i < 10; i++){
  if(i == 2){
     break;
  }
}
```














## 5. Uso de ciclos en programación

### 5.1. Sumatorias con ciclos

Los ciclos pueden usarse para realizar acumulaciones.

Ejemplo:

```javascript
let n = 0;
let suma = 0;

while(n < 5){
  n++;
  suma += n;
}

console.log(suma); // 15
```

### 5.2. Scope en ciclos

Las variables declaradas dentro del ciclo **solo existen dentro del ciclo**.

```javascript
let i;

while(condicion){
  let x;
}
```







## 6. Buenas prácticas


### 6.1. Código limpio

- El **código limpio** busca que el programa sea fácil de:

  * leer
  * entender
  * mantener
  * modificar

> Los buenos programadores escriben código que los humanos pueden entender"
– Martin Fowler

### 6.2. Importancia del código limpio

- Ventajas:

  * mejor mantenimiento
  * menos errores
  * código reutilizable
  * mayor eficiencia en el trabajo en equipo

### 6.3. Buenas prácticas

- Algunas recomendaciones:

  - Evitar repetir código
  - Eliminar código innecesario
  - Reducir dependencia entre HTML y JS
  - Evitar cálculos innecesarios en ciclos
  - Realizar pruebas de rendimiento

