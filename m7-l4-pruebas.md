# Pruebas





---

## Introducción

Existen varios **niveles de pruebas**,
- desde las más pequeñas
- hasta las más cercanas al usuario final.



### Grupo 1: Pruebas de unidades pequeñas

Aquí probarías piezas aisladas e independientes.

* **Test Unitarios**

  * Una función
  * Un método
  * Un getter de Pinia
  * Una utilidad

* **Test de Componentes**

  * Un componente Vue aislado
  * Sus props
  * Sus emits
  * Su renderizado


<br>
<br>


### Grupo 2: Pruebas de flujo o integración

Aquí ya importa cómo colaboran varias piezas.
* Integración = algunas piezas juntas
* Sistema = toda la aplicación
* E2E = toda la aplicación desde la mirada del usuario

<br>


* **Integración**

  * Componente + Store
  * Store + API
  * Router + Vista

* **Sistema**

  * La aplicación completa
  * Frontend + Backend
  * Base de datos

* **E2E**

  * Simula al usuario real
  * Login → Dashboard → Comprar → Logout




<br>
<br>


### Grupo 3: UAT

**UAT (User Acceptance Testing)** no busca encontrar bugs técnicos necesariamente.

Busca responder:

> "¿Esto cumple lo que el cliente pidió?"

Por ejemplo:

- ✓ El usuario puede registrarse
- ✓ El cliente puede descargar un PDF
- ✓ El flujo cumple el requerimiento del negocio



**Muchas veces es manual.**

- Cliente
- Product Owner
- Usuario final


revisan la aplicación y dicen:

> "Sí, esto es lo que necesitábamos".

---


| Grupo                   | Tipo                      |
| ----------------------- | ------------------------- |
| Unidades pequeñas       | Unitarias, Componentes    |
| Procesos y colaboración | Integración, Sistema, E2E |
| Validación del negocio  | UAT                       |

---






















<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

**Resumen rápido**

| Tipo          | Qué prueba                       | Herramientas más usadas 2026      |
| ------------- | -------------------------------- | --------------------------------- |
| **Unitarias** | **Una función o método**         | **Vitest**, Jest, Mocha + Chai   |
| Componentes   | Un componente Vue aislado        | **Vue Test Utils + Vitest**       |
| Integración   | Varios módulos trabajando juntos | **Vitest + Vue Test Utils + MSW** |
| Sistema       | Aplicación completa              | Playwright, Cypress               |
| UAT           | Validación del cliente/usuario   | Manual, TestRail, Jira            |
| **E2E**       | **Flujo completo del usuario**   | **Playwright**, Cypress, Nightwatch           |

- Uso en **pruebas Unitarias**:
  - 1er lugar: **Vitest**
  - 2do lugar: **Jest**
  - 3er lugar: **Mocha + Chai**
  <br>
  
- en **pruebas E2E**:
  - 1er lugar: **Playwright**
  - 2do lugar: **Cypress**
  - 3er lugar: **Selenium**
  - 4to lugar: **Nightwatch**

```txt
         E2E
          ▲
          │
         UAT
          ▲
          │
    Integración
          ▲
          │
Unitarias / Componentes
```

<br>
<br>


### 1. Pruebas Unitarias (Unit Testing)

Prueban una única unidad de código.

Por ejemplo:

```js
function sumar(a, b) {
  return a + b
}
```

Test:

```js
expect(sumar(2, 3)).toBe(5)
```

✅ Muy rápidas

✅ Detectan errores temprano

❌ No validan el sistema completo

<br>




### 2. Pruebas de Componentes

Muy usadas en Vue, React y Angular.

Prueban un componente aislado.

Ejemplo:

```vue
<Counter />
```

Validar:

* que renderiza correctamente
* que un botón incrementa el contador
* que muestra los datos correctos

```js
wrapper
  .find('button')
  .trigger('click')

expect(wrapper.text())
  .toContain('1')
```

Muchos las consideran una variante de las pruebas unitarias.

<br>




### 3. Pruebas de Integración

