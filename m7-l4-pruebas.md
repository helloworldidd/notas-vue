# Pruebas

---

## Introducción

Existen varios **niveles de pruebas**,

desde las más pequeñas
hasta las más cercanas al usuario final.

- **Grupo 1: Pruebas de unidades pequeñas**
- **Grupo 2: Pruebas de flujo o integración**
- **Grupo 3: UAT**

---

## Grupos

<br>
<br>

### Grupo 1: Pruebas de unidades pequeñas

Aquí probarías piezas aisladas e independientes.

- **Test Unitarios**
  - Una función
  - Un método
  - Un getter de Pinia
  - Una utilidad

<br>

- **Test de Componentes**
  - Un componente Vue aislado
  - Sus props
  - Sus emits
  - Su renderizado

<br>
<br>

### Grupo 2: Pruebas de flujo o integración

Aquí ya importa cómo colaboran varias piezas.

<br>

- **Integración** (algunas piezas juntas)
  - Componente + Store
  - Store + API
  - Router + Vista

<br>

- **Sistema** (toda la aplicación)
  - La aplicación completa
  - Frontend + Backend
  - Base de datos

<br>

- **E2E** (toda la aplicación desde la mirada del usuario)
  - Simula al usuario real
  - Login → Dashboard → Comprar → Logout

<br>
<br>

### Grupo 3: UAT

User Acceptance Testing
(Pruebas de aceptación de usuario)

**no busca** _encontrar bugs técnicos necesariamente._

**Busca responder**: _"¿Esto cumple lo que el cliente pidió?"_

- **Por ejemplo:**
  - El usuario puede registrarse
  - El cliente puede descargar un PDF
  - El flujo cumple el requerimiento del negocio

- **Muchas veces es manual** y se trabaja con el:
  - Cliente
  - Product Owner
  - Usuario final

- Revisan la aplicación y dicen: _"Sí, esto es lo que necesitábamos"._

<br>
<br>
<br>
<br>
<br>
<br>

---

## Resumen Grupos de Pruebas

<br>
<br>

### Grupos

| Grupo                   | Tipo                      |
| ----------------------- | ------------------------- |
| Unidades pequeñas       | Unitarias, Componentes    |
| Procesos y colaboración | Integración, Sistema, E2E |
| Validación del negocio  | UAT                       |

```
Unitarias / Componentes
          │
          ▼
    Integración
          │
          ▼
         UAT
          │
          ▼
         E2E
```
<br>
<br>

### Uso

| Tipo          | Qué prueba                       | Herramientas más usadas             |
| ------------- | -------------------------------- | ----------------------------------- |
| **Unitarias** | **Una función o método**         | **Vitest**, Jest, Mocha + Chai      |
| Componentes   | Un componente Vue aislado        | **Vue Test Utils + Vitest**         |
| Integración   | Varios módulos trabajando juntos | **Vitest + Vue Test Utils + MSW**   |
| Sistema       | Aplicación completa              | Playwright, Cypress                 |
| **E2E**       | **Flujo completo del usuario**   | **Playwright**, Cypress, Nightwatch |
| UAT           | Validación del cliente/usuario   | Manual, TestRail, Jira              |

<br>
<br>

### Herramientas más usadas

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

<br>
<br>
<br>
<br>
<br>
<br>

---

## Ejemplos de Pruebas

<br>
<br>

### 1. Pruebas Unitarias (Unit Testing)

Prueban una única unidad de código.

Por ejemplo:

```js
function sumar(a, b) {
  return a + b;
}
```

Test:

```js
expect(sumar(2, 3)).toBe(5);
```

✅ Muy rápidas

✅ Detectan errores temprano

❌ No validan el sistema completo

<br>
<br>

### 2. Pruebas de Componentes

Muy usadas en Vue, React y Angular.

Prueban un componente aislado.

Ejemplo:

```vue
<Counter />
```

Validar:

- que renderiza correctamente
- que un botón incrementa el contador
- que muestra los datos correctos

```js
wrapper.find("button").trigger("click");

expect(wrapper.text()).toContain("1");
```

Muchos las consideran una variante de las pruebas unitarias.

