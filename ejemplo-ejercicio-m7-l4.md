# Ejemplo M7 L4



**requeriemntos generales**
- crear un `LoginForm.vue`
- probarlo con TDD
- validar email/password
- emitir `submit` y limpiar el password después del envío



**Cosas “viejas” del ejercicio**

- el uso  de **vue-cli + Jest**. Hoy es mejor usar **Vite + Vitest + Vue Test Utils**









---

# 1. Instalar testing

```bash
npm install -D vitest @vue/test-utils jsdom
```









---

## 2. configuracion


<br>
<br>

package.json

```json
{
  "scripts": {
    "test:unit": "vitest"
  }
}
```



<br>
<br>


---

## 3. vitest.config.js

```js
import { defineConfig } from 'vitest/config'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
    plugins: [vue()],
  test: {
      environment: 'jsdom',
    globals: true
  }
})
```










      
<br>
<br>


---

## 4. estructura

```txt
src/
├─ components/
│  ├─ LoginForm.vue
│  └─ LoginForm.spec.js
```











      
<br>
<br>




---

## 5. src/components/LoginForm.vue

```vue
<script setup>
import { ref, computed } from 'vue'

const emit = defineEmits(['submit'])

const email = ref('')
const password = ref('')

const isEmailValid = computed(() => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value.trim())
})

const showEmailError = computed(() => {
  return email.value.length > 0 && !isEmailValid.value
})

const canSubmit = computed(() => {
  return isEmailValid.value && password.value.length > 0
})

function handleSubmit() {
  if (!canSubmit.value) return

  emit('submit', {
    email: email.value.trim(),
    password: password.value
  })

  password.value = ''
}
</script>

<template>
  <form @submit.prevent="handleSubmit">
    <div>
      <label for="email">Email</label>
      <input
        id="email"
        data-testid="email"
        v-model="email"
        type="email"
      >
    </div>

    <p
      v-if="showEmailError"
      data-testid="error"
      role="alert"
    >
      El email no es válido
    </p>

    <div>
      <label for="password">Password</label>
      <input
        id="password"
        data-testid="password"
        v-model="password"
        type="password"
      >
    </div>

    <button
      data-testid="submit"
      type="submit"
      :disabled="!canSubmit"
    >
      Ingresar
    </button>
  </form>
</template>
```


















      
<br>
<br>



---

## 6. src/components/LoginForm.spec.js

```js
import { mount } from '@vue/test-utils'
import { describe, it, expect } from 'vitest'
import LoginForm from './LoginForm.vue'

describe('LoginForm', () => {
  it('renderiza inputs y botón deshabilitado al inicio', () => {
    const wrapper = mount(LoginForm)

    const emailInput = wrapper.get('[data-testid="email"]')
    const passwordInput = wrapper.get('[data-testid="password"]')
    const button = wrapper.get('[data-testid="submit"]')

    expect(emailInput.exists()).toBe(true)
    expect(passwordInput.exists()).toBe(true)
    expect(button.attributes('disabled')).toBeDefined()
  })

  it('habilita el botón con email válido y password no vacío', async () => {
    const wrapper = mount(LoginForm)

    await wrapper.get('[data-testid="email"]').setValue('test@mail.com')
    await wrapper.get('[data-testid="password"]').setValue('123456')

    const button = wrapper.get('[data-testid="submit"]')

    expect(button.attributes('disabled')).toBeUndefined()
  })

  it('muestra error si el email es inválido y mantiene el botón deshabilitado', async () => {
    const wrapper = mount(LoginForm)

    await wrapper.get('[data-testid="email"]').setValue('correo-malo')
    await wrapper.get('[data-testid="password"]').setValue('123456')

    expect(wrapper.get('[data-testid="error"]').text()).toBe('El email no es válido')

    const button = wrapper.get('[data-testid="submit"]')
    expect(button.attributes('disabled')).toBeDefined()
  })

  it('emite submit con email trim y limpia el password', async () => {
    const wrapper = mount(LoginForm)

    await wrapper.get('[data-testid="email"]').setValue('  test@mail.com  ')
    await wrapper.get('[data-testid="password"]').setValue('123456')

    await wrapper.get('form').trigger('submit')

    expect(wrapper.emitted('submit')).toBeTruthy()

    expect(wrapper.emitted('submit')[0][0]).toEqual({
      email: 'test@mail.com',
      password: '123456'
    })

    expect(wrapper.get('[data-testid="password"]').element.value).toBe('')
    expect(wrapper.get('[data-testid="email"]').element.value).toBe('  test@mail.com  ')
  })
})
```































---

## 7. Ejecutar

```bash
npm run test:unit
```








---

## 8. entrega

Capturas:
- Error visible con email inválido.
- Test del submit válido con payload emitido.
- Runner en verde con todos los tests aprobados.



Los comportamientos probados fueron:

- Render inicial del formulario.
- Campos email y password presentes.
- Botón “Ingresar” deshabilitado por defecto.
- Habilitación del botón solo con email válido y password no vacío.
- Mensaje de error visible cuando el email es inválido.
- Emisión del evento submit con el payload `{ email, password }`.
- Limpieza del campo password después del envío.

Para las pruebas se utilizó Vue Test Utils junto con Vitest.  

Vue Test Utils permitió montar el componente con `mount`, modificar inputs con `setValue`, simular el envío del formulario con `trigger` y revisar eventos emitidos con `emitted`.

Se probaron comportamientos observables del componente en vez de detalles internos, porque eso hace que los tests sean más útiles y resistentes a cambios de implementación.

En este caso no fue necesario usar mocks ni stubs, ya que el componente no depende de APIs, router ni componentes hijos pesados.