Validan que varios módulos trabajen juntos.

Ejemplo:

```txt
Formulario
↓
Store Pinia
↓
API
```

Para comprobar que la comunicación entre ellos funciona.

No pruebas solo una función.

Pruebas la interacción.

<br>




### 4. Pruebas de Sistema (System Testing)

Prueban la aplicación completa.

Ejemplo:

```txt
Login
Dashboard
Perfil
Carrito
Pago
```

Todo el sistema funcionando junto.

Se realiza en un entorno parecido a producción.

<br>




### 5. UAT (User Acceptance Testing)

Significa: **User Acceptance Testing** o **Pruebas de Aceptación del Usuario**

Aquí prueba el cliente o usuario final.

Ejemplo:

> "Necesito que un usuario pueda registrarse y comprar un producto."

El cliente revisa si realmente el sistema cumple ese requerimiento.

La pregunta es:

👉 ¿Cumple el negocio lo que pidió?

No importa tanto el código.

Importa el resultado.

<br>




### 6. Pruebas End-to-End (E2E)

Simulan a un usuario real usando la aplicación.

Ejemplo con Cypress:

```txt
Abrir web
↓
Ingresar usuario
↓
Login
↓
Agregar producto
↓
Comprar
↓
Ver confirmación
```

Herramientas:

* Cypress
* Playwright
* Nightwatch
* Selenium







































---

## TDD

**Test Driven Development**
(Desarrollo Dirigido por Pruebas)

Es una metodología donde **primero escribes la prueba y después escribes el código**. 

Beneficios: 

- **Detecta errores antes**
En lugar de encontrar errores cuando el cliente usa la aplicación.
- **Facilita mantenimiento**
Puedes modificar código con confianza.
- **Facilita trabajo en equipo**
Si algo se rompe, los tests avisan.
- **Menos bugs en producción**
Más calidad del software.
<br>



### Proceso

```sh
Normalmente hacemos:      Con TDD, lo contrario:
1. Escribo código         1. Escribo la prueba
2. Lo pruebo              2. La prueba falla
3. Corrijo errores        3. Escribo el código
                          4. La prueba pasa
                          5. Refactorizo
```


Ejemplo quiero crear una función:

```js
sumar(2, 3)
```


```js
// Paso 1: escribo el test
test('suma correctamente', () => {
  expect(sumar(2, 3)).toBe(5)
})
```


```js
// Paso 2: ejecuto el test, falla porque aún no existe:
sumar()
```



```js
// Paso 3: creo el código mínimo
function sumar(a, b) {
  return a + b
}
```

```js
// Paso 4: vuelvo a ejecutar
✅ Test aprobado
```

**Ciclo TDD** Se suele resumir como:

1. RED 🔴 La prueba falla.
↓
2. GREEN 🟢 Escribes el mínimo código para que pase.
↓
3. REFACTOR 🔵 Mejoras el código sin romper el test.



<br>



Ejemplo en Vue

Supongamos que tienes un contador.

Primero escribes el test:

```js
it('incrementa el contador', async () => {
  const wrapper = mount(Counter)

  await wrapper
    .find('button')
    .trigger('click')

  expect(wrapper.text())
    .toContain('1')
})
```

Después creas el componente para que el test pase.

- **Ventajas**
  - Detecta errores temprano.
  - Obliga a pensar los requisitos antes de programar.
  - Facilita mantenimiento.
  - Reduce bugs en producción.
  - Da confianza para refactorizar.


















































































---

## Prueba Unitaria

<br>

### Configuracion


Instalar dependencias
`npm install -D vitest`

Si vas a probar componentes Vue:
`npm install -D vitest @vue/test-utils jsdom`

Opcionalmente,
para tener mejor integración con Vite:
`npm install -D vite-node`


















<br>
<br>

Agregar script en **package.json**

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "test": "vitest"
  }
}
```

o También:

```json
{
  "scripts": {
    "test": "vitest",
    "test:ui": "vitest --ui",
    "test:coverage": "vitest --coverage"
  }
}
```













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