<br>
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
<br>

### 5. Pruebas End-to-End (E2E)

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

- Cypress
- Playwright
- Nightwatch
- Selenium

<br>
<br>

### 6. UAT (User Acceptance Testing)

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
<br>
<br>
<br>
<br>
<br>


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


<br>
<br>

### Ejemplo

Quiero crear una función:

```js
sumar(2, 3);
```

```js
// Paso 1: escribo el test
test("suma correctamente", () => {
  expect(sumar(2, 3)).toBe(5);
});
```

```js
// Paso 2: ejecuto el test, falla porque aún no existe:
sumar();
```

```js
// Paso 3: creo el código mínimo
function sumar(a, b) {
  return a + b;
}
```

```js
// Paso 4: vuelvo a ejecutar
✅ Test aprobado
```



<br>
<br>


### Ciclo TDD

 Se suele resumir como:

1. RED 🔴 La prueba falla.
   ↓
2. GREEN 🟢 Escribes el mínimo código para que pase.
   ↓
3. REFACTOR 🔵 Mejoras el código sin romper el test.



<br>
<br>


### Ejemplo en Vue

Supongamos que tienes un contador.

Primero escribes el test:

```js
it("incrementa el contador", async () => {
  const wrapper = mount(Counter);

  await wrapper.find("button").trigger("click");

  expect(wrapper.text()).toContain("1");
});
```

Después creas el componente para que el test pase.

- **Ventajas**
  - Detecta errores temprano.
  - Obliga a pensar los requisitos antes de programar.
  - Facilita mantenimiento.
  - Reduce bugs en producción.
  - Da confianza para refactorizar.









<br>
<br>
<br>
<br>
<br>

---
## 🧪 Test Unitario

<br>
<br>

### 1. Objetivo

Verificar que la función `calcularTotal()` sume correctamente los precios de todos los productos entregados como parámetro.

<br>
<br>

### 2. Preparación e instalación

Instalar Vitest:

```bash
npm install -D vitest
```

Agregar el script de pruebas en `package.json`:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test": "vitest"
  }
}
```
<br>
<br>

### 3. Código

#### Estructura

```txt
src/
├── App.vue
└── utils/
    ├── calcularTotal.js
    └── calcularTotal.test.js
```

#### src/App.vue

```vue
<script setup>
import { ref, computed } from 'vue'
import { calcularTotal } from './utils/calcularTotal'

const productos = ref([
  { id: 1, nombre: 'Mouse', precio: 1000 },
  { id: 2, nombre: 'Teclado', precio: 2000 },
  { id: 3, nombre: 'Monitor', precio: 3000 }
])

const total = computed(() => {
  return calcularTotal(productos.value)
})
</script>

<template>
  <h1>Total: {{ total }}</h1>
</template>
```

#### src/utils/calcularTotal.js

```js
export function calcularTotal(productos) {
  return productos.reduce((total, producto) => {
    return total + producto.precio
  }, 0)
}
```

#### src/utils/calcularTotal.test.js

```js
import { describe, it, expect } from 'vitest'
import { calcularTotal } from './calcularTotal'

describe('calcularTotal', () => {

  it('debe sumar correctamente los precios', () => {

    const productos = [
      { id: 1, precio: 1000 },
      { id: 2, precio: 2000 },
      { id: 3, precio: 3000 }
    ]

    const resultado = calcularTotal(productos)

    expect(resultado).toBe(6000)

  })

})
```

<br>
<br>

### 4. Ejecución del test

Ejecutar cualquiera de los siguientes comandos:

```bash
npm run test
```

o

```bash
npx vitest
```

<br>
<br>

### 5. Resultado esperado

```txt
✓ debe sumar correctamente los precios

Test Files 1 passed
Tests 1 passed
```

La prueba debe finalizar sin errores y validar que la función retorna el valor esperado.









<br>
<br>
<br>
<br>
<br>
<br>




---

## 🧪 Test Componente


<br>
<br>

### 1. Objetivo

Verificar que el componente `ProductCard.vue` muestre correctamente la información de un producto recibido por `props`.

<br>
<br>

### 2. Preparación e instalación

Instalar Vitest, Vue Test Utils y jsdom:

```bash
npm install -D vitest @vue/test-utils jsdom
```

Agregar el script de pruebas en `package.json`:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test": "vitest"
  }
}
```

