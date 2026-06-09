## Pruebas

--- 

## Indíce

- []()



--- 

## 



Características de las pruebas unitarias
El Desarrollo Dirigido por Test (TDD), en qué consiste y qué importancia tiene
Setup de herramientas con vue-cli
El entorno de pruebas Vue Test Utils para Vue
Herramientas para el testing unitario, ventajas y
limitaciones de cada uno Jest, Mocha + Chai
Utilización de objetos simulados (mocks y stubs) En qué consisten y por qué utilizarlos
Pruebas end-to-end


 .- Pruebas end-to-end
.- Características de las pruebas end to end, ventajas y
    limitaciones, diferencia con pruebas unitarias
.- Setup de herramientas con vue-cli
.- Herramientas para el testing end to end, ventajas y
    limitaciones de cada uno
.- Cypress
.- Nightwatch








Patricio, este tema suele ser uno de los más confusos porque mezclan varios tipos de testing. La forma fácil de entenderlo es:

```text
Pruebas Unitarias
↓
prueban una función o componente

Pruebas Integración
↓
prueban varios componentes juntos

Pruebas End To End (E2E)
↓
prueban toda la aplicación
```

---

# ¿Por qué existen los tests?

Porque los desarrolladores rompen cosas 😆

Ejemplo:

```js
const sumar = (a, b) => a + b;
```

Hoy funciona.

Mañana alguien cambia:

```js
const sumar = (a, b) => a - b;
```

y rompe la aplicación.

Los tests detectan eso automáticamente.

---

# Pruebas Unitarias

Una prueba unitaria verifica una unidad de código.

Normalmente:

```text
Una función
Un método
Un componente
```

---

## Ejemplo

Función:

```js
const sumar = (a, b) => a + b;
```

Test:

```js
expect(
  sumar(2, 3)
).toBe(5);
```

---

## Características

```text
Pequeñas
Rápidas
Automáticas
Aisladas
```

---

# Desarrollo Dirigido por Test (TDD)

Significa:

```text
Test Driven Development
```

---

## Flujo tradicional

```text
Código
↓
Test
```

---

## Flujo TDD

```text
Test
↓
Código
```

Primero escribes:

```js
expect(
  sumar(2, 3)
).toBe(5);
```

Luego haces que funcione.

---

## Ciclo TDD

```text
RED
↓
GREEN
↓
REFACTOR
```

---

### RED

El test falla.

```text
❌
```

---

### GREEN

Escribes código mínimo.

```text
✅
```

---

### REFACTOR

Mejoras el código.

```text
♻️
```

sin romper tests.

---

# Vue Test Utils

Es la librería oficial para probar componentes Vue.

Permite:

```text
Montar componentes
Simular clicks
Leer HTML
Verificar props
```

---

## Instalación moderna

```bash
npm i -D @vue/test-utils
```

---

## Ejemplo

Componente:

```vue
<button>
  Guardar
</button>
```

Test:

```js
import { mount }
from '@vue/test-utils';

const wrapper = mount(
  MiBoton
);

expect(
  wrapper.text()
).toContain('Guardar');
```

---

# Jest

Durante años fue el rey.

Creado por:

Meta Platforms

---

## Ventajas

```text
Muy maduro
Muchísima documentación
Muchos ejemplos
```

---

## Desventajas

```text
Más lento
Configuración pesada
```

---

# Mocha + Chai

Antes muy usado.

---

Mocha:

```text
Runner
```

Ejecuta tests.

---

Chai:

```text
Assertions
```

Hace comparaciones.

---

Ejemplo:

```js
expect(valor)
  .to.equal(5);
```

---

## Ventajas

```text
Flexible
Simple
```

---

## Desventajas

```text
Configuras más cosas
Menos integrado
```

---

# ¿Qué se usa hoy?

En 2026 normalmente:

```text
Vitest ⭐⭐⭐⭐⭐
Jest ⭐⭐⭐
Mocha ⭐⭐
```

Si el curso habla de Jest y Mocha es porque el material es más antiguo.

Actualmente Vue suele usar:

```bash
npm i -D vitest
```

---

# Mocks

Mock = objeto falso.

---

Ejemplo:

La API real:

```text
Banco
```

---

Mock:

```js
const api = {
  obtenerSaldo: () => 100000
};
```

---

Así pruebas sin llamar al banco real.

---

# Stubs

Stub = reemplazo controlado.

Ejemplo:

```js
vi.fn()
```

o

```js
jest.fn()
```

---

Simulas:

```js
api.login()
```

sin hacer login real.

---

## ¿Por qué usarlos?

```text
Más rápido
Más seguro
No dependes de internet
No gastas APIs
```

---

# Pruebas End To End (E2E)

Simulan un usuario real.

---

Prueba unitaria:

```text
Botón
```

---

Prueba E2E:

```text
Abrir página
↓
Escribir usuario
↓
Escribir contraseña
↓
Login
↓
Entrar al dashboard
```

---

# Diferencia

## Unit Test

```text
Pequeño
Muy rápido
Aislado
```

---

## E2E

```text
Lento
Completo
Realista
```

---

# Cypress

El más popular en frontend.

---

Instalación:

```bash
npm i -D cypress
```

---

Ejemplo:

```js
describe('Login', () => {

  it('inicia sesión', () => {

    cy.visit('/');

    cy.get('#email')
      .type('patricio@test.com');

    cy.get('#password')
      .type('123456');

    cy.get('button')
      .click();

  });

});
```

---

## Ventajas

```text
Muy fácil
Interfaz visual
Excelente documentación
```

---

## Desventajas

```text
Más pesado
Consume más recursos
```

---

# Nightwatch

Alternativa clásica.

Usa:

```text
Selenium
```

por debajo.

---

## Ventajas

```text
Maduro
Compatible con muchos navegadores
```

---

## Desventajas

```text
Más complejo
Menos amigable
```

---

# Lo que realmente te pedirán hoy

Si entras a una empresa Vue en 2026:

```text
Vue Test Utils
Vitest
Cypress
```

---

# Resumen Bootcamp

## Unitarias

```text
Prueban una función o componente
```

Herramientas:

```text
Vue Test Utils
Vitest
Jest
Mocha + Chai
```

---

## E2E

```text
Prueban toda la aplicación
```

Herramientas:

```text
Cypress
Nightwatch
Playwright
```

---

## TDD

```text
RED
↓
GREEN
↓
REFACTOR
```

---

## Mocks y Stubs

```text
Objetos falsos
Para aislar pruebas
```

---

Si te hacen una entrevista Vue Junior, normalmente las preguntas son:

```text
¿Qué es una prueba unitaria?
¿Qué diferencia hay entre unitarias y E2E?
¿Qué es un mock?
¿Qué es TDD?
¿Has usado Cypress?
¿Qué es Vue Test Utils?
```

Con lo de arriba ya puedes responderlas sin problema. 😎













### ### ### ### EJERCICIO ### ### ### ### 
### ### ### ### EJERCICIO ### ### ### ### 
### ### ### ### EJERCICIO ### ### ### ### 



ejercicio

Objetivo
Aplicar TDD para construir y probar un componente de formulario sencillo usando Vue Test Utils y un runner de
unit tests (Jest o Vitest). Practicar mocks/stubs para aislar la unidad bajo prueba.
Requisitos
• Proyecto Vue 3 con runner de unit tests configurado:
o vue-cli + Jest o Vite + Vitest.
• Vue Test Utils instalado.
• Editor de texto y terminal.

Enunciado
Implementa un componente LoginForm.vue que cumpla:
1. Contiene dos campos: email y password.
2. El botón “Ingresar” inicia deshabilitado y solo se habilita si:
• el email tiene formato válido, y
• el password no está vacío.
3. Al enviar, el componente emite un evento submit con el payload { email, password } donde email viene
con trim (sin espacios al inicio/fin).
4. Si el email es inválido, se muestra un mensaje de error visible/accessible.
5. Tras emitir, el password se limpia (el email se mantiene).
El componente no debe llamar APIs ni depender del router. El foco es el comportamiento del componente (UI +
eventos).

Instrucciones
1. Prepara el entorno
• Crea el archivo de pruebas LoginForm.spec.(js|ts) y el componente LoginForm.vue vacío.
• Asegúrate de poder ejecutar el runner (npm run test:unit o vitest).
2. Estructura básica del formulario
• Debe tener dos campos: email y password.
• Botón “Ingresar” presente y deshabilitado por defecto.





3. Reglas de validación
• El botón se habilita solo si:
o el email tiene formato válido (p. ej., contiene @ y dominio),
o el password no está vacío.
• Si el email es inválido, muestra un mensaje de error visible/legible para el usuario.
4. Comportamiento al enviar
Al hacer submit con datos válidos, el componente emite un evento submit con el payload:

{ email: email.trim(), password }

5. Alcance del componente
• No debe llamar APIs ni usar router. Solo manejar UI y emitir el evento.
• Usa selectores estables en el markup (p. ej., data-testid="email", data-testid="error").
6. Pruebas unitarias requeridas
• Verifica render inicial: ambos inputs y botón deshabilitado.
• Verifica habilitación del botón con email válido + password no vacío.
• Verifica que con email inválido se muestra el mensaje de error y el botón queda deshabilitado.
• Verifica que al enviar:
o se emite submit con { email: email.trim(), password },
o el password queda vacío después del envío.

7. Aislamiento (si aplica)
• Si usas componentes hijos “pesados”, stubléalos en el montaje para centrarte en el comportamiento de
LoginForm.
• Si extraes un helper (p. ej., isValidEmail), puedes mockearlo en un test para comprobar que el
formulario reacciona a su respuesta.







Proyecto comprimido (sin node_modules).
Archivo Word con capturas:
1. LoginForm con error mostrado: evidencia visual del mensaje de error por email inválido (puede ser
la UI renderizada o la vista de DOM del test).
2. Envío válido de LoginForm: botón habilitado, envío realizado y evidencia de que se emitió submit
con { email: email.trim(), password }; además, mostrar que el password quedó vacío después del
envío (captura del test pasando y/o de la UI).
3. Runner en verde: captura de la ejecución de pruebas (CLI o UI del runner) con todos los tests
aprobados.
Breve ficha (1 página) explicando:
• Qué comportamientos se probaron (render inicial, validación/habilitación, error visible, emisión de
submit y limpieza de password).
• Cómo se usó Vue Test Utils (montaje, setValue, trigger, emitted) y por qué se probaron contratos
observables en lugar de detalles internos.
• Dónde aplicaste mocks/stubs (si hubo componentes hijos o helpers de validación) y por qué (aislar la
unidad, tests rápidos y deterministas).

