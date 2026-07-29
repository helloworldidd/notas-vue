# JS APIs
_Consumo de datos con JavaScript XHR y Fetch_


[INDICE]



## 1. ¿Qué es una API?

Una **API (Application Programming Interface)** es un conjunto de **definiciones y protocolos** que permiten que dos aplicaciones se comuniquen entre sí.

En otras palabras, una API define **cómo interactúan dos sistemas de software**.

Ejemplo simple:

```id="z2rdn2"
Aplicación web → solicita datos → API → responde con datos
```

Las APIs permiten:

* compartir información
* integrar servicios externos
* automatizar procesos entre aplicaciones

## 2. APIs del lado del cliente

JavaScript del lado del cliente tiene acceso a múltiples APIs.

Estas **no forman parte del lenguaje JavaScript**, sino que están construidas **sobre él**.

Generalmente se dividen en dos categorías:

```id="zj0yw5"
APIs del navegador
APIs de terceros
```

## 3. APIs del navegador

Las **APIs del navegador** están integradas dentro del navegador web.

Permiten acceder a funcionalidades del entorno del usuario.

Ejemplos:

* manipulación del DOM
* geolocalización
* audio y video
* gráficos 2D y 3D

## Ejemplos de APIs del navegador

#### DOM API

Permite modificar HTML y CSS dinámicamente.

Ejemplo:

```javascript
document.querySelector("h1").textContent = "Hola mundo";
```

---

#### Canvas API

Permite crear gráficos 2D.

Ejemplo de usos:

* gráficos
* animaciones
* edición de imágenes

---

#### WebGL

Permite crear **gráficos 3D** dentro del navegador.

---

#### APIs multimedia

Ejemplos:

* **WebRTC**
* **HTMLMediaElement**

Permiten manipular:

* audio
* video
* cámara web
* subtítulos

## 4. APIs de terceros

Las **APIs de terceros** no están incluidas en el navegador.

Se deben obtener desde servicios externos.

Ejemplos populares:

| API             | Uso             |
| --------------- | --------------- |
| Twitter API     | obtener tweets  |
| Google Maps API | mapas           |
| YouTube API     | integrar videos |

Estas APIs permiten **integrar servicios externos en aplicaciones web**.





## 5. AJAX

AJAX significa: `Asynchronous JavaScript And XML`

Es una técnica que permite **comunicar el navegador con el servidor sin recargar la página completa**.

AJAX se basa en:

* **XMLHttpRequest o Fetch**
* **JavaScript**
* **DOM**

### Problema que resolvió AJAX

Antes de AJAX:

Cada interacción requería **recargar la página completa**.

Problemas:

* experiencia lenta
* alto consumo de datos
* interfaces poco dinámicas

AJAX permite:

* actualizar partes de la página
* mejorar la experiencia de usuario
* reducir carga en el servidor





## 6. XHR (XMLHttpRequest)

XHR es un objeto que permite **enviar solicitudes HTTP al servidor**.

Pasos básicos para usar XHR:

1. Crear el objeto
2. Abrir la solicitud
3. Manejar la respuesta
4. Enviar la solicitud

### Ejemplo con XHR

```javascript id="efyxkq"
var req = new XMLHttpRequest();

req.open('GET', 'URL', true);

req.onreadystatechange = function () {

  if (req.readyState == 4) {

    if (req.status == 200) {
      console.log("Éxito:", req.responseText);
    } else {
      console.log("Error:", req.status);
    }

  }

};

req.send();
```




## 7. Fetch API

La **Fetch API** es la forma moderna de hacer peticiones HTTP.

Ventajas:

* usa **promesas**
* código más limpio
* más fácil de mantener

### Ejemplo con Fetch

```javascript id="85sc2y"
fetch(url)
    .then((resp) => resp.json())
    .then((data) => {
        let datos = data.results;
        console.log(datos);
})

.catch((error) => {
    console.log("Error:", error);
});
```

## 8. Cuándo usar XHR o Fetch

| Método | Uso                                     |
| ------ | --------------------------------------- |
| XHR    | compatibilidad con navegadores antiguos |
| Fetch  | proyectos modernos                      |

En la mayoría de los proyectos actuales se recomienda usar: `Fetch API`





## 9. API Keys

Algunas APIs requieren autenticación mediante una **API Key**.

Una **API Key** es una clave única que identifica al usuario que consume la API.

Ejemplo de uso en headers:

```javascript id="m2iz5f"
headers: {
  'X-API-KEY': 'apikey',
  'Accept': 'application/json',
  'Content-Type': 'application/json'
}
```

⚠ Importante:

Las **API Keys son privadas y no deben compartirse públicamente**.

## 10. Ejemplo usando The Cat API

Este ejemplo obtiene **imágenes aleatorias de gatos** desde una API.

```javascript id="q9j3o0"
const url = 'https://api.thecatapi.com/v1/images/search';
const apiKey = 'DEMO-API-KEY';

function obtenerGatito() {
  fetch(url, {
    headers: {
      'x-api-key': apiKey,
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  })
  .then(response => response.json())
  .then(data => {
    const imagenUrl = data[0].url;
    document.getElementById('catImage').src = imagenUrl;
  })
  .catch(error => {
    console.error('Error al obtener el gatito:', error);
  });
}

obtenerGatito();
```




## 11. Solicitar datos desde una API

Ejemplo usando **Random User API**:

```javascript id="gbl6g6"
const url = 'https://randomuser.me/api/?results=10';

fetch(url)
  .then((resp) => resp.json())
  .then(function (data) {

    let authors = data.results;
    console.log(authors);
  })
  .catch();
```






## 12. Mostrar datos en el DOM

Ejemplo creando elementos HTML con los datos obtenidos.

```javascript id="0cdb9y"
const ul = document.getElementById('authors');
const url = 'https://randomuser.me/api/?results=10';

fetch(url)
    .then((resp) => resp.json())
    .then(function (data) {
        let authors = data.results;
        return authors.map(function (author) {

            let li = document.createElement('li');
            let img = document.createElement('img');
            let span = document.createElement('span');

            img.src = author.picture.medium;
            span.innerHTML = `${author.name.first} ${author.name.last}`;

            li.appendChild(img);
            li.appendChild(span);

            ul.appendChild(li);
        });
    })

    .catch(function (error) {
        console.log(error);
    });
```




### Actividad propuesta

Consumir una API pública y mostrar los resultados en una página web.

Pasos:

1. Obtener datos desde una API usando **fetch**
2. Convertir la respuesta a **JSON**
3. Crear elementos HTML dinámicamente
4. Mostrar los datos en la página

