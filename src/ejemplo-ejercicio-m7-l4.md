# Ejemplo M7 L4




<br>
<br>
<br>
<br>
<br>
<br>

---

## Estructura

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
---

## LoginForm.vue

```vue
<script setup>
import { ref, computed } from 'vue'

const emit = defineEmits(['submit'])

const email = ref('')
const password = ref('')

const emailValido = computed(() => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)
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

    <div>
      <label>Email</label>

      <input
        data-testid="email"
        v-model="email"
        type="email"
      >

      <p
        v-if="email && !emailValido"
        data-testid="error"
      >
        El correo electrónico no es válido
      </p>
    </div>

    <div>
      <label>Password</label>

      <input
        data-testid="password"
        v-model="password"
        type="password"
      >
    </div>

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

---

## LoginForm.spec.js

```js
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import LoginForm from './LoginForm.vue'

describe('LoginForm', () => {

  it('debe renderizar ambos inputs y el botón deshabilitado', () => {

    const wrapper = mount(LoginForm)

    const email = wrapper.get('[data-testid="email"]')
    const password = wrapper.get('[data-testid="password"]')
    const boton = wrapper.get('[data-testid="submit"]')

    expect(email.exists()).toBe(true)
    expect(password.exists()).toBe(true)
    expect(boton.element.disabled).toBe(true)

  })

  it('debe habilitar el botón con email válido y password', async () => {

    const wrapper = mount(LoginForm)

    await wrapper.get('[data-testid="email"]')
      .setValue('patricio@email.com')

    await wrapper.get('[data-testid="password"]')
      .setValue('123456')

    const boton = wrapper.get('[data-testid="submit"]')

    expect(boton.element.disabled).toBe(false)

  })

  it('debe mostrar error cuando el email es inválido', async () => {

    const wrapper = mount(LoginForm)

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

    const wrapper = mount(LoginForm)

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

---

## Instalación

```bash
npm install -D vitest @vue/test-utils jsdom
```

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

### Contratos observables

Las pruebas verifican lo que el usuario puede observar:

* Inputs visibles.
* Mensajes de error.
* Estado del botón.
* Evento emitido.

No se prueban variables internas ni detalles de implementación.

### Mocks y Stubs

En esta solución no fueron necesarios porque el componente:

* No consume APIs.
* No usa Router.
* No tiene componentes hijos.

Por lo tanto, la unidad de prueba ya se encuentra completamente aislada. 