Crear o revisar el archivo `vite.config.js`:

```js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  test: {
    environment: 'jsdom'
  }
})
```

<br>
<br>

### 3. Código

#### Estructura

```txt
src/
├── App.vue
└── components/
    ├── ProductCard.vue
    └── ProductCard.test.js
```

#### src/App.vue

```vue
<script setup>
import ProductCard from './components/ProductCard.vue'

const producto = {
  id: 1,
  nombre: 'Mouse',
  precio: 1000
}
</script>

<template>
  <ProductCard :producto="producto" />
</template>
```

#### src/components/ProductCard.vue

```vue
<script setup>
defineProps({
  producto: {
    type: Object,
    required: true
  }
})
</script>

<template>
  <div class="card">
    <h2>{{ producto.nombre }}</h2>
    <p>Precio: {{ producto.precio }}</p>
  </div>
</template>
```

#### src/components/ProductCard.test.js

```js
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import ProductCard from './ProductCard.vue'

describe('ProductCard', () => {

  it('debe mostrar el nombre del producto', () => {

    const productoMock = {
      id: 1,
      nombre: 'Mouse',
      precio: 1000
    }

    const wrapper = mount(ProductCard, {
      props: {
        producto: productoMock
      }
    })

    expect(wrapper.text()).toContain('Mouse')

  })

  it('debe mostrar el precio del producto', () => {

    const productoMock = {
      id: 1,
      nombre: 'Mouse',
      precio: 1000
    }

    const wrapper = mount(ProductCard, {
      props: {
        producto: productoMock
      }
    })

    expect(wrapper.text()).toContain('1000')

  })

})
```

<br>
<br>

### 4. Ejecución del test

Ejecutar cualquiera de los siguientes comandos:

```bash
npm run test
```

o

```bash
npx vitest
```

<br>
<br>

### 5. Resultado esperado

```txt
✓ debe mostrar el nombre del producto
✓ debe mostrar el precio del producto

Test Files 1 passed
Tests 2 passed
```

La prueba debe finalizar sin errores y validar que el componente renderiza correctamente los datos recibidos por `props`.




















<br>
<br>
<br>
<br>
<br>

---

## 🧪 Test de Integración

<br>
<br>

### 1. Objetivo

Verificar que el componente `ProductList.vue` interactúe correctamente con el store de Pinia, agregando productos al carrito y actualizando el total mostrado en pantalla.

<br>
<br>

### 2. Preparación e instalación

Instalar Vitest, Vue Test Utils y Pinia:

```bash
npm install -D vitest @vue/test-utils jsdom
npm install pinia
```

Agregar el script de pruebas en `package.json`:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test": "vitest"
  }
}
```

<br>
<br>

### 3. Código

#### Estructura

```txt
src/
├── components/
│   ├── ProductList.vue
│   └── ProductList.test.js
│
└── stores/
    └── cartStore.js
```

---

#### src/stores/cartStore.js

```js
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useCartStore = defineStore('cart', () => {

  const carrito = ref([])

  const total = computed(() => {
    return carrito.value.reduce((acc, item) => {
      return acc + item.price
    }, 0)
  })

  function addToCart(product) {
    carrito.value.push(product)
  }

  return {
    carrito,
    total,
    addToCart
  }

})
```

---

#### src/components/ProductList.vue

```vue
<script setup>
import { useCartStore } from '@/stores/cartStore'

const cartStore = useCartStore()

const products = [
  {
    id: 1,
    name: 'Mouse',
    price: 1000
  },
  {
    id: 2,
    name: 'Teclado',
    price: 2000
  }
]
</script>

<template>
  <div>

    <div
      v-for="product in products"
      :key="product.id"
    >
      <h3>{{ product.name }}</h3>

      <p>
        {{ product.price }}
      </p>

      <button
        @click="cartStore.addToCart(product)"
      >
        Agregar
      </button>

    </div>

    <h2>
      Total: {{ cartStore.total }}
    </h2>

  </div>
