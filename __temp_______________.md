# cypress



Ejemplo E2E simple con Cypress: un botón que aumenta un contador.




src/App.vue
```vue
<script setup>
import { ref } from 'vue'

const count = ref(0)

function increment() {
  count.value++
}
</script>

<template>
  <main>
    <h1>Test E2E con Cypress</h1>

    <p data-cy="counter">
      Contador: {{ count }}
    </p>

    <button data-cy="increment-button" @click="increment">
      Aumentar
    </button>
  </main>
</template>

```




cypress/e2e/counter.cy.js
```js
describe('Contador', () => {
  it('aumenta el contador al hacer click en el botón', () => {
    cy.visit('/')

    cy.get('[data-cy="counter"]')
      .should('contain', 'Contador: 0')

    cy.get('[data-cy="increment-button"]')
      .click()

    cy.get('[data-cy="counter"]')
      .should('contain', 'Contador: 1')
  })
})
```

Para correrlo
```
npm run dev
```

Y en otra terminal:


```
npx cypress open
```

O directo en terminal:

```
npx cypress run
```



instala así:


```
npm install cypress --save-dev
```

o su versión corta:

```
npm i -D cypress
```

Luego lo ejecutas por primera vez:

```
npx cypress open
```



Eso creará la carpeta:

```
cypress/
├── e2e/
├── fixtures/
├── support/

Si usaste Vite + Vue, también puedes agregar estos scripts al package.json:

{
  "scripts": {
    "dev": "vite",
    "cypress": "cypress open",
    "test:e2e": "cypress run"
  }
}
```



Después:

```
npm run cypress
```

o

```
npm run test:e2e
Flujo típico

```
Terminal 1:

npm run dev

Terminal 2:

npx cypress open

Seleccionas:

E2E Testing
Chrome
counter.cy.js

y Cypress abrirá el navegador, hará click en el botón y verificará que el contador cambie de 0 a 1.

al hacer esto me sale un mensaje npx cypress open 

Está todo bien. Cypress está recién instalado y te está preguntando qué tipo de pruebas quieres configurar.

En tu captura aparece:

E2E Testing      Not Configured
Component Testing Not Configured

Haz clic en:

E2E Testing

Luego Cypress te irá guiando:

✓ Crear cypress.config.js
✓ Crear carpeta cypress/
✓ Crear carpeta cypress/e2e/
✓ Elegir navegador

Cuando termine deberías ver algo parecido a:

cypress/
├─ e2e/
├─ fixtures/
├─ support/

cypress.config.js

Después crea manualmente:

cypress/e2e/counter.cy.js

Con este contenido:

describe('Contador', () => {
  it('incrementa el contador', () => {
    cy.visit('http://localhost:5173')

    cy.get('[data-cy="counter"]')
      .should('contain', '0')

    cy.get('[data-cy="increment-button"]')
      .click()

    cy.get('[data-cy="counter"]')
      .should('contain', '1')
  })
})

Y asegúrate de tener corriendo Vue:

npm run dev

Si al hacer clic en E2E Testing te aparece otro mensaje o error, mándame una captura de la siguiente pantalla y te digo exactamente qué opción elegir.

Perfecto 👍. Esa pantalla significa que Cypress ya creó toda la configuración necesaria.

Ahora simplemente haz clic en:

Continue

Después te debería mostrar una pantalla para elegir navegador, por ejemplo:

Chrome
Edge
Electron

Elige Chrome o Edge y presiona:

Start E2E Testing

Luego aparecerá algo parecido a:

Create new spec

o

Scaffold example specs

Ahí puedes:

Opción A (recomendada para aprender)

Crear tu propio archivo:

cypress/
└─ e2e/
   └─ counter.cy.js

Con el código:

describe('Contador', () => {
  it('incrementa el contador', () => {
    cy.visit('http://localhost:5173')

    cy.get('[data-cy="counter"]')
      .should('contain', '0')

    cy.get('[data-cy="increment-button"]')
      .click()

    cy.get('[data-cy="counter"]')
      .should('contain', '1')
  })
})
Antes de ejecutarlo

Debes tener tu Vue corriendo:

npm run dev

y ver algo así:

Local: http://localhost:5173/

Cuando llegues a la siguiente pantalla (la del navegador o la de los specs), mándame otra captura y seguimos paso a paso. Estamos a un clic de correr el primer test E2E 😄.

Perfecto. Ahora haz clic en el botón verde:

Start E2E Testing in Chrome

Después Cypress abrirá una pantalla parecida a esta:

Specs
└─ Create new spec

o

Create your first spec

Ahí ya estamos listos para crear el archivo de prueba.

Mientras tanto, deja corriendo Vue:

npm run dev

Y crea este archivo:

cypress/e2e/counter.cy.js
describe('Contador', () => {
  it('incrementa el contador', () => {
    cy.visit('http://localhost:5173')

    cy.get('[data-cy="counter"]')
      .should('contain', '0')

    cy.get('[data-cy="increment-button"]')
      .click()

    cy.get('[data-cy="counter"]')
      .should('contain', '1')
  })
})

Y tu App.vue:

<script setup>
import { ref } from 'vue'

const count = ref(0)

function increment() {
  count.value++
}
</script>

<template>
  <h1>Test Cypress</h1>

  <p data-cy="counter">
    {{ count }}
  </p>

  <button
    data-cy="increment-button"
    @click="increment"
  >
    Incrementar
  </button>
</template>

Cuando aparezca la siguiente pantalla de Cypress (la lista de tests/specs), mándame una captura y te indico exactamente dónde hacer clic para ejecutar el primer E2E. 🚀

Excelente. Ya llegaste al punto correcto 🚀

Ahora tienes dos opciones:

Opción 1 (recomendada para aprender)

Haz clic en:

Create new spec

Cypress te preguntará un nombre. Pon algo como:

counter.cy.js

o

app.cy.js

Luego te creará el archivo dentro de:

cypress/
└── e2e/
    └── counter.cy.js

Y reemplazas el contenido por:

describe('Contador', () => {
  it('incrementa el contador', () => {
    cy.visit('http://localhost:5173')

    cy.get('[data-cy="counter"]')
      .should('contain', '0')

    cy.get('[data-cy="increment-button"]')
      .click()

    cy.get('[data-cy="counter"]')
      .should('contain', '1')
  })
})
Opción 2

Haz clic en:

Scaffold example specs

Cypress te generará ejemplos listos para ver cómo funciona.

Verifica también que exista App.vue
<script setup>
import { ref } from 'vue'

const count = ref(0)

function increment() {
  count.value++
}
</script>

<template>
  <h1>Test Cypress</h1>

  <p data-cy="counter">
    {{ count }}
  </p>

  <button
    data-cy="increment-button"
    @click="increment"
  >
    Incrementar
  </button>
</template>

Y que en otra terminal esté ejecutándose:

npm run dev

Si haces clic en Create new spec, la siguiente pantalla te mostrará el nombre del archivo que quiere crear. Mándame esa captura y seguimos hasta ejecutarlo.