
# Consumo de APIs


<br>

---

## Índice

* [Que es una API](#que-es-una-api)
* [Peticiones HTTP](#peticiones-http)
* [JSON](#json)
* [Consumo API](#consumo-api)
  + [Fetch vs Axios vs RedAxios](#fetch-vs-axios-vs-redaxios)
  + [Fetch](#fetch)
  + [Axios](#axios)
  + [RedAxios](#redaxios)
  + [Manejo de errores](#manejo-de-errores)
* [Backend y Vue](#backend-y-vue)
  + [Firebase](#firebase)



<br>

---

## Que es una API

> Una API (Application Programming Interface) es un conjunto de reglas que permite que distintas aplicaciones se comuniquen entre sí para intercambiar información.

Una API permite que una aplicación se comunique con otra.

En Vue, normalmente usamos una API para:

- traer datos
- crear registros
- editar información
- eliminar datos
- autenticar usuarios

Ejemplo:

```txt
Vue 3 App  --->  API  --->  Base de datos
```
































<br>
<br>
<br>
<br>
<br>
<br>

---

## Peticiones HTTP

> Antes de consumir una API desde Vue, es recomendable probar sus endpoints para comprender qué datos devuelve, qué parámetros recibe y cómo responde ante distintos escenarios.

Para realizar pruebas de APIs utilizaremos herramientas como Thunder Client dentro de Visual Studio Code.

<br>
<br>

**Instalación de Thunder Client**

Thunder Client es una extensión para Visual Studio Code que permite realizar peticiones HTTP sin salir del editor.

Pasos:

1. Abrir la pestaña Extensions en VS Code.
2. Buscar "Thunder Client".
3. Instalar la extensión.
4. Abrir la sección Thunder Client desde la barra lateral.

<br>

**Crear una petición**

Una petición HTTP requiere:

- URL del endpoint.
- Método HTTP.
- Parámetros (opcional).
- Headers (opcional).
- Body (opcional).

Ejemplo:

```http
GET https://jsonplaceholder.typicode.com/users
```

Al ejecutar la petición podremos visualizar:

* Código de estado.
* Headers.
* Tiempo de respuesta.
* Datos retornados por la API.




<br>

**Métodos HTTP más utilizados**

| Acción           | Verbo HTTP  | Uso                      |
| ---------------- | ----------- | ------------------------ |
| Leer datos       | GET         | Obtener información      |
| Crear datos      | POST        | Crear un nuevo registro  |
| Actualizar datos | PUT / PATCH | Modificar información    |
| Eliminar datos   | DELETE      | Borrar un registro       |



<br>

**Códigos de respuesta HTTP**

Cada petición devuelve un código que indica el resultado de la operación.

| Código | Significado |
| -------- | ------------------ |
| 200 | OK |
| 201 | Recurso creado |
| 400 | Solicitud incorrecta |
| 401 | No autorizado |
| 403 | Acceso prohibido |
| 404 | Recurso no encontrado |
| 500 | Error interno del servidor |


<br>

**Tipos de errores comunes**

Al consumir APIs es habitual encontrarse con distintos tipos de errores.

- Error 400 - Bad Request

  La solicitud enviada es incorrecta o contiene datos inválidos.

  Ejemplo:

  ```json
  {
    "email": ""
  }
  ```
  <br>

- Error 401 - Unauthorized
  La API requiere autenticación o el token es inválido.
  <br>

- Error 403 - Forbidden
  El usuario está autenticado pero no tiene permisos suficientes.
  <br>

- Error 404 - Not Found
  La URL o recurso solicitado no existe.
  <br>

- Error 500 - Internal Server Error
  Ocurrió un problema en el servidor mientras procesaba la solicitud.
  <br>

- Error de red
  La petición no pudo completarse debido a problemas de conexión o disponibilidad del servidor.
  <br>
















<br>
<br>
<br>
<br>
<br>
<br>

---

## JSON

> JSON (JavaScript Object Notation) es el formato estándar utilizado para intercambiar información entre aplicaciones, servidores y APIs.

Cuando una aplicación solicita datos a una API, normalmente la respuesta llega en formato JSON. Este formato es ligero, fácil de leer y compatible con prácticamente todos los lenguajes de programación.

Un objeto JSON está compuesto por pares **clave : valor**, similares a los objetos de JavaScript.

Ejemplo:

```json
{
  "name": "Patricio",
  "job": "Frontend Developer"
}
```

También es común recibir colecciones de datos:

```json
[
  {
    "id": 1,
    "name": "Patricio"
  },
  {
    "id": 2,
    "name": "Gabriela"
  }
]
```

En aplicaciones Vue, los datos recibidos en formato JSON suelen almacenarse en variables reactivas para luego mostrarlos en la interfaz mediante directivas como `v-for`, interpolaciones `{{ }}` o propiedades computadas.

Por ejemplo, una API podría devolver una lista de usuarios y Vue utilizar esos datos para generar automáticamente tarjetas, tablas o listados en pantalla.










































<br>
<br>
<br>
<br>
<br>
<br>

---

## Consumo API

> Consumir una API consiste en enviar peticiones a un servidor para obtener, crear, actualizar o eliminar información desde una aplicación.

En aplicaciones Vue es muy común consumir APIs para mostrar datos dinámicos, autenticar usuarios, almacenar información o interactuar con servicios externos.

Por ejemplo, una aplicación puede solicitar una lista de productos, guardar un formulario o recuperar información de un usuario desde un servidor.

Para realizar estas operaciones utilizaremos herramientas que simplifican el trabajo con peticiones HTTP.


<br>


### Fetch vs Axios vs RedAxios

> Existen distintas herramientas para consumir APIs desde JavaScript y Vue. Aunque todas permiten realizar peticiones HTTP, presentan diferencias en facilidad de uso, tamaño y funcionalidades disponibles.

Las tres alternativas más comunes son:

- **Fetch:** API nativa de JavaScript incluida en los navegadores modernos.
- **Axios:** Librería muy popular que simplifica el manejo de peticiones, respuestas y errores.
- **RedAxios:** Versión más liviana compatible con gran parte de la sintaxis de Axios.

A lo largo de esta sección utilizaremos las tres opciones para comprender sus similitudes y diferencias.



| Característica | Fetch | Axios | RedAxios |
|---------------|--------|--------|----------|
| Instalación | No | Sí | Sí |
| Incluido en navegador | ✅ | ❌ | ❌ |
| Manejo automático de JSON | ❌ | ✅ | ✅ |
| Manejo de errores | Manual | Simplificado | Simplificado |
| Tamaño | Muy pequeño | Mayor | Muy pequeño |
| Uso en proyectos Vue | Frecuente | Muy frecuente | Ocasional |

En proyectos Vue modernos, Axios suele ser la opción más utilizada debido a su simplicidad y herramientas integradas para trabajar con APIs.


<br>
<br>

### Fetch

> Fetch es la API nativa de JavaScript para realizar peticiones HTTP. No requiere instalación y está disponible en los navegadores modernos.


```js
const response = await fetch(
  'https://jsonplaceholder.typicode.com/users'
);

const usuarios = await response.json();

console.log(usuarios);
```




<br>
<br>

### Axios

> Axios es una librería muy popular para consumir APIs que simplifica tareas como el manejo de respuestas, errores e interceptores.



Instalar:
```bash
npm i axios
```

```js
import axios from 'axios';

const { data: usuarios } =
  await axios.get(
    'https://jsonplaceholder.typicode.com/users'
  );

console.log(usuarios);
```

**Posee:**

- Timeout:

```js
axios.get(url, {
  timeout: 5000
});
```

- Interceptors:
para: Agregar token, Agregar headers, Manejar errores

```js
axios.interceptors.request.use(...)
```




<br>
<br>

### RedAxios

> RedAxios es una alternativa ligera y compatible con gran parte de la sintaxis de Axios, pensada para proyectos donde el tamaño final del paquete es importante.



Instalar:
```sh
npm i redaxios
```

```js
import axios from 'redaxios';

const respuesta = await axios.get(
  'https://jsonplaceholder.typicode.com/users'
);

const usuarios = respuesta.data;

console.log(usuarios);
```















<br>
<br>

### Manejo de errores

> Al trabajar con APIs es fundamental controlar posibles errores de conexión, respuestas inválidas o problemas del servidor para mejorar la experiencia del usuario.

Siempre que se consume una API conviene usar:

```js
try {
  // petición correcta
} catch (error) {
  // manejar error
} finally {
  // se ejecuta siempre
}
```

Ejemplo común:

```js
try {
  const response = await axios.get('/users')
  users.value = response.data
} catch (error) {
  error.value = 'Ocurrió un problema'
} finally {
  loading.value = false
}
```
















































































---

## Backend y Vue

> Durante el desarrollo de aplicaciones web es común utilizar distintas tecnologías especializadas para resolver diferentes necesidades.

Algunas se enfocan en la interfaz visual (Frontend), otras en la lógica del servidor (Backend) y otras proporcionan servicios como bases de datos, autenticación o despliegue.


> Vue, React y Angular
> compiten principalmente como tecnologías Frontend.  

> Express, PHP, Python y .NET
> suelen utilizarse como Backend.  

> Firebase y Supabase
> permiten disponer de servicios Backend sin necesidad de desarrollar un servidor completo.





| Tecnología | Tipo | Uso principal |
|------------|------|---------------|
| Vue | Frontend | Crear interfaces web reactivas |
| React | Frontend | Construir interfaces basadas en componentes |
| Angular | Frontend | Framework completo para aplicaciones empresariales |
| Nuxt | Frontend SSR | Framework basado en Vue para SSR y SEO |
| Next.js | Frontend SSR | Framework basado en React para SSR y SEO |
| HTML | Frontend | Estructura de páginas web |
| CSS | Frontend | Estilos y diseño visual |
| JavaScript | Frontend / Backend | Lógica e interactividad |
| TypeScript | Frontend / Backend | JavaScript con tipado estático |
| Node.js | Backend | Ejecutar JavaScript en el servidor |
| Express | Backend | Crear APIs y servidores con Node.js |
| PHP | Backend | Desarrollo web y APIs |
| Python | Backend | APIs, automatización y análisis de datos |
| Java | Backend | Sistemas empresariales y APIs |
| .NET | Backend | Plataforma Microsoft para aplicaciones y APIs |
| Firebase | BaaS | Backend listo para usar de Google |
| Supabase | BaaS | Backend open source basado en PostgreSQL |
| MongoDB | Base de datos | Base de datos NoSQL orientada a documentos |
| PostgreSQL | Base de datos | Base de datos relacional avanzada |
| MySQL | Base de datos | Base de datos relacional ampliamente utilizada |
| Railway | Hosting Backend | Despliegue de APIs y bases de datos |
| Vercel | Hosting Frontend | Despliegue optimizado para Vue, React y Next |
| Netlify | Hosting Frontend | Hosting para aplicaciones frontend |
| GitHub | Repositorio | Control de versiones y colaboración |

<br>
<br>

**Arquitecturas comunes**

<br>
<br>

**Vue + Firebase**
No es necesario crear un backend propio.

```txt
Vue
 ↓
Firebase
 ↓
Firestore
```


<br>
<br>

**Vue + Express**
El backend es desarrollado por nosotros.

```txt
Vue
 ↓
Axios
 ↓
Express
 ↓
Base de datos
```


<br>
<br>

**Vue + Supabase**
Muy popular como alternativa moderna a Firebase.

```txt
Vue
 ↓
Supabase
 ↓
PostgreSQL
```


<br>
<br>

**Vue + Express + Railway**
Arquitectura muy utilizada en proyectos profesionales y portafolios.

```txt
Vue
 ↓
Axios
 ↓
Express
 ↓
PostgreSQL
 ↓
Railway
```


<br>
<br>

**Nuxt**
Nuxt incorpora funcionalidades adicionales sobre Vue como SSR, SEO y generación de sitios estáticos.

```txt
Nuxt
 ↓
API
 ↓
Base de datos
```


<br>
<br>

**Next.js**
Equivalente a Nuxt, pero construido sobre React.

```txt
Next.js
 ↓
API
 ↓
Base de datos
```

<br>
<br>







































<br>
<br>
<br>
<br>
<br>
<br>


### Firebase
> Firebase es una plataforma de servicios backend que permite almacenar datos, autenticar usuarios y crear aplicaciones sin necesidad de desarrollar un servidor propio.


Firebase puede funcionar como backend para proyectos Vue.

Permite usar:

* autenticación
* base de datos
* hosting
* storage
* funciones cloud

**CRUD con Firebase**

> Firebase permite crear, leer, actualizar y eliminar información mediante operaciones CRUD, facilitando el desarrollo de aplicaciones conectadas a una base de datos en tiempo real.




**Firestore**

> Firestore es la base de datos NoSQL de Firebase. Permite almacenar documentos y colecciones de forma flexible y acceder a ellos desde aplicaciones Vue.

<br>

[tutorial firebase](./otros-api-firebase.md)

## ★
