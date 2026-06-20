## API

--- 

## Indíce

- []()



--- 

## 




# APIs



sirve para hacer 

**Hace Hace una petición HTTP**

- GET
- POST
- PUT
- DELETE










## Dependencias

1. fetch()
2. axios
3. redaxios



### 1. fetch()

Es la herramienta nativa de JavaScript. Viene incorporada en el navegador.

Codigo:
```js
import axios from 'axios';

const { data: usuarios } =
  await axios.get(
    'https://jsonplaceholder.typicode.com/users'
  );

console.log(usuarios);
```




### 2. Axios

Es una librería externa.

Instalar:
```bash
npm i axios
```

Código:
```js
import axios from 'axios';

const { data: usuarios } =
  await axios.get(
    'https://jsonplaceholder.typicode.com/users'
  );

console.log(usuarios);
```


Timeout:

```js
axios.get(url, {
  timeout: 5000
});
```

Interceptors:

```js
axios.interceptors.request.use(...)
```

Sirven para:

```text
Agregar token
Agregar headers
Manejar errores
```



# 3. RedAxios

Instalar:
```sh
npm i redaxios
```

Código:
```js
import axios from 'redaxios';

const respuesta = await axios.get(
  'https://jsonplaceholder.typicode.com/users'
);

const usuarios = respuesta.data;

console.log(usuarios);
```










Consumo de datos desde una API Qué es una API 
Conceptos básicos de comunicación cliente/servidor. 
Header Body Status Definición de CRUD 
Web Services, Rest y verbos HTTP básicos 
GET POST PUT DELETE 
Interactuando con una API. 
Conociendo Postman y Reqres https://reqres.in/ 
Qué es JSON. Sintaxis e importancia. 
Autenticación con JWT 
Encriptación de datos en el cliente 
Consumiento una API con Axios 




Esto es prácticamente el módulo completo de **Consumo de APIs en Frontend**. Te lo explico en orden para que entiendas cómo se conecta todo.

# Consumo de datos desde una API

## ¿Qué es una API?

API significa:

```text
Application Programming Interface
```

Es un intermediario entre tu aplicación y un servidor.

Ejemplo:

```text
Vue
 ↓
API
 ↓
Base de Datos
```

---

### Ejemplo real

Tu aplicación:

```text
Netflix
```

pregunta:

```text
"Dame las películas"
```

La API responde:

```json
[
  {
    "id": 1,
    "titulo": "Matrix"
  }
]
```

---

# Cliente / Servidor

## Cliente

Es quien hace la petición.

Ejemplos:

```text
Vue
React
Angular
Navegador
App móvil
```

---

## Servidor

Es quien responde.

Ejemplos:

```text
Node
PHP
Django
Laravel
Spring
```

---

## Flujo

```text
Cliente
   ↓ petición

Servidor
   ↓ respuesta

Cliente
```

---

# Request y Response

## Request

Lo que envía el cliente.

```text
URL
Headers
Body
Método HTTP
```

---

## Response

Lo que responde el servidor.

```text
Status
Headers
Body
```

---

# Header

Información adicional.

Ejemplo:

```http
Authorization: Bearer token
Content-Type: application/json
```

Sirve para:

```text
Autenticación
Tipo de datos
Configuraciones
```

---

# Body

Son los datos.

Ejemplo:

```json
{
  "nombre": "Patricio",
  "edad": 41
}
```

---

# Status

Indica qué ocurrió.

## 200

```text
OK
```

---

## 201

```text
Creado correctamente
```

---

## 400

```text
Error del cliente
```

---

## 401

```text
No autorizado
```

---

## 404

```text
No encontrado
```

---

## 500

```text
Error del servidor
```

---

# CRUD

CRUD significa:

```text
Create
Read
Update
Delete
```

---

## Create

Crear.

```http
POST
```

---

## Read

Leer.

```http
GET
```

---

## Update

Actualizar.

```http
PUT
```

---

## Delete

Eliminar.

```http
DELETE
```

---

# REST

REST es una forma estándar de diseñar APIs.

Ejemplo:

```text
/api/users
```

---

Obtener usuarios:

```http
GET /api/users
```

---

Crear usuario:

```http
POST /api/users
```

---

Actualizar usuario:

```http
PUT /api/users/1
```

---

Eliminar usuario:

```http
DELETE /api/users/1
```

---

# Verbos HTTP

## GET

Obtiene datos.

```http
GET /users
```

---

## POST

Crea datos.

```http
POST /users
```

Body:

```json
{
  "name": "Patricio"
}
```

---

## PUT

Actualiza todo el recurso.

```http
PUT /users/1
```

---

## DELETE

Elimina.

```http
DELETE /users/1
```

---

# Reqres

Sitio para practicar APIs.

```text
https://reqres.in
```

Ejemplo:

```http
GET https://reqres.in/api/users?page=1
```

