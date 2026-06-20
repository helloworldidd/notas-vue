# Vue + JSONPlaceholder (POST)

Ejemplo simple de formulario en Vue 3 que envía datos a JSONPlaceholder utilizando `fetch()` y `POST`.

---

# Objetivos

Practicar:

- Composition API
- ref()
- v-model
- @submit.prevent
- async / await
- fetch()
- POST
- JSON.stringify()
- response.json()
- Renderizado condicional con v-if

---

# Estructura

```txt
src/
│
├── App.vue
│
└── main.js
```

---

# Código

## App.vue

```vue
<script setup>
import { ref } from "vue";

const nombre = ref("");
const email = ref("");

const respuesta = ref(null);

const enviarFormulario = async () => {
  const response = await fetch(
    "https://jsonplaceholder.typicode.com/users",
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name: nombre.value,
        email: email.value,
      }),
    }
  );

  respuesta.value = await response.json();
};
</script>

<template>
  <h1>Formulario de Registro</h1>

  <form @submit.prevent="enviarFormulario">

    <label>
      Nombre
    </label>

    <br>

    <input
      v-model="nombre"
      type="text"
      placeholder="Nombre"
    >

    <br><br>

    <label>
      Email
    </label>

    <br>

    <input
      v-model="email"
      type="email"
      placeholder="Email"
    >

    <br><br>

    <button>
      Enviar
    </button>

  </form>

  <hr>

  <div v-if="respuesta">

    <h2>Respuesta API</h2>

    <pre>
{{ respuesta }}
    </pre>

  </div>
</template>
```

---

# Datos enviados

Al presionar el botón se envía:

```json
{
  "name": "Patricio",
  "email": "patricio@mail.com"
}
```

---

# Respuesta recibida

JSONPlaceholder responde simulando un registro:

```json
{
  "name": "Patricio",
  "email": "patricio@mail.com",
  "id": 11
}
```

---

# Explicación paso a paso

## Crear estados reactivos

```js
const nombre = ref("");
const email = ref("");
const respuesta = ref(null);
```

Permiten almacenar los datos del formulario y la respuesta de la API.

---

## Capturar datos con v-model

```html
<input v-model="nombre">
<input v-model="email">
```

Vue sincroniza automáticamente el input con la variable.

---

## Evitar recarga del formulario

```html
<form @submit.prevent="enviarFormulario">
```

`.prevent` evita que la página se recargue.

---

## Enviar petición POST

```js
fetch(url, {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify(datos)
})
```

Se envían datos al servidor en formato JSON.

---

## Convertir respuesta a JSON

```js
const data = await response.json();
```

Transforma la respuesta del servidor en un objeto JavaScript.

---

## Mostrar respuesta

```html
<div v-if="respuesta">
  <pre>{{ respuesta }}</pre>
</div>
```

Solo aparece cuando existe una respuesta.

---

# Flujo completo

```txt
Usuario escribe
        ↓
v-model actualiza refs
        ↓
Submit formulario
        ↓
@submit.prevent
        ↓
enviarFormulario()
        ↓
fetch POST
        ↓
response.json()
        ↓
respuesta.value
        ↓
Vue renderiza resultado
```

---

# Mejoras posibles

## Loading

```js
const loading = ref(false);
```

Mostrar mensaje mientras se envía.

---

## Error

```js
const error = ref(null);
```

Capturar errores con try/catch.

---

## Limpiar formulario

```js
nombre.value = "";
email.value = "";
```

Después del envío exitoso.

---

## Validaciones

```js
if (!nombre.value) return;
if (!email.value) return;
```

Validar antes de enviar.

---

# Resultado esperado

```txt
Nombre: Patricio
Email: patricio@mail.com

[ Enviar ]

------------------------

Respuesta API

{
  "name": "Patricio",
  "email": "patricio@mail.com",
  "id": 11
}
```

---

# Conceptos Vue utilizados

- Composition API
- ref()
- v-model
- @submit.prevent
- async
- await
- fetch
- POST
- JSON
- response.json()
- v-if
- Interpolación {{ }}
