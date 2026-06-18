# Métodos ES6+ de Arrays



- Loops / Recorridos

| Método        | ¿Qué hace?                     | Devuelve              |
| ------------- | ------------------------------ | --------------------- |
| `map()`       | Transforma elementos           | Nuevo array           |
| `forEach()`   | Recorre elementos              | Nada                  |
| `filter()`    | Filtra elementos               | Nuevo array           |
| `find()`      | Busca un elemento              | Objeto                |
| `findIndex()` | Busca la posición              | Número                |
| `some()`      | Verifica si alguno cumple      | Booleano              |
| `every()`     | Verifica si todos cumplen      | Booleano              |
| `reduce()`    | Calcula un resultado final     | Valor único           |
| `sort()`      | Ordena elementos               | Array ordenado        |

- Métodos de búsqueda simple

| Método        | ¿Qué hace?                     | Devuelve              |
| ------------- | ------------------------------ | --------------------- |
| `indexOf()`   | Busca posición de valor simple | Número                |
| `includes()`  | Verifica si existe un valor    | Booleano              |
  
- Utilidades para modificar o cortar arrays

| Método        | ¿Qué hace?                     | Devuelve              |
| ------------- | ------------------------------ | --------------------- |
| `slice()`     | Corta una parte                | Nuevo array           |
| `push()`      | Agrega al final                | Nuevo largo del array |
| `pop()`       | Elimina el último              | Elemento eliminado    |
| `shift()`     | Elimina el primero             | Elemento eliminado    |
| `unshift()`   | Agrega al inicio               | Nuevo largo del array |
| `splice()`    | Agrega o elimina por posición  | Elementos eliminados  |







---

## Loops / Recorridos








---

### `.map()`

`map()` sirve para transformar cada elemento de un arreglo y devolver un nuevo arreglo con los cambios.

```js
const data = [
  {
    id: 1,
    nombre: "Aros Cherry",
    precio: 12000
  },
  {
    id: 2,
    nombre: "Collar Luna",
    precio: 15000
  },
  {
    id: 3,
    nombre: "Anillo Sol",
    precio: 10000
  }
];

const nombres = data.map(item => item.nombre);

console.log(nombres);
````

Resultado:

```js
[
  "Aros Cherry",
  "Collar Luna",
  "Anillo Sol"
]
```

























---

### `.forEach()`

`forEach()` sirve para recorrer un arreglo y ejecutar una acción por cada elemento.
No devuelve un nuevo arreglo.

```js
data.forEach(item => {
  console.log(item.nombre);
});
```

Resultado:

```js
"Aros Cherry"
"Collar Luna"
"Anillo Sol"
```


















---

### `.filter()`

`filter()` devuelve un nuevo arreglo con los elementos que cumplen una condición.

```js
const productosBaratos = data.filter(
  item => item.precio < 13000
);

console.log(productosBaratos);
```

Resultado:

```js
[
  {
    id: 1,
    nombre: "Aros Cherry",
    precio: 12000
  },
  {
    id: 3,
    nombre: "Anillo Sol",
    precio: 10000
  }
]
```


















---

### `.find()`

`find()` busca un elemento dentro de un arreglo y devuelve el primer objeto que cumpla la condición.

```js
const producto = data.find(
  item => item.id === 2
);

console.log(producto);
```

Resultado:

```js
{
  id: 2,
  nombre: "Collar Luna",
  precio: 15000
}
```


















---

### `.findIndex()`

`findIndex()` devuelve la posición del primer elemento que cumple una condición.

```js
const index = data.findIndex(
  item => item.id === 2
);

console.log(index);
```

Resultado:

```js
1
```


















---

### `.some()`

`some()` revisa si al menos un elemento cumple una condición.
Devuelve `true` o `false`.

```js
const existe = data.some(
  item => item.id === 2
);

console.log(existe);
```

Resultado:

```js
true
```


















---

### `.every()`

`every()` revisa si todos los elementos cumplen una condición.
Devuelve `true` o `false`.

```js
const todosTienenPrecio = data.every(
  item => item.precio > 0
);

console.log(todosTienenPrecio);
```

Resultado:

```js
true
```


















---

### `.reduce()`

`reduce()` sirve para recorrer un arreglo y obtener un único resultado final.

Se usa mucho para sumar, contar, calcular totales o agrupar datos.

```js
const total = data.reduce(
  (acumulador, item) => acumulador + item.precio,
  0
);

console.log(total);
```

Resultado:

```js
37000
```


















---

### `.sort()`

`sort()` ordena los elementos de un arreglo.

Importante: `sort()` modifica el arreglo original, por eso normalmente se usa una copia con `[...]`.

```js
const ordenados = [...data].sort(
  (a, b) => a.precio - b.precio
);

console.log(ordenados);
```

Resultado:

```js
[
  {
    id: 3,
    nombre: "Anillo Sol",
    precio: 10000
  },
  {
    id: 1,
    nombre: "Aros Cherry",
    precio: 12000
  },
  {
    id: 2,
    nombre: "Collar Luna",
    precio: 15000
  }
]
```






























































---

## Métodos de búsqueda simple


















---

### `.indexOf()`

`indexOf()` sirve para buscar la posición de un valor simple dentro de un arreglo.

Funciona bien con strings, números y booleanos.

Si encuentra el valor, devuelve su posición.
Si no lo encuentra, devuelve `-1`.

```js
const nombres = [
  "Aros Cherry",
  "Collar Luna",
  "Anillo Sol"
];

const posicion = nombres.indexOf("Collar Luna");

console.log(posicion);
```

Resultado:

```js
1
```


















---

### `.includes()`

`includes()` revisa si un arreglo contiene un valor.
Devuelve `true` o `false`.

```js
const favoritos = [
  "Aros Cherry",
  "Collar Luna"
];

const existe = favoritos.includes("Collar Luna");

console.log(existe);
```

Resultado:

```js
true
```



































































---

## Utilidades para modificar o cortar arrays


















---

### `.slice()`

`slice()` obtiene una parte del arreglo sin modificar el original.

```js
const primerosDos = data.slice(0, 2);

console.log(primerosDos);
```

Resultado:

```js
[
  {
    id: 1,
    nombre: "Aros Cherry",
    precio: 12000
  },
  {
    id: 2,
    nombre: "Collar Luna",
    precio: 15000
  }
]
```


















---

### `.push()`

`push()` agrega un elemento al final del arreglo.

```js
data.push({
  id: 4,
  nombre: "Pulsera Estrella",
  precio: 8000
});
```


















---

### `.pop()`

`pop()` elimina el último elemento del arreglo.

```js
data.pop();
```


















---

### `.shift()`

`shift()` elimina el primer elemento del arreglo.

```js
data.shift();
```


















---

### `.unshift()`

`unshift()` agrega un elemento al inicio del arreglo.

```js
data.unshift({
  id: 0,
  nombre: "Nuevo Producto",
  precio: 5000
});
```


















---

### `.splice()`

`splice()` sirve para agregar, reemplazar o eliminar elementos en cualquier posición.

```js
data.splice(1, 1);
```

Elimina 1 elemento desde la posición 1.





























