Respuesta:

```json
{
  "page": 1,
  "data": [
    {
      "id": 1,
      "email": "..."
    }
  ]
}
```

---

# Postman

Herramienta para probar APIs.

Permite:

```text
GET
POST
PUT
DELETE
Headers
Body
Tokens
```

---

Ejemplo:

```http
GET
https://reqres.in/api/users
```

---

# JSON

Formato más usado para intercambio de datos.

---

Objeto:

```json
{
  "nombre": "Patricio",
  "edad": 41
}
```

---

Array:

```json
[
  {
    "nombre": "Patricio"
  },
  {
    "nombre": "Juan"
  }
]
```

---

## Reglas JSON

Las claves siempre llevan comillas.

Correcto:

```json
{
  "nombre": "Patricio"
}
```

Incorrecto:

```json
{
  nombre: "Patricio"
}
```

---

# JWT

JWT significa:

```text
JSON Web Token
```

Sirve para autenticar usuarios.

---

## Login

Usuario:

```json
{
  "email": "patricio@gmail.com",
  "password": "123456"
}
```

---

Servidor:

```json
{
  "token": "eyJhbGciOi..."
}
```

---

## Guardar token

```js
localStorage.setItem(
  "token",
  token
);
```

---

## Enviar token

Header:

```http
Authorization: Bearer eyJhbGciOi...
```

---

# Encriptación

Sirve para proteger datos.

---

Hash de contraseña

```text
123456
↓
e10adc3949ba59abbe56e057f20f883e
```

---

Normalmente el frontend NO guarda contraseñas encriptadas.

El frontend:

```text
envía contraseña
```

El backend:

```text
genera hash
compara hash
```

---

# Consumir API con Axios

Instalar:

```bash
npm i axios
```

---

## GET

```js
import axios from "axios";

const { data } = await axios.get(
  "https://reqres.in/api/users"
);

console.log(data);
```

---

## POST

```js
await axios.post(
  "https://reqres.in/api/users",
  {
    name: "Patricio",
    job: "UX Designer"
  }
);
```

---

## PUT

```js
await axios.put(
  "https://reqres.in/api/users/1",
  {
    name: "Patricio"
  }
);
```

---

## DELETE

```js
await axios.delete(
  "https://reqres.in/api/users/1"
);
```

---

# Cómo se conecta todo

```text
Vue
 ↓

Axios
 ↓

HTTP
 ↓

API REST
 ↓

Servidor
 ↓

Base de Datos
```

---

# Lo que debes dominar para el bootcamp

```text
Qué es una API
Cliente vs Servidor

CRUD

GET
POST
PUT
DELETE

Status:
200
201
400
401
404
500

JSON

Postman

JWT

Axios
```

Si entiendes esos conceptos, ya tienes la base de cómo funcionan prácticamente todas las aplicaciones web modernas (Netflix, Mercado Libre, Instagram, Banco, etc.). 😎
























### ### ### ### EJERCICIO ### ### ### ### 
### ### ### ### EJERCICIO ### ### ### ### 
### ### ### ### EJERCICIO ### ### ### ### 

ejercicio

Objetivos
• Comprender cómo funciona el consumo de APIs externas
• Aprender a realizar peticiones HTTP utilizando Axios.
• Aplicar el manejo de promesas y errores al interactuar con APIs.
• Interpretar la respuesta de un API en formato JSON.
• Visualizar los datos obtenidos en el frontend.


Instrucciones

1. Crear proyecto con terminal
vue create consumo-api

2. Instalar Axios
npm install axios

3. Estructura básica
Dentro de la carpeta src/components, crea un nuevo componente llamado ApiExample.vue.Hooks del
ciclo de vida

4. A Consumir la API
En ApiExample.vue
Crea una función que haga una
solicitud GET a https://reqres.in/api/users?page=1.

• Incluye el header con tu clave API gratuita:

• Almacena la respuesta en una variable del componente y muestra en el template el nombre y
correo de cada usuario.

5. Manejo de errores
Implementa try...catch para capturar posibles errores y mostrarlos en consola.

6. Conecta el componente en App.vue
Importa y utiliza ApiExample.vue dentro de App.vue.


Entregables
• Proyecto comprimido .zip con los archivos del proyecto creado con Vue CLI. El proyecto debe
llamarse api-practica y contener los archivos relevantes en su estructura original. (No es
necesario incluir node_modules ni package-lock.json).
• Captura de pantalla del navegador, mostrando los datos renderizados correctamente desde la
API y, si es posible, la consola con logs de éxito o errores.
• Archivo Word, que incluya una breve explicación de los siguientes puntos:
• Cómo se realizó la petición a la API con Axios.
• Cómo se usó la clave API (x-api-key) en la solicitud.
• Qué ocurre si no se incluye la clave API.
• Cómo se manejaron errores con try...catch.