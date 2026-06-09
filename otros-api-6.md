# Vue + JSONPlaceholder: GET, POST, PUT y DELETE

Ejemplo completo para practicar peticiones HTTP desde Vue 3 usando `fetch()`.

---

## API usada

```txt
https://jsonplaceholder.typicode.com/users
```

JSONPlaceholder simula una API real.  
Los datos **no se guardan realmente**, pero devuelve respuestas como si lo hiciera.

---

# App.vue

```vue
<script setup>
import { ref, onMounted } from "vue";

const usuarios = ref([]);
const respuesta = ref(null);

const nombre = ref("");
const email = ref("");

const loading = ref(false);
const error = ref(null);

// GET
const obtenerUsuarios = async () => {
  try {
    loading.value = true;

    const response = await fetch(
      "https://jsonplaceholder.typicode.com/users"
    );

    usuarios.value = await response.json();

  } catch (err) {
    error.value = err.message;
  } finally {
    loading.value = false;
  }
};

// POST
const crearUsuario = async () => {
  try {
    loading.value = true;

    const response = await fetch(
      "https://jsonplaceholder.typicode.com/users",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          name: nombre.value,
          email: email.value
        })
      }
    );

    respuesta.value = await response.json();

    nombre.value = "";
    email.value = "";

  } catch (err) {
    error.value = err.message;
  } finally {
    loading.value = false;
  }
};

// PUT
const actualizarUsuario = async () => {
  try {
    loading.value = true;

    const response = await fetch(
      "https://jsonplaceholder.typicode.com/users/1",
      {
        method: "PUT",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          id: 1,
          name: "Usuario actualizado",
          email: "actualizado@mail.com"
        })
      }
    );

    respuesta.value = await response.json();

  } catch (err) {
    error.value = err.message;
  } finally {
    loading.value = false;
  }
};

// DELETE
const eliminarUsuario = async () => {
  try {
    loading.value = true;

    const response = await fetch(
      "https://jsonplaceholder.typicode.com/users/1",
      {
        method: "DELETE"
      }
    );

    respuesta.value = {
      status: response.status,
      mensaje: "Usuario eliminado correctamente"
    };

  } catch (err) {
    error.value = err.message;
  } finally {
    loading.value = false;
  }
};

onMounted(() => {
  obtenerUsuarios();
});
</script>

<template>
  <h1>CRUD con Vue y JSONPlaceholder</h1>

  <p v-if="loading">
    Cargando...
  </p>

  <p v-if="error">
    Error: {{ error }}
  </p>

  <hr>

  <h2>POST - Crear usuario</h2>

  <form @submit.prevent="crearUsuario">
    <input
      v-model="nombre"
      placeholder="Nombre"
    >

    <br><br>

    <input
      v-model="email"
      placeholder="Email"
    >

    <br><br>

    <button>
      Crear usuario
    </button>
  </form>

  <hr>

  <h2>GET - Listar usuarios</h2>

  <button @click="obtenerUsuarios">
    Obtener usuarios
  </button>

  <ul>
    <li
      v-for="usuario in usuarios"
      :key="usuario.id"
    >
      {{ usuario.name }} - {{ usuario.email }}
    </li>
  </ul>

  <hr>

  <h2>PUT - Actualizar usuario</h2>

  <button @click="actualizarUsuario">
    Actualizar usuario 1
  </button>

  <hr>

  <h2>DELETE - Eliminar usuario</h2>

  <button @click="eliminarUsuario">
    Eliminar usuario 1
  </button>

  <hr>

  <h2>Respuesta de la API</h2>

  <pre v-if="respuesta">
{{ respuesta }}
  </pre>
</template>
```

---

# Qué hace cada método

## GET

Sirve para obtener datos.

```js
fetch("https://jsonplaceholder.typicode.com/users")
```

Se usa para listar usuarios.

---

## POST

Sirve para crear datos nuevos.

```js
fetch("https://jsonplaceholder.typicode.com/users", {
  method: "POST"
})
```

En este ejemplo crea un usuario con:

```js
{
  name: nombre.value,
  email: email.value
}
```

---

## PUT

Sirve para actualizar un recurso completo.

```js
fetch("https://jsonplaceholder.typicode.com/users/1", {
  method: "PUT"
})
```

En este caso actualiza el usuario con `id: 1`.

---

## DELETE

Sirve para eliminar un recurso.

```js
fetch("https://jsonplaceholder.typicode.com/users/1", {
  method: "DELETE"
})
```

En este caso elimina el usuario con `id: 1`.

---

# Resumen rápido

| Método | Acción | Ejemplo |
|---|---|---|
| GET | Obtener datos | Listar usuarios |
| POST | Crear datos | Crear usuario |
| PUT | Actualizar datos | Editar usuario |
| DELETE | Eliminar datos | Borrar usuario |

---

# Importante

JSONPlaceholder no guarda los cambios realmente.

Esto significa que:

```txt
POST responde como si creara
PUT responde como si actualizara
DELETE responde como si eliminara
```

pero al recargar la página los datos vuelven a estar igual.

---

# Flujo en Vue

```txt
Usuario hace click o envía formulario
        ↓
Vue ejecuta una función
        ↓
fetch() hace la petición
        ↓
La API responde
        ↓
response.json()
        ↓
Se guarda en ref()
        ↓
Vue actualiza la pantalla
```

---

# Conceptos usados

```txt
ref()
onMounted()
v-model
v-for
v-if
@click
@submit.prevent
async / await
fetch()
GET
POST
PUT
DELETE
JSON.stringify()
response.json()
try / catch / finally
```