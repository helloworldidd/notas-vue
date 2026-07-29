# HTML
_Lenguaje que define la estructura del contenido web_

[INDICE]

## 1. HTML



### 1.1. Qué es
**HTML**

_HyperText Markup Language_ es el lenguaje que se usa para **estructurar una página web**.

Con HTML defines:

* títulos
* párrafos
* imágenes
* enlaces
* formularios
* estructura de la página

HTML **no da diseño**.
El diseño lo hace **CSS**.


HTML responde a una sola pregunta:
- **¿Cómo estructuro el contenido de una página web?**
    - Primero se aprende HTML.
    - Después CSS.
    - Luego JavaScript.



### 1.2. Enlaces de interés
- [Descripción HTML **Wikipedia**](https://es.wikipedia.org/wiki/HTML)
- [Documentación HTML **W3Schools**](https://www.w3schools.com/html/default.asp)
- [Documentación HTML **MDN**](https://developer.mozilla.org/es/docs/Web/HTML)
- [Documentación HTML **Oficial**](https://html.spec.whatwg.org/)





## 2. Estructura HTML

### 2.1. Estructura básica

Toda página HTML parte con 4 elementos de esta estructura:

```html
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Mi primera página</title>
</head>

<body>
    <h1>Hola mundo</h1>
    <p>Esta es mi primera página web</p>
</body>

</html>
```




**1. DOCTYPE html**
Indica al navegador que el documento está escrito en **HTML5**.

```html
<!DOCTYPE html>
```



**2. html**
Es el **elemento raíz** del documento.
Todo el contenido de la página debe estar dentro de esta etiqueta.

```html
<html></html>
```


**3. head**
Contiene **información para el navegador**, no visible para el usuario.
- Aquí normalmente van:
    * `meta` (configuración)
    * `title` (título de la pestaña)
    * `link` (CSS)
    * `script` (JavaScript)

```html
<head></head>
```


**4. body**
Contiene **todo el contenido visible de la página web**.

- Aquí van elementos como:
    * textos
    * imágenes
    * botones
    * formularios
    * secciones

```html
<body></body>
```





### 2.2. Estructura página HTML5

HTML5 tiene etiquetas para organizar el contenido.

```html
<!-- cabecera -->
<header>
    <h1>Mi sitio web</h1>
</header>

<!-- menu -->
<nav>
    <a href="#">Inicio</a>
    <a href="#">Servicios</a>
</nav>

<!-- contenido principal -->
<main>

    <!-- sección -->
    <section>
        <p>Contenido principal</p>
    </section>

    <!-- contenido secundario -->
    <aside>
        <p>Información lateral</p>
    </aside>
</main>

<!-- pie de página -->
<footer>
    <p>Copyright 2026</p>
</footer>
```






### 2.3. Estructura de carpetas

```html
📁 mi-web/
│
├── 📄 index.html
│
└── 📁 assets/
    ├── 📁 css/
    │   └── 📄 styles.css
    ├── 📁 js/
    │   └── 📄 main.js
    └── 📁 img/
        └── 🖼 logo.png
```

### 2.4. Nombres de carpetas y archivos

- **No usar espacios en los nombres de carpetas ni archivos**
- Usar **minúsculas**
- Separar palabras con **guiones `-` o `_`**

Ejemplos correctos:

```
mi-web
styles.css
main.js
logo-principal.png

```

Ejemplos incorrectos:

```
Mi Web
estilos principales.css
logo principal.png
script js.js

```












## 3. Elementos HTML

### 3.1. Base
Un elemento HTML tiene esta forma:

```html
<etiqueta>contenido</etiqueta>
```

Ejemplo:

```html
<p>Esto es un párrafo</p>
```

Partes:

* etiqueta apertura → `<p>`
* contenido
* etiqueta cierre → `</p>`



### 3.2. Títulos

HTML tiene **6 niveles de títulos**.

```html
<h1>Título principal</h1>
<h2>Subtítulo</h2>
<h3>Sección</h3>
<h4>Subsección</h4>
```

Regla importante:


h1 → título principal (solo uno por página)

h2 → sección

h3 → subsección

h4 → sub-subsección

h5 → nivel inferior de título

h6 → nivel más profundo de título


### 3.2. Párrafos

Para escribir texto se usa:

```html
<p>Este es un párrafo.</p>
```

Puedes usar varios:

```html
<p>Primer párrafo.</p>
<p>Segundo párrafo.</p>
```



### 3.3. Enlaces

Los enlaces conectan páginas.

```html
<a href="https://google.com">Ir a Google</a>
```

Partes:

```
a → etiqueta enlace
href → destino del link
```

Ejemplo a otra página:

```html
<a href="contacto.html">Contacto</a>
```



### 3.4. Imágenes

Para insertar imágenes:

```html
<img src="imagen.jpg" alt="Descripción">
```

Atributos importantes:

```
src → ruta de la imagen
alt → descripción de la imagen
```

Ejemplo:

```html
<img src="perro.jpg" alt="Foto de perro">
```



### 3.5. Listas

Lista no numerada
```html
<ul>
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ul>
```

Lista numerada
```html
<ol>
    <li>Primero</li>
    <li>Segundo</li>
    <li>Tercero</li>
</ol>
```

### 3.6. Tablas

Se usan para organizar datos.

```html
<table>

    <tr>
        <th>Nombre</th>
        <th>Edad</th>
    </tr>

    <tr>
        <td>Javier</td>
        <td>33</td>
    </tr>

    <tr>
        <td>Ana</td>
        <td>25</td>
    </tr>

</table>
```

<div class="dev-view">resultado ⬇️</div>
<table>
    <tr>
        <th>Nombre</th>
        <th>Edad</th>
    </tr>
    <tr>
        <td>Javier</td>
        <td>33</td>
    </tr>
    <tr>
        <td>Ana</td>
        <td>25</td>
    </tr>
</table>

Elementos:

```
table → tabla
tr → fila
td → celda
```



### 3.7. Formularios

Permiten recibir datos del usuario.

```html
<form>
    <input type="text">
    <input type="password">
    <input type="submit">
</form>
```
<div class="dev-view">resultado ⬇️</div>
<form>

    <input type="text">
    <input type="password">

    <input type="submit">

</form>

Tipos comunes:

```
text → texto
password → contraseña
checkbox → casilla
radio → opción
submit → enviar
button → botón
```



### 3.8. Select (menú desplegable)

```html
<select>
    <option>Chile</option>
    <option>Perú</option>
    <option>Argentina</option>
</select>
```
<div class="dev-view">resultado ⬇️</div>
<select>
    <option>Chile</option>
    <option>Perú</option>
    <option>Argentina</option>
</select>



### 3.9. Div

```html
<div></div>
```

Es un contenedor genérico.

Se usa para:

* agrupar elementos
* aplicar estilos CSS
* organizar layout



















## 4. Buenas prácticas HTML

### 4.1 Usar etiquetas semánticas

Preferir:

```
header
nav
main
section
footer
```

en lugar de muchos `div`.



### 4.2 Mantener jerarquía

```
h1
h2
h3
```



### 4.3 Imágenes accesibles

Siempre usar:

```html
alt=""
```



### 4.4 Código limpio

* indentación correcta
* etiquetas cerradas
* estructura clara



## 5. Ejemplo Página HTML

### 5.1 Código

```html
<!DOCTYPE html>
<html>

<head>
    <title>Mi sitio</title>
</head>

<body>

    <header>
        <h1>Mi página web</h1>
    </header>

    <nav>
        <a href="#">Inicio</a>
        <a href="#">Contacto</a>
    </nav>

    <main>    
        <section>
            <h2>Sobre mí</h2>
            <p>Soy estudiante de desarrollo web.</p>
        </section>
    </main>

    <footer>
        <p>2026</p>
    </footer>

</body>

</html>
```


