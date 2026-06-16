


---

# 14. Manejo de formularios con Pinia

## `src/stores/formStore.js`

```js
import { defineStore } from 'pinia'
import { reactive, ref, computed } from 'vue'

export const useFormStore = defineStore('form', () => {
  const form = reactive({
    nombre: '',
    apellidos: '',
    email: '',
    password: '',
    transporte: '',
    matricula: ''
  })

  const errores = ref([])
  const enviado = ref(false)

  const mostrarMatricula = computed(() => {
    return form.transporte === 'Automóvil'
  })

  const validarFormulario = () => {
    errores.value = []

    if (!form.nombre.trim()) {
      errores.value.push('Nombre requerido')
    }

    if (!form.apellidos.trim()) {
      errores.value.push('Apellidos requeridos')
    }

    if (!form.email.includes('@')) {
      errores.value.push('Email inválido')
    }

    if (form.password.length < 6) {
      errores.value.push('La contraseña debe tener mínimo 6 caracteres')
    }

    if (!form.transporte) {
      errores.value.push('Selecciona un medio de transporte')
    }

    if (mostrarMatricula.value && !form.matricula.trim()) {
      errores.value.push('Matrícula requerida')
    }

    return errores.value.length === 0
  }

  const registrar = async () => {
    enviado.value = false

    const valido = validarFormulario()

    if (!valido) return

    console.log('Formulario enviado:', form)

    enviado.value = true
  }

  const limpiarFormulario = () => {
    form.nombre = ''
    form.apellidos = ''
    form.email = ''
    form.password = ''
    form.transporte = ''
    form.matricula = ''
    errores.value = []
    enviado.value = false
  }

  return {
    form,
    errores,
    enviado,
    mostrarMatricula,
    validarFormulario,
    registrar,
    limpiarFormulario
  }
})
```

---


---

# 15. Módulos en Vuex vs Stores en Pinia

En Vuex usábamos módulos:

```txt
modules/
├── auth.js
├── catalogo.js
└── agenda.js
```

En Pinia hacemos stores separados:

```txt
stores/
├── authStore.js
├── catalogoStore.js
└── agendaStore.js
```

Ejemplo:

```js
import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useAgendaStore = defineStore('agenda', () => {
  const ocupado = ref(false)

  const toggleOcupado = () => {
    ocupado.value = !ocupado.value
  }

  const setOcupado = (valor) => {
    ocupado.value = Boolean(valor)
  }

  return {
    ocupado,
    toggleOcupado,
    setOcupado
  }
})
```

Uso:

```vue
<script setup>
import { useAgendaStore } from '@/stores/agendaStore'

const agendaStore = useAgendaStore()
</script>

<template>
  <p>Ocupado: {{ agendaStore.ocupado }}</p>

  <button @click="agendaStore.toggleOcupado">
    Cambiar estado
  </button>
</template>
```

---

# 16. Resumen para explicar en clases

```txt
Pinia reemplaza a Vuex como gestor de estado moderno en Vue.

Sirve para centralizar datos compartidos entre componentes.

En Pinia cada store puede tener:

- State: datos reactivos
- Getters: datos calculados
- Actions: funciones que modifican datos o consumen APIs

Pinia no usa mutations.

En vez de hacer commit o dispatch, llamamos funciones directamente.

Vuex:
store.dispatch('auth/doLogin')

Pinia:
authStore.doLogin()
```

---

# 17. Chuleta final Vuex → Pinia

```txt
Vuex:
this.$store.state.auth.username

Pinia:
authStore.username
```

```txt
Vuex:
this.$store.commit('setNumero', 10)

Pinia:
counterStore.setNumero(10)
```

```txt
Vuex:
this.$store.dispatch('auth/doLogin')

Pinia:
authStore.doLogin()
```

```txt
Vuex:
mapState()
mapActions()

Pinia:
const store = useStoreName()
```

```txt
Vuex:
modules

Pinia:
stores separados
```

---

Con esto ya tienes la clase completa pasada a **Pinia**, manteniendo la misma lógica pedagógica de la presentación Vuex.
