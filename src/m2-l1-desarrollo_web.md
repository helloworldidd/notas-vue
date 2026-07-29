# Desarrollo Web
_Fundamentos del desarrollo Front-End._

[INDICE]


## 1. Desarrollo web

### 1.1. Qué es

El **desarrollo web** es el proceso de **crear sitios web o aplicaciones que funcionan en Internet y se visualizan en un navegador**. 

Incluye varias disciplinas como:

* diseño
* programación
* estructura de contenido
* servidores
* bases de datos

Para empezar a desarrollar web normalmente se aprende:

| | |
|---|---|
|**HTML**| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/html5-original.svg" width="40px">|
|**CSS**  |<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/css3-plain.svg" width="40px">|
|**JavaScript**|<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/javascript-original.svg" width="40px">|



**Enlaces de interés**
- https://developer.mozilla.org/es/docs/Learn  
- https://es.wikipedia.org/wiki/Desarrollo_web  



### 1.2. Conceptos básicos de la web

- __Sitio web__: Conjunto de **páginas web y archivos** almacenados en un servidor.
- __HTML__: Lenguaje que define la **estructura de una página web**.
- __Hipervínculo (link)__: Elemento que conecta una página con otra.
```html
<a href="pagina.html">Ir a otra página</a>
```
- __URL__: Dirección de un recurso en internet. Ejemplo: https://www.google.com
- __Dominio__: Nombre de la web.Ejemplo: midominio.com
- __Hosting__: Espacio en un servidor donde se guarda el sitio web.
- __Servidor__: Computador conectado a internet que **entrega los sitios web a los usuarios**.













## 2. Front-End vs Back-End

### 2.1. Front-End

Es **la parte visible del sitio web**. Se ejecuta en el navegador.

- Tecnologías principales:
    | | |
    |---|---|
    |**HTML**| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/html5-original.svg" width="40px">|
    |**CSS**  |<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/css3-plain.svg" width="40px">|
    |**JavaScript**|<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/javascript-original.svg" width="40px">|

- Responsabilidades:
    * diseño visual
    * interacción
    * estructura de la página



### 2.2. Back-End

Es **la parte que funciona en el servidor**.

- Se encarga de:
    * lógica
    * bases de datos
    * autenticación
    * procesamiento de datos


- Lenguajes comunes:
    | | |
    |---|---|
    |**PHP**    | <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/php-plain.svg"       width="40px">|
    |**Python** | <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/python-original.svg" width="40px">|
    |**Java**   | <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/java-original.svg"      width="40px">|
    |**Node.js**| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/nodejs-plain.svg"    width="40px">|
    |**Ruby**   | <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/rails-plain.svg"      width="40px">|
    |**ASP.NET**| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/dot-net-plain.svg"    width="40px">|


- Bases de datos comunes:
    | | |
    |---|---|
    |**MySQL**| <img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/mysql-plain.svg" width="40px">|
    |**PostgreSQL**  |<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/postgresql-plain.svg" width="40px">|
    |**SQL Server**|<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/microsoftsqlserver-plain.svg" width="40px">|
    |**MongoDB**|<img src="https://helloworldidd.github.io/sourceinvaders/assets/source/brands/mongodb-plain.svg" width="40px">|




### 2.3. Full Stack

Un **desarrollador Full Stack** trabaja en:

* Front-End
* Back-End
* servidores
* bases de datos
















## 3. La web


### 3.1. W3C

El **W3C (World Wide Web Consortium)** es la organización que define los **estándares de la web**.

Su objetivo es que la web funcione:

* en cualquier navegador
* en cualquier sistema
* en cualquier país


### 3.2. Cómo funciona la web (idea simple)

```
Usuario
 ↓
Navegador
 ↓
Solicita página a un servidor
 ↓
Servidor envía HTML, CSS y JS
 ↓
Navegador renderiza la página
```






### 3.3. HTML


HTML significa: __HyperText Markup Language__

Es un **lenguaje de marcado** que estructura el contenido de una web.

Ejemplo:

```html
<h1>Título</h1>
<p>Este es un texto</p>
```

Características:

* fácil de aprender
* multiplataforma
* basado en etiquetas
* código abierto

HTML define **estructura**, no diseño. 



### 3.4. HTML + CSS

HTML → estructura
CSS → apariencia

Ejemplo:

```html
<h1>Hola</h1>
```

```css
h1{
color:red;
}
```

Ventaja de separar:

* cambiar diseño sin cambiar estructura
* mantener código más organizado











## 4. Entorno de desarrollo


### 4.1 Editor de código
Para programar web se utiliza un **editor de código**.

Ejemplos:

* Visual Studio Code
* Sublime Text
* Atom
* Notepad++

El más usado hoy es:

**Visual Studio Code**

Porque tiene:

* extensiones
* autocompletado
* terminal integrada
* depuración de código 


### 4.2 El navegador

Un **navegador web** permite:

* abrir páginas web
* interpretar HTML, CSS y JavaScript
* mostrar contenido multimedia

Ejemplos:

* Chrome
* Firefox
* Edge
* Safari

Además permite:

- ver el resultado del código
- inspeccionar páginas
- detectar errores



### 4.3. Inspector del navegador

Herramienta para **analizar páginas web en tiempo real**.

Se abre con: **Click derecho → Inspeccionar**

- Paneles importantes:
    - Elements: Ver estructura HTML.
    - Styles: Ver y modificar CSS.
    - Computed: Ver valores finales de estilos.
    - Box Model: Analizar márgenes, padding y bordes.
    - Console: Ver errores y ejecutar JavaScript.












