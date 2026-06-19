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




| Grupo                   | Tipo                      |
| ----------------------- | ------------------------- |
| Unidades pequeñas       | Unitarias, Componentes    |
| Procesos y colaboración | Integración, Sistema, E2E |
| Validación del negocio  | UAT                       |























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

<br>
<br>
<br>
<br>
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

* Cypress
* Playwright
* Nightwatch
* Selenium















<br>
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
<br><br>
<br><br>
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





