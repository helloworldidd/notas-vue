# Ejemplo ejercicio M7 L2


---


<br>
<br>

**Crear proyecto Vue e Instalar Axios**


```bash
npm create vue@latest api-practica

npm install axios
```


<br>
<br>

**Estructura básica**

```txt
src/
├── components/
│   └── ApiExample.vue
├── App.vue
└── main.js
```








<br>
<br>

**Consumir la API ReqRes.in**

1. Antes se podia usar **reqres-free-v1** como apikey

2. NUEVO METODO: crear cuenta en **ReqRes** https://reqres.in

3. Ir a **API Playground** https://app.reqres.in/playground

4. **AUTH BAR** es la apikey














<br>
<br>
<br>
<br>

src/components/ApiExample.vue

```vue
<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const usuarios = ref([])
const cargando = ref(false)
const error = ref('')

const obtenerUsuarios = async () => {
  cargando.value = true

  try {
    const response = await axios.get(
      'https://reqres.in/api/users?page=1',
      {
        headers: {
          'x-api-key': 'reqres-free-v1' //
        }
      }
    )

    usuarios.value = response.data

    console.log('Usuarios cargados')
    console.table(usuarios.value)
  }
  catch (err) {
    console.error('Error al consumir API', err)
    error.value = 'No fue posible obtener los usuarios'
  }
  finally {
    cargando.value = false
  }
}

onMounted(() => {
  obtenerUsuarios()
})
</script>

<template>
  <h1>Usuarios Reqres</h1>

  <p v-if="cargando">
    Cargando...
  </p>

  <p v-if="error">
    {{ error }}
  </p>

  <div
    v-for="usuario in usuarios"
    :key="usuario.id"
  >
    <h3>
      {{ usuario.first_name }} {{ usuario.last_name }}
    </h3>

    <p>
      {{ usuario.email }}
    </p>

    <img
      :src="usuario.avatar"
      :alt="usuario.first_name"
      width="80"
    >

    <hr>
  </div>
</template>
```






<br>
<br>
<br>
<br>
<br>

**Ejemplo alternativo: Consumir la API**

**con JSONPlaceholder**

**Esta API NO REQUIERE API Key.**

<br>
<br>



src/components/ApiExample.vue

```vue
<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const usuarios = ref([])
const cargando = ref(false)
const error = ref('')

const obtenerUsuarios = async () => {
  cargando.value = true

  try {
    const response = await axios.get(
      'https://jsonplaceholder.typicode.com/users'
    )

    usuarios.value = response.data

    console.log('Usuarios cargados')
    console.table(usuarios.value)
  }
  catch (err) {
    console.error('Error al consumir API', err)
    error.value = 'No fue posible obtener los usuarios'
  }
  finally {
    cargando.value = false
  }
}

onMounted(() => {
  obtenerUsuarios()
})
</script>

<template>
  <h1>Usuarios JSONPlaceholder</h1>

  <p v-if="cargando">
    Cargando...
  </p>

  <p v-if="error">
    {{ error }}
  </p>

  <div
    v-for="usuario in usuarios"
    :key="usuario.id"
  >
    <h3>
      {{ usuario.name }}
    </h3>

    <p>
      {{ usuario.email }}
    </p>

    <hr>
  </div>
</template>
```













<br>
<br>
<br>
<br>

**Conectar el componente en App.vue**

```vue
<script setup>
import ApiExample from './components/ApiExample.vue'
</script>

<template>
  <ApiExample />
</template>
```















<br>
<br>
<br>
<br>
<br>


**Explicación**


<br>
<br>

**Captura de pantalla**
  - Incluir:
    * Datos renderizados correctamente.
    * Consola mostrando logs de éxito o errores.
    * Evidencia de funcionamiento de la API.


<br>
<br>
<br>

**¿Cómo se realizó la petición a la API con Axios?**

Se utilizó el método `axios.get()` para realizar una solicitud HTTP GET hacia la API y obtener la información de los usuarios.


<br>
<br>

**¿Cómo se usó la clave API (x-api-key) en la solicitud?**

La clave se agregó dentro de la configuración de Axios utilizando la propiedad `headers`.

```js
headers: {
  'x-api-key': 'reqres-free-v1'
}
```


<br>
<br>

**¿Qué ocurre si no se incluye la clave API?**

La API puede rechazar la solicitud y devolver un error de autorización o acceso denegado.



<br>
<br>

**¿Cómo se manejaron errores con try...catch?**

La petición fue envuelta en un bloque `try...catch`. Si ocurre un error durante la solicitud, este es capturado por `catch`, mostrado en consola y comunicado al usuario mediante un mensaje de error.