</template>
```

---

#### src/components/ProductList.test.js

```js
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'

import ProductList from './ProductList.vue'
import { useCartStore } from '@/stores/cartStore'

describe('ProductList', () => {

  it('debe agregar un producto al carrito', async () => {

    const pinia = createPinia()

    setActivePinia(pinia)

    const wrapper = mount(ProductList, {
      global: {
        plugins: [pinia]
      }
    })

    const cartStore = useCartStore()

    const buttons = wrapper.findAll('button')

    await buttons[0].trigger('click')

    expect(cartStore.carrito.length).toBe(1)

  })

  it('debe actualizar el total al agregar un producto', async () => {

    const pinia = createPinia()

    setActivePinia(pinia)

    const wrapper = mount(ProductList, {
      global: {
        plugins: [pinia]
      }
    })

    const buttons = wrapper.findAll('button')

    await buttons[0].trigger('click')

    expect(wrapper.text()).toContain('Total: 1000')

  })

})
```

<br>
<br>

### 4. Ejecución del test

Ejecutar cualquiera de los siguientes comandos:

```bash
npm run test
```

o

```bash
npx vitest
```

<br>
<br>

### 5. Resultado esperado

```txt
✓ debe agregar un producto al carrito
✓ debe actualizar el total al agregar un producto

Test Files 1 passed
Tests 2 passed
```

La prueba debe finalizar sin errores y validar correctamente la integración entre el componente Vue y el store de Pinia. En este caso se comprueba que la interacción del usuario modifica el estado global y que dicho cambio se refleja en la interfaz.



































<br>
<br>
<br>
<br>
<br>

---
## 🧪 Test de Sistema

<br>
<br>

### 1. Objetivo

Verificar que la aplicación completa funcione correctamente desde la vista del usuario.

El sistema debe permitir:

1. Cargar la página principal.
2. Mostrar el contador inicial.
3. Hacer clic en un botón.
4. Actualizar el valor del contador en pantalla.

<br>
<br>

### 2. Preparación e instalación

Instalar Cypress:

```bash
npm install -D cypress
```

Agregar el script en `package.json`:

```json
{
  "scripts": {
    "dev": "vite",
    "test:e2e": "cypress open"
  }
}
```

<br>
<br>

### 3. Código

#### Estructura

```txt
src/
├── App.vue
└── main.js

cypress/
└── e2e/
    └── sistema.cy.js
```

#### src/App.vue

```vue
<script setup>
import { ref } from 'vue'

const contador = ref(0)

function aumentar() {
  contador.value++
}
</script>

<template>
  <main>
    <h1>Test de sistema Vue</h1>

    <p data-cy="contador">
      Contador: {{ contador }}
    </p>

    <button
      data-cy="btn-aumentar"
      @click="aumentar"
    >
      Aumentar
    </button>
  </main>
</template>
```

#### cypress/e2e/sistema.cy.js

```js
describe('Test de sistema - contador', () => {

  it('debe permitir aumentar el contador desde la interfaz', () => {

    cy.visit('http://localhost:5173')

    cy.get('[data-cy="contador"]')
      .should('contain', 'Contador: 0')

    cy.get('[data-cy="btn-aumentar"]')
      .click()

    cy.get('[data-cy="contador"]')
      .should('contain', 'Contador: 1')

  })

})
```

<br>
<br>

### 4. Ejecución del test

Primero levantar el proyecto:

```bash
npm run dev
```

Luego ejecutar Cypress:

```bash
npm run test:e2e
```

O también:

```bash
npx cypress open
```

<br>
<br>

### 5. Resultado esperado

```txt
✓ debe permitir aumentar el contador desde la interfaz

1 passing
```

La prueba debe finalizar sin errores y validar que el sistema completo responde correctamente a la interacción del usuario.


























<br>
<br>
<br>
<br>
<br>

---
## 🧪 Test E2E

<br>
<br>

### 1. Objetivo

Verificar que el usuario pueda realizar un flujo completo dentro de una aplicación Vue.

El test debe comprobar que el usuario pueda:

1. Entrar a la aplicación.
2. Ver el listado inicial de productos.
3. Agregar un producto al carrito.
4. Verificar que el carrito se actualiza.
5. Ir al carrito.
6. Verificar el total de la compra.

<br>
<br>

### 2. Preparación e instalación

Instalar Cypress:

```bash
npm install -D cypress
```

Agregar el script de pruebas en `package.json`:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test:e2e": "cypress open"
  }
}
```

<br>
<br>

### 3. Código

#### Estructura

```txt
src/
├── App.vue
└── main.js

cypress/
└── e2e/
    └── compra.cy.js
```

#### src/App.vue

```vue
<script setup>
import { ref, computed } from 'vue'

const vistaActual = ref('productos')

const productos = ref([
  { id: 1, nombre: 'Mouse', precio: 1000 },
  { id: 2, nombre: 'Teclado', precio: 2000 },
  { id: 3, nombre: 'Monitor', precio: 3000 }
])

const carrito = ref([])

const totalCarrito = computed(() => {
  return carrito.value.reduce((total, producto) => {
    return total + producto.precio
  }, 0)
})

function agregarAlCarrito(producto) {
  carrito.value.push(producto)
}

function irAlCarrito() {
  vistaActual.value = 'carrito'
}

function irAProductos() {
  vistaActual.value = 'productos'
}
</script>

<template>
  <main>
    <h1>Tienda Vue</h1>

    <nav>
      <button data-cy="link-productos" @click="irAProductos">
        Productos
      </button>

      <button data-cy="link-carrito" @click="irAlCarrito">
        Carrito
      </button>
    </nav>

    <section v-if="vistaActual === 'productos'">
      <h2>Productos</h2>

      <article
        v-for="producto in productos"
        :key="producto.id"
        data-cy="producto"
      >
        <h3>{{ producto.nombre }}</h3>
        <p>Precio: {{ producto.precio }}</p>

        <button
          :data-cy="`agregar-${producto.id}`"
          @click="agregarAlCarrito(producto)"
        >
          Agregar al carrito
        </button>
      </article>
    </section>

    <section v-if="vistaActual === 'carrito'">
      <h2>Carrito</h2>

      <p data-cy="cantidad-carrito">
        Productos en carrito: {{ carrito.length }}
      </p>

      <ul>
        <li
          v-for="producto in carrito"
          :key="producto.id"
          data-cy="producto-carrito"
        >
          {{ producto.nombre }} - {{ producto.precio }}
        </li>
      </ul>

      <h3 data-cy="total-carrito">
        Total: {{ totalCarrito }}
      </h3>
    </section>
  </main>
</template>
```

#### cypress/e2e/compra.cy.js

```js
describe('Test E2E - flujo de compra', () => {

  it('debe permitir agregar productos al carrito y ver el total', () => {

    cy.visit('http://localhost:5173')

    cy.contains('Tienda Vue')
      .should('be.visible')

    cy.contains('Productos')
      .should('be.visible')

    cy.get('[data-cy="producto"]')
      .should('have.length', 3)

    cy.get('[data-cy="agregar-1"]')
      .click()

    cy.get('[data-cy="agregar-2"]')
      .click()

    cy.get('[data-cy="link-carrito"]')
      .click()

    cy.contains('Carrito')
      .should('be.visible')

    cy.get('[data-cy="cantidad-carrito"]')
      .should('contain', 'Productos en carrito: 2')

    cy.get('[data-cy="producto-carrito"]')
      .should('have.length', 2)

    cy.get('[data-cy="producto-carrito"]')
      .should('contain', 'Mouse')

    cy.get('[data-cy="producto-carrito"]')
      .should('contain', 'Teclado')

    cy.get('[data-cy="total-carrito"]')
      .should('contain', 'Total: 3000')

  })

})
```

<br>
<br>

### 4. Ejecución del test

Primero levantar el proyecto Vue:

```bash
npm run dev
```

Luego ejecutar Cypress:

```bash
npm run test:e2e
```

También se puede ejecutar con:

```bash
npx cypress open
```

<br>
<br>

### 5. Resultado esperado

```txt
✓ debe permitir agregar productos al carrito y ver el total

1 passing
```

La prueba debe finalizar sin errores y validar un flujo completo de usuario: entrar a la aplicación, revisar productos, agregar productos al carrito, navegar al carrito y comprobar el total de la compra.



































<br>
<br>
<br>
<br>
<br>

---

## 🧪 Test UAT



<br>
<br>

### 1. Nombre del test

Test UAT - Visualización de lista de productos




<br>
<br>

### 2. Objetivo

Validar que la página de productos cumple con lo esperado por el usuario final, mostrando correctamente una lista de productos con su información principal.




<br>
<br>

### 3. Tipo de prueba

UAT - User Acceptance Testing.

Esta prueba valida si la funcionalidad cumple con los criterios de aceptación definidos desde el punto de vista del usuario.




<br>
<br>

### 4. Herramientas necesarias

* Navegador web
* Aplicación Vue.js funcionando
* API o json-server activo
* Planilla Excel o Google Sheets para registrar resultados




<br>
<br>

### 5. Preparación / instalación

Levantar la aplicación Vue:

```bash
npm run dev
```

Levantar la API local:

```bash
npx json-server db.json
```

Verificar que existan productos en la API:

```json
{
  "products": [
    {
      "id": 1,
      "name": "Mouse Gamer",
      "price": 15000,
      "category": "Tecnología"
    }
  ]
}
```




<br>
<br>

### 6. Planificación del caso

#### Caso UAT-001

| Campo             | Descripción                             |
| ----------------- | --------------------------------------- |
| Módulo            | Productos                               |
| Funcionalidad     | Listar productos                        |
| Actor             | Usuario visitante o administrador       |
| Prioridad         | Alta                                    |
| Condición inicial | La app y la API deben estar funcionando |




<br>
<br>

### 7. Criterio de aceptación

```txt
Dado que el usuario entra a la vista de productos,
cuando la aplicación carga la información desde la API,
entonces debe mostrarse una lista de productos con nombre, precio y categoría.
```




<br>
<br>

### 8. Ejecución del test

### Pasos

1. Abrir la aplicación en el navegador.
2. Entrar a la vista **Productos**.
3. Esperar la carga de datos.
4. Revisar que se muestre una lista de productos.
5. Confirmar que cada producto muestre:

   * Nombre
   * Precio
   * Categoría




<br>
<br>

### 9. Resultado esperado

La página debe mostrar los productos correctamente.

Ejemplo:

```txt
Mouse Gamer
Precio: $15000
Categoría: Tecnología
```

Además:

* La pantalla no debe quedar en blanco.
* No debe aparecer un error visual.
* No debe aparecer un error en consola.
* La información debe ser clara y legible.


<br>
<br>

### 10. Registro en planilla

| ID      | Módulo    | Caso de prueba                | Resultado esperado                                | Estado | Observaciones |
| ------- | --------- | ----------------------------- | ------------------------------------------------- | ------ | ------------- |
| UAT-001 | Productos | La página carga correctamente | Se muestra el título y la estructura de la página | ⬜      |               |
| UAT-002 | Productos | Se muestran productos         | Aparece al menos un producto en pantalla          | ⬜      |               |
| UAT-003 | Productos | Nombre del producto           | Cada producto muestra nombre                      | ⬜      |               |
| UAT-004 | Productos | Precio del producto           | Cada producto muestra precio                      | ⬜      |               |
| UAT-005 | Productos | Categoría del producto        | Cada producto muestra categoría                   | ⬜      |               |
| UAT-006 | Productos | Diseño visual                 | No existen elementos superpuestos o rotos         | ⬜      |               |
| UAT-007 | Productos | Carga de datos                | No aparecen errores de carga                      | ⬜      |               |
| UAT-008 | Productos | Consola del navegador         | No existen errores JavaScript                     | ⬜      |               |

<br>
<br>

### 11. Evidencia

Adjuntar evidencia de ejecución:

* Captura de pantalla de la vista de productos.
* Captura de la lista renderizada.
* Captura de consola sin errores (opcional).
* Video corto de validación (opcional).

<br>
<br>

### 12. Resumen de ejecución

| Métrica             | Resultado |
| ------------------- | --------- |
| Casos ejecutados    | 8         |
| Casos aprobados     |           |
| Casos rechazados    |           |
| Casos bloqueados    |           |
| Porcentaje de éxito |           |

<br>
<br>

### 13. Estado final

| Campo              | Resultado                |
| ------------------ | ------------------------ |
| Fecha de ejecución |                          |
| Responsable        |                          |
| Versión evaluada   |                          |
| Resultado global   | ⬜ Aprobado / ⬜ Rechazado |

<br>
<br>

### 14. Conclusión

El objetivo de este UAT fue validar que la funcionalidad de listado de productos cumple con los requerimientos definidos para el usuario final.

La aprobación del caso dependerá de que todos los criterios establecidos en la planilla hayan sido validados satisfactoriamente y sin errores críticos.


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
<br>
<br>

---

## Objetos de prueba (Test Doubles)

Cuando realizamos pruebas unitarias,
muchas veces necesitamos reemplazar partes de la aplicación
para aislar la funcionalidad que queremos probar.

Estos reemplazos reciben el nombre general de **Test Doubles**.


| Tipo | ¿Qué hace? |
|--------|--------|
| Dummy | Solo rellena parámetros |
| Fake | Implementación simplificada |
| Mock Data | Datos falsos |
| Stub | Devuelve respuestas predefinidas |
| Spy | Observa llamadas |
| Mock | Simula y además verifica comportamiento |


<br>
<br>

### Dummy

Es un objeto que existe únicamente para completar un parámetro requerido.

No participa realmente en la prueba.

Ejemplo:

```js
crearUsuario(usuario, logger)
```

Si no queremos probar `logger`:

```js
const dummyLogger = {}
```

<br>
<br>

### Fake

Es una implementación simplificada de algo real.

Ejemplo:

```js
const fakeDatabase = {
  usuarios: []
}
```

Simula una base de datos pero funciona solo en memoria.

<br>
<br>

### Mock Data

Son datos ficticios utilizados para probar una función o componente.

Ejemplo:

```js
const productos = [
  { id: 1, precio: 1000 },
  { id: 2, precio: 2000 }
]
```

<br>
<br>

### Stub

Reemplaza una función devolviendo una respuesta conocida.

Ejemplo:

```js
axios.get = () => {
  return Promise.resolve({
    data: []
  })
}
```

No importa qué ocurra realmente, siempre devuelve el mismo resultado.

<br>
<br>

### Spy

Permite observar si una función fue llamada.

Ejemplo:

```js
const spy = vi.spyOn(console, 'log')
```

Luego podemos verificar:

```js
expect(spy).toHaveBeenCalled()
```

<br>
<br>

### Mock

Es una simulación completa de una función u objeto.

Permite:

- controlar respuestas
- registrar llamadas
- verificar parámetros

Ejemplo:

```js
const login = vi.fn()
```

<br>
<br>
<br>
<br>
<br>
<br>
























---

## 🧪 Test Unitario usando Test Doubles

<br>
<br>

### 1. Objetivo

Verificar que la función `registrarUsuario()` registre correctamente un usuario y utilice distintos **Test Doubles** para reemplazar dependencias externas.

La función debe:

1. Recibir un usuario.
2. Guardarlo en una base de datos.
3. Registrar un mensaje en consola o logger.
4. Enviar un correo de bienvenida.
5. Ejecutar una función al finalizar.

<br>
<br>

### 2. Preparación e instalación

Instalar Vitest:

```bash
npm install -D vitest
```

Agregar el script de pruebas en `package.json`:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test": "vitest"
  }
}
```

<br>
<br>

### 3. Código

#### Estructura

```txt
src/
├── App.vue
└── utils/
    ├── registrarUsuario.js
    └── registrarUsuario.test.js
```


#### src/App.vue

```vue
<script setup>
import { ref } from 'vue'
import { registrarUsuario } from './utils/registrarUsuario'

const mensaje = ref('')

function crearCuenta() {
  const usuario = {
    id: 1,
    nombre: 'Patricio',
    email: 'patricio@mail.com'
  }

  const database = {
    guardar(usuario) {
      console.log('Usuario guardado:', usuario)
    }
  }

  const logger = {
    info(mensaje) {
      console.log(mensaje)
    }
  }

  const emailService = {
    enviar(email) {
      console.log('Correo enviado a:', email)
    }
  }

  const finalizar = () => {
    mensaje.value = 'Registro finalizado'
  }

  const config = {}

  registrarUsuario(
    usuario,
    database,
    logger,
    emailService,
    finalizar,
    config
  )
}
</script>

<template>
  <button @click="crearCuenta">
    Crear cuenta
  </button>

  <p>{{ mensaje }}</p>
</template>
```

#### src/utils/registrarUsuario.js

```js
export function registrarUsuario(
  usuario,
  database,
  logger,
  emailService,
  finalizar,
  config
) {
  database.guardar(usuario)

  logger.info('Usuario registrado')

  emailService.enviar(usuario.email)

  finalizar()

  return {
    ok: true,
    usuario
  }
}
```

#### src/utils/registrarUsuario.test.js

```js
import { describe, it, expect, vi } from 'vitest'
import { registrarUsuario } from './registrarUsuario'

describe('registrarUsuario', () => {

  it('debe registrar un usuario correctamente usando Test Doubles', () => {

    // Mock Data
    const usuarioMock = {
      id: 1,
      nombre: 'Patricio',
      email: 'patricio@mail.com'
    }

    // Fake
    const fakeDatabase = {
      usuarios: [],
      guardar(usuario) {
        this.usuarios.push(usuario)
      }
    }

    // Stub
    const loggerStub = {
      info: vi.fn(() => 'mensaje registrado')
    }

    // Mock
    const emailServiceMock = {
      enviar: vi.fn()
    }

    // Mock
    const finalizarMock = vi.fn()

    // Dummy
    const dummyConfig = {}

    // Spy
    const spyGuardar = vi.spyOn(
      fakeDatabase,
      'guardar'
    )

    const resultado = registrarUsuario(
      usuarioMock,
      fakeDatabase,
      loggerStub,
      emailServiceMock,
      finalizarMock,
      dummyConfig
    )

    expect(resultado.ok).toBe(true)

    expect(resultado.usuario).toBe(usuarioMock)

    expect(fakeDatabase.usuarios)
      .toContain(usuarioMock)

    expect(spyGuardar)
      .toHaveBeenCalledWith(usuarioMock)

    expect(loggerStub.info)
      .toHaveBeenCalledWith('Usuario registrado')

    expect(emailServiceMock.enviar)
      .toHaveBeenCalledWith('patricio@mail.com')

    expect(finalizarMock)
      .toHaveBeenCalled()

  })

})
```

<br>
<br>

### 4. Ejecución del test

Ejecutar cualquiera de los siguientes comandos:

```bash
npm run test
```

o

```bash
npx vitest
```

<br>
<br>

### 5. Resultado esperado

```txt
✓ debe registrar un usuario correctamente usando Test Doubles

Test Files 1 passed
Tests 1 passed
```

La prueba debe finalizar sin errores y validar que la función guarda el usuario, registra el mensaje, envía el correo y ejecuta la función final.

<br>
<br>


### 6. ¿Dónde aparece cada Test Double?

| Tipo      | Ejemplo usado      | Qué hace                              |
| --------- | ------------------ | ------------------------------------- |
| Mock Data | `usuarioMock`      | Datos falsos para probar              |
| Fake      | `fakeDatabase`     | Base de datos simplificada en memoria |
| Dummy     | `dummyConfig`      | Rellena un parámetro requerido        |
| Stub      | `loggerStub`       | Devuelve una respuesta predefinida    |
| Spy       | `spyGuardar`       | Observa si `guardar()` fue llamada    |
| Mock      | `emailServiceMock` | Simula y verifica el envío de correo  |
| Mock      | `finalizarMock`    | Simula y verifica una función final   |

<br>
<br>

---

★★★