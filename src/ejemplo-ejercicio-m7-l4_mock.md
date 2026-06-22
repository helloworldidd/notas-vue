# Ejemplo M7 L4

---


<br>
<br>
<br>
<br>
<br>
<br>

**Instalación**

```bash
npm install -D vitest @vue/test-utils jsdom
```


en una terminal 
```bash
npm run dev
```
en otra  terminal 
```bash
npm run test
```








<br>
<br>
<br>
<br>
<br>
<br>

**Estructura**

```txt
src/
├── components/
│   ├── LoginForm.vue
│   ├── LoginForm.spec.js
│   └── BaseInput.vue
│
└── utils/
    └── validarEmail.js
```













<br>
<br>
<br>
<br>
<br>
<br>

---

## utils/validarEmail.js

```js
export function validarEmail(email) {
  return email.includes('@') && email.includes('.')
}
```














<br>
<br>
<br>
<br>
<br>
<br>

---

## BaseInput.vue

```vue
<script setup>
defineProps({
  modelValue: String,
  label: String,
  type: String,
  testid: String
})

const emit = defineEmits(['update:modelValue'])
</script>

<template>
  <div>
    <label>{{ label }}</label>

    <input
      :data-testid="testid"
      :type="type"
      :value="modelValue"
      @input="emit('update:modelValue', $event.target.value)"
    >
  </div>
</template>
```














<br>
<br>
<br>
<br>
<br>
<br>

---

## LoginForm.vue

```vue
<script setup>
import { ref, computed } from 'vue'
import BaseInput from './BaseInput.vue'
import { validarEmail } from '../utils/validarEmail'

const emit = defineEmits(['submit'])

const email = ref('')
const password = ref('')

const emailValido = computed(() => {
  return validarEmail(email.value)
})

const formularioValido = computed(() => {
  return emailValido.value && password.value.trim() !== ''
})

function enviarFormulario() {
  if (!formularioValido.value) return

  emit('submit', {
    email: email.value.trim(),
    password: password.value
  })

  password.value = ''
}
</script>

<template>
  <form @submit.prevent="enviarFormulario">

    <BaseInput
      v-model="email"
      label="Email"
      type="email"
      testid="email"
    />

    <p
      v-if="email && !emailValido"
      data-testid="error"
    >
      El correo electrónico no es válido
    </p>

    <BaseInput
      v-model="password"
      label="Password"
      type="password"
      testid="password"
    />

    <button
      data-testid="submit"
      type="submit"
      :disabled="!formularioValido"
    >
      Ingresar
    </button>

  </form>
</template>
```













<br>
<br>
<br>
<br>
<br>
<br>

---

## LoginForm.spec.js

```js
import { describe, it, expect, vi } from 'vitest'
import { mount } from '@vue/test-utils'
import LoginForm from './LoginForm.vue'
import { validarEmail } from '../utils/validarEmail'

vi.mock('../utils/validarEmail', () => ({
  validarEmail: vi.fn()
}))

const BaseInputStub = {
  props: ['modelValue', 'label', 'type', 'testid'],
  emits: ['update:modelValue'],
  template: `
    <div>
      <label>{{ label }}</label>

      <input
        :data-testid="testid"
        :type="type"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
      >
    </div>
  `
}

describe('LoginForm', () => {

  it('debe renderizar ambos inputs y el botón deshabilitado', () => {

    validarEmail.mockReturnValue(false)

    const wrapper = mount(LoginForm, {
      global: {
        stubs: {
          BaseInput: BaseInputStub
        }
      }
    })

    const email = wrapper.get('[data-testid="email"]')
    const password = wrapper.get('[data-testid="password"]')
    const boton = wrapper.get('[data-testid="submit"]')

    expect(email.exists()).toBe(true)
    expect(password.exists()).toBe(true)
    expect(boton.element.disabled).toBe(true)

  })

  it('debe habilitar el botón con email válido y password', async () => {

    validarEmail.mockReturnValue(true)

    const wrapper = mount(LoginForm, {
      global: {
        stubs: {
          BaseInput: BaseInputStub
        }
      }
    })

    await wrapper.get('[data-testid="email"]')
      .setValue('patricio@email.com')

    await wrapper.get('[data-testid="password"]')
      .setValue('123456')

    const boton = wrapper.get('[data-testid="submit"]')

    expect(boton.element.disabled).toBe(false)

  })

  it('debe mostrar error cuando el email es inválido', async () => {

    validarEmail.mockReturnValue(false)

    const wrapper = mount(LoginForm, {
      global: {
        stubs: {
          BaseInput: BaseInputStub
        }
      }
    })

    await wrapper.get('[data-testid="email"]')
      .setValue('correo-invalido')

    await wrapper.get('[data-testid="password"]')
      .setValue('123456')

    const error = wrapper.get('[data-testid="error"]')

    expect(error.text())
      .toContain('no es válido')

    const boton = wrapper.get('[data-testid="submit"]')

    expect(boton.element.disabled).toBe(true)

  })

  it('debe emitir submit con email trim y limpiar password', async () => {

    validarEmail.mockReturnValue(true)

    const wrapper = mount(LoginForm, {
      global: {
        stubs: {
          BaseInput: BaseInputStub
        }
      }
    })

    await wrapper.get('[data-testid="email"]')
      .setValue('   pato@email.com   ')

    await wrapper.get('[data-testid="password"]')
      .setValue('abc123')

    await wrapper.get('form')
      .trigger('submit')

    const eventos = wrapper.emitted('submit')

    expect(eventos).toBeTruthy()

    expect(eventos[0][0]).toEqual({
      email: 'pato@email.com',
      password: 'abc123'
    })

    const passwordInput =
      wrapper.get('[data-testid="password"]')

    expect(passwordInput.element.value)
      .toBe('')

  })

})
```






























{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "test": "vitest"
  }
}


















Y agrega en vite.config.js:
/// <reference types="vitest" />

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue],

  test: {
    environment: 'jsdom'
  }
})






<br>
<br>
<br>
<br>
<br>
<br>


---


















<br>
<br>
<br>
<br>
<br>
<br>


---

## package.json

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "test": "vitest"
  }
}
```
















<br>
<br>
<br>
<br>
<br>
<br>


---

## Explicación para la ficha

### Comportamientos probados

* Render inicial del formulario.
* Estado deshabilitado del botón.
* Validación del correo electrónico.
* Habilitación del botón cuando los datos son válidos.
* Visualización del mensaje de error.
* Emisión del evento `submit`.
* Limpieza del password después del envío.

### Uso de Vue Test Utils

Se utilizó:

```js
mount()
```

para montar el componente.

```js
setValue()
```

para simular escritura del usuario.

```js
trigger()
```

para simular el envío del formulario.

```js
emitted()
```

para verificar los eventos emitidos por el componente.

---

## Contratos observables

Las pruebas verifican lo que el usuario puede observar:

* Inputs visibles.
* Mensajes de error.
* Estado del botón.
* Evento emitido.

No se prueban variables internas ni detalles de implementación.

---

## Mocks y Stubs

### Mock

Se utilizó un mock para reemplazar la función real `validarEmail()`.

```js
vi.mock('../utils/validarEmail', () => ({
  validarEmail: vi.fn()
}))
```

Esto permite controlar desde el test si el email será considerado válido o inválido.

Ejemplo:

```js
validarEmail.mockReturnValue(true)
```

Con esto, el test no depende de la expresión regular real, sino del comportamiento que se quiere simular.

---

### Stub

Se utilizó un stub para reemplazar el componente hijo `BaseInput.vue`.

```js
global: {
  stubs: {
    BaseInput: BaseInputStub
  }
}
```

El stub mantiene lo mínimo necesario para que el formulario funcione:

* Recibe `props`.
* Muestra un input.
* Emite `update:modelValue`.

Así el test se concentra en `LoginForm.vue` y no en los detalles internos de `BaseInput.vue`.

---

## Conclusión
- En este ejercicio, `LoginForm.vue` se prueba como unidad principal.
- El mock permite controlar la validación del email.
- El stub permite reemplazar un componente hijo por una versión simple.
- Esto ayuda a que las pruebas sean más aisladas, rápidas y fáciles de mantener.
