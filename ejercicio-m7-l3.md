# Actividad N° 3 – Gestión de Estado con Pinia + Axios + Vue Router

## Objetivo

Construir una mini aplicación con login y dashboard que consuma datos desde una API utilizando:

* Vue 3
* **Pinia**
* Vue Router
* Axios

La aplicación deberá centralizar el estado de sesión y de los datos obtenidos desde una API utilizando Pinia.

---

# Requisitos previos

* Vue 3
* Pinia
* Vue Router 4
* Axios
* API REST o json-server con un recurso llamado `frameworks`

---

# 1. Estructura del proyecto

Crear un proyecto Vue 3 y agregar la siguiente estructura:

```txt
src/
├── api/
│   └── api.js
├── stores/
│   ├── authStore.js
│   └── frameworksStore.js
├── router/
│   └── index.js
├── views/
│   ├── AppLogin.vue
│   └── UserDashboard.vue
├── App.vue
└── main.js
```

Conectar Pinia y Vue Router antes de montar la aplicación.

---

# 2. Instancia única de Axios

Crear:

```txt
src/api/api.js
```

Configurar:

* baseURL
* timeout

Ejemplo:

```js
import axios from "axios";

export default axios.create({
  baseURL: "http://localhost:3000",
  timeout: 5000,
});
```

Nota:
Si posteriormente se implementa autenticación con token, aquí se agregaría el encabezado Authorization.

---

# 3. Store de autenticación

Crear:

```txt
src/stores/authStore.js
```

State:

```js
auth
username
loading
error
```

Getter:

```js
isAuthenticated
```

Actions:

```js
doLogin()
doLogout()
```

Responsabilidades:

### doLogin()

* Validar usuario y contraseña.
* Activar loading.
* Gestionar errores.
* Guardar la sesión.
* Actualizar auth y username.

### doLogout()

* Limpiar la sesión.
* Reiniciar el estado.

Toda la lógica de autenticación debe realizarse dentro de las actions.

---

# 4. Store de frameworks

Crear:

```txt
src/stores/frameworksStore.js
```

State:

```js
items
loading
error
```

Actions:

```js
cargarFrameworks()
```

Responsabilidades:

* Consumir la API mediante Axios.
* Gestionar loading.
* Gestionar errores.
* Guardar los datos obtenidos.

Ejemplo de endpoint:

```txt
GET /frameworks
```

Extensión opcional:

* búsqueda
* filtros
* paginación

---

# 5. Configuración de Pinia

Registrar Pinia en:

```js
main.js
```

Ejemplo:

```js
import { createApp } from "vue";
import { createPinia } from "pinia";

import App from "./App.vue";
import router from "./router";

const app = createApp(App);

app.use(createPinia());
app.use(router);

app.mount("#app");
```

---

# 6. Rutas protegidas

Crear:

```txt
src/router/index.js
```

Rutas:

```txt
/login
/dashboard
```

La ruta dashboard debe ser privada.

Agregar:

```js
meta: {
  requiresAuth: true
}
```

Implementar un guard global:

```js
router.beforeEach(...)
```

Regla:

* Si el usuario intenta acceder a una ruta protegida sin sesión iniciada:

  * redirigir a Login.

---

# 7. Vista AppLogin.vue

Crear un formulario local con:

```txt
username
password
```

Al enviar:

* ejecutar doLogin()
* si el login es correcto:

  * navegar a Dashboard

Mostrar:

* loading
* mensajes de error

Importante:

No utilizar Axios directamente en la vista.

Toda la lógica debe ejecutarse desde la store.

---

# 8. Vista UserDashboard.vue

Mostrar:

```txt
Hola, {username}
```

Agregar botón:

```txt
Salir
```

Al presionar:

* ejecutar doLogout()
* volver a Login

Al montar el componente:

```js
onMounted()
```

ejecutar:

```js
cargarFrameworks()
```

Mostrar:

* loading
* errores
* listado de frameworks

Importante:

No utilizar Axios directamente dentro de la vista.

La información debe obtenerse desde Pinia.

---

# Conceptos que se deben comprender

## State

Información global compartida por la aplicación.

Ejemplos:

```js
auth
username
items
```

---

## Getters

Valores calculados a partir del estado.

Ejemplo:

```js
isAuthenticated
```

---

## Actions

Funciones que modifican el estado o realizan operaciones asíncronas.

Ejemplos:

```js
doLogin()
doLogout()
cargarFrameworks()
```

---

## Store

Archivo que agrupa:

* state
* getters
* actions

Ejemplos:

```txt
authStore.js
frameworksStore.js
```

---

# Entregables

## Proyecto

Archivo comprimido:

```txt
ZIP
```

Sin incluir:

```txt
node_modules
```

---

## Documento Word

Incluir capturas de:

1. Login mostrando error.
2. Dashboard mostrando saludo y lista cargada.
3. Acceso a Dashboard sin sesión y redirección automática a Login.

---

## Informe breve (1 página)

Explicar:

* Qué es Pinia.
* Diferencia entre state, getters y actions.
* Por qué las peticiones Axios se realizan desde las stores.
* Cómo funciona la protección de rutas mediante Navigation Guards.
