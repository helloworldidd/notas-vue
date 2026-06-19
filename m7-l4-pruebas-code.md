










<br>
<br>

Configurar Vite En **vite.config.js**:

```js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue],

  test: {
    globals: true,
    environment: 'jsdom'
  }
})
```



<br>
<br>

<br>
<br>







### Testear una función


Supongamos que tenemos una función encargada de calcular el total de un carrito de compras.

```js
export function calcularTotal(productos) {
  return productos.reduce(
    (total, producto) => total + producto.precio,
    0
  )
}
```

Esta función recibe un arreglo de productos y devuelve la suma de todos sus precios.


<br>

**Estructura recomendada**

```txt
src/
├─ utils/
│  ├─ cart.js
│  └─ cart.test.js
│
├─ components/
│  └─ ShoppingCart.vue
│
├─ views/
├─ stores/
└─ App.vue
```


**Vitest no crea funciones ni modifica tu aplicación.**

```txt
cart.js
↓
Contiene el código real
```

```txt
cart.test.js
↓
Verifica que el código funcione correctamente
```





<br>

src/componnets/ShoppingCart.vue

```vue
<script setup>
import { ref, computed } from 'vue'
import { calcularTotal } from '@/utils/cart'

const productos = ref([
  {
    id: 1,
    nombre: 'Aros Cherry',
    precio: 12000
  },
  {
    id: 2,
    nombre: 'Collar Luna',
    precio: 15000
  }
])

const total = computed(() =>
  calcularTotal(productos.value)
)
</script>

<template>
  <section>
    <h2>Carrito</h2>

    <ul>
      <li
        v-for="producto in productos"
        :key="producto.id"
      >
        {{ producto.nombre }}
        -
        ${{ producto.precio }}
      </li>
    </ul>

    <h3>
      Total: ${{ total }}
    </h3>
  </section>
</template>
```


src/utils/cart.js

```js
export function calcularTotal(productos) {
  return productos.reduce(
    (total, producto) => total + producto.precio,
    0
  )
}
```









src/test/cart.test.js

```js
import { describe, it, expect } from 'vitest'
import { calcularTotal } from './cart'

describe('calcularTotal', () => {
  it('suma correctamente los precios', () => {
    const productos = [
      { precio: 12000 },
      { precio: 15000 },
      { precio: 10000 }
    ]

    expect(
      calcularTotal(productos)
    ).toBe(37000)
  })
})
```







<br>

**Explicación del test**

**describe()** Agrupa pruebas relacionadas.
  Se puede leer como:`Pruebas de la función calcularTotal`

```js
describe('calcularTotal', () => {

})
```


**it()** Representa un caso de prueba específico.
  Se puede leer como: `Debe sumar correctamente los precios`

```js
it('suma correctamente los precios', () => {

})
```




**expect()** Indica el valor que queremos comprobar.
  Se puede leer como: `Espero que calcularTotal(productos) devuelva el resultado correcto`

```js
expect(
  calcularTotal(productos)
)
```


**toBe()** Compara el resultado obtenido con el esperado.
  Se puede leer como: `Espero que el resultado sea exactamente 37000`

```js
expect(
  calcularTotal(productos)
).toBe(37000)
```








<br><br><br>




caso de prueba **Carrito vacío**

```js
it('retorna 0 si el carrito está vacío', () => {
  expect(
    calcularTotal([])
  ).toBe(0)
})
```

caso de prueba **Un único producto**


```js
it('calcula el total de un producto', () => {
  expect(
    calcularTotal([
      { precio: 12000 }
    ])
  ).toBe(12000)
})
```


caso de prueba **Varios productos** 


```js
it('calcula el total de varios productos', () => {
  expect(
    calcularTotal([
      { precio: 5000 },
      { precio: 10000 },
      { precio: 20000 }
    ])
  ).toBe(35000)
})
```









<br><br>

Archivo completo

```js
import { describe, it, expect } from 'vitest'
import { calcularTotal } from './cart'

describe('calcularTotal', () => {

  it('suma correctamente los precios', () => {
    const productos = [
      { precio: 12000 },
      { precio: 15000 },
      { precio: 10000 }
    ]

    expect(
      calcularTotal(productos)
    ).toBe(37000)
  })

  it('retorna 0 si el carrito está vacío', () => {
    expect(
      calcularTotal([])
    ).toBe(0)
  })

  it('calcula el total de un producto', () => {
    expect(
      calcularTotal([
        { precio: 12000 }
      ])
    ).toBe(12000)
  })

  it('calcula el total de varios productos', () => {
    expect(
      calcularTotal([
        { precio: 5000 },
        { precio: 10000 },
        { precio: 20000 }
      ])
    ).toBe(35000)
  })

})
```


Ejecutar los tests

```bash
npm run test
```




<br>
<br>
<br>































### Testear funcion en Componente


src/components/AlternativeCart.vue

```vue
<script setup>
import { productos } from '@/data/productos'

function calcularTotal(productos) {
  return productos.reduce(
    (total, producto) => total + producto.precio,
    0
  )
}
</script>

<template>
  <section>
    <ul>
      <li
        v-for="producto in productos"
        :key="producto.id"
      >
        {{ producto.nombre }}
      </li>
    </ul>

    <h3>Total: ${{ calcularTotal(productos) }}</h3>
  </section>
</template>
```


src/components/AlternativeCart.test.js

```js
import { describe, it, expect, vi } from 'vitest'
import { mount } from '@vue/test-utils'

import AlternativeCart from './AlternativeCart.vue'

vi.mock('@/data/productos', () => ({
  productos: [
    {
      id: 1,
      nombre: 'Producto test 1',
      precio: 100
    },
    {
      id: 2,
      nombre: 'Producto test 2',
      precio: 200
    }
  ]
}))

describe('AlternativeCart', () => {
  it('muestra el total correcto usando datos mockeados', () => {
    const wrapper = mount(AlternativeCart)

    expect(wrapper.text()).toContain('300')
  })

  it('renderiza dos productos', () => {
    const wrapper = mount(AlternativeCart)

    const items = wrapper.findAll('li')

    expect(items.length).toBe(2)
  })

  it('muestra los productos mockeados', () => {
    const wrapper = mount(AlternativeCart)

    expect(wrapper.text()).toContain('Producto test 1')
    expect(wrapper.text()).toContain('Producto test 2')
  })
})
```





















































































---

## Alternativas a Vitest

### 1) Jest

Durante muchos años fue la herramienta más utilizada para testing en JavaScript.

Funciones principales:

- Ejecutar tests
- Crear mocks
- Crear spies
- Realizar validaciones

Ejemplo:

```js
describe('sumar', () => {
  it('suma dos números', () => {
    expect(2 + 2).toBe(4)
  })
})
````

Actualmente se encuentra principalmente en proyectos antiguos o proyectos que no utilizan Vite.

---

### 2) Mocha + Chai + Sinon

Antes era una combinación muy popular porque cada librería tenía una responsabilidad específica.

#### Mocha

Ejecuta los tests.

```js
describe()
it()
```

#### Chai

Realiza las validaciones.

```js
expect(valor).to.equal(10)
```

#### Sinon

Permite crear:

* Mocks
* Stubs
* Spies
* Funciones simuladas

```js
const spy = sinon.spy()
```

---

### Comparación rápida

| Herramienta | Función                                   |
| ----------- | ----------------------------------------- |
| **Vitest**  | Testing moderno para proyectos con Vite   |
| **Jest**    | Testing general, muy usado históricamente |
| **Mocha**   | Ejecuta tests                             |
| **Chai**    | Validaciones (assertions)                 |
| **Sinon**   | Mocks, Stubs y Spies                      |

---

### Lo más utilizado actualmente (2026)

| Contexto           | Herramienta                 |
| ------------------ | --------------------------- |
| Vue 3 + Vite       | **Vitest + Vue Test Utils** |
| React + Vite       | **Vitest**                  |
| Proyectos antiguos | **Jest**                    |
| Legacy JavaScript  | **Mocha + Chai + Sinon**    |

````

Además puedes agregar una observación pedagógica:

```md
💡 Vitest reúne gran parte de lo que antes se hacía con varias librerías:

Jest
o
Mocha + Chai + Sinon

↓

Vitest + Vue Test Utils
````


















---

## Test Doubles

Los **Test Doubles** son objetos o funciones falsas que utilizamos durante las pruebas para reemplazar dependencias reales.

Permiten probar una parte de la aplicación de forma aislada, sin depender de bases de datos, APIs, servicios externos o componentes complejos.

```txt
Test Double
├─ Dummy
├─ Fake
├─ Stub
├─ Spy
└─ Mock
```

<br><br>

### Dummy

Es un objeto que existe únicamente porque una función lo necesita como parámetro.

No tiene comportamiento ni lógica.

Ejemplo:

```js
function saludar(usuario) {
  return 'Hola'
}

const usuario = {}

saludar(usuario)
```

En este caso:

```js
{}
```

es un Dummy.

<br><br>

### Fake

Tiene una implementación real pero simplificada.

Se utiliza para reemplazar sistemas complejos durante las pruebas.

Ejemplo:

```js
class FakeDatabase {
  usuarios = []

  guardar(usuario) {
    this.usuarios.push(usuario)
  }
}
```

En lugar de conectarse a una base de datos real:

```txt
MySQL
MongoDB
Firebase
```

utiliza una versión simple en memoria.

<br><br>

### Stub

Devuelve respuestas controladas.

Permite reemplazar llamadas reales por resultados predefinidos.

Ejemplo:

```js
const obtenerUsuario = () => ({
  nombre: 'Patricio'
})
```

Siempre devolverá el mismo resultado.

Con Vitest:

```js
vi.spyOn(api, 'getUser')
  .mockReturnValue({
    nombre: 'Patricio'
  })
```

<br><br>

### Spy

Observa cómo se utiliza una función.

Permite responder preguntas como:

```txt
¿Se llamó?
¿Cuántas veces?
¿Con qué argumentos?
```

Ejemplo:

```js
const spy = vi.fn()

spy()
spy()
```

Test:

```js
expect(spy)
  .toHaveBeenCalledTimes(2)
```

<br><br>

### Mock

Es el tipo más utilizado.

Combina características de:

```txt
Stub
+
Spy
```

Puede:

* Devolver valores falsos
* Registrar llamadas
* Verificar argumentos

Ejemplo:

```js
const login = vi.fn()

login.mockReturnValue(true)

login('admin', '123456')
```

Test:

```js
expect(login)
  .toHaveBeenCalledWith(
    'admin',
    '123456'
  )
```

<br><br>

## Ejemplo en Vue

Supongamos que un componente utiliza Axios:

```js
import axios from 'axios'
```

No queremos llamar una API real durante el test.

Mock:

```js
vi.mock('axios')
```

Respuesta simulada:

```js
axios.get.mockResolvedValue({
  data: [
    {
      nombre: 'Aros Cherry'
    }
  ]
})
```

Ahora el componente cree que recibió datos reales, pero en realidad los datos fueron simulados por el test.

<br><br>

## Resumen rápido

| Tipo  | ¿Qué hace?                      |
| ----- | ------------------------------- |
| Dummy | Solo rellena parámetros         |
| Fake  | Implementación simplificada     |
| Stub  | Devuelve respuestas controladas |
| Spy   | Observa llamadas                |
| Mock  | Stub + Spy                      |

---

## Lo más común en Vue 3 + Vitest

Normalmente utilizarás:

```js
vi.fn()
```

para crear Spies o Mocks.

```js
vi.mock()
```

para reemplazar APIs, módulos o servicios externos.

Por eso en proyectos Vue modernos escucharás mucho:

```txt
Mock Axios
Mock API
Mock Router
Spy Function
vi.fn()
vi.mock()
```

























---

## E2E

**End To End** o **Prueba de principio a fin.** 

Aquí ya no pruebas una función.

Pruebas el flujo completo.

Ejemplo:

1. Usuario abre la web
2. Hace login
3. Agrega producto
4. Compra

Todo junto.



