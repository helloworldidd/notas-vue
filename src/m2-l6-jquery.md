# jQuery
_Biblioteca de JavaScript que simplifica la manipulación del DOM_

[INDICE]


## 1. jQuery

### 1.1. Qué es jQuery

**jQuery** es una **biblioteca de JavaScript** que simplifica la forma de trabajar con páginas web.

Permite realizar tareas comunes como:

* manipular elementos HTML
* cambiar estilos CSS
* responder a eventos del usuario
* realizar peticiones AJAX

Todo esto usando **menos código que JavaScript puro**.

Ejemplo:

```javascript
$("#titulo").hide();
```

El lema de jQuery es:

```
Write less, do more
(escribe menos, haz más)
```

### 1.2 Enlaces de interés

* [https://jquery.com/](https://jquery.com/)
* [https://es.wikipedia.org/wiki/JQuery](https://es.wikipedia.org/wiki/JQuery)
* https://www.w3schools.com/jquery/default.asp


### 1.3. ¿Por qué usar jQuery?

jQuery fue creado para **simplificar el desarrollo web**.

Sus principales ventajas son:

**Menos código**

Ejemplo en JavaScript:

```javascript
document.getElementById("txtName")
```

Con jQuery:

```javascript
$("#txtName")
```


**Manipulación simple del DOM**

Permite modificar elementos HTML de forma sencilla.

Ejemplos:

```javascript
$("#titulo").text("Nuevo título")
$("#imagen").hide()
```


**AJAX simplificado**

jQuery permite realizar peticiones al servidor sin recargar la página.

Ejemplo:

```javascript
$.ajax({
    url: "datos.json",
    success: function(data){
        console.log(data)
    }
})
```


**Multinavegador**

jQuery fue diseñado para funcionar correctamente en **distintos navegadores**.


### 1.4. Cuándo usar jQuery

Aunque hoy muchas funcionalidades pueden hacerse con **JavaScript moderno**, jQuery sigue siendo útil cuando:

* se trabaja con proyectos antiguos
* se necesita manipulación rápida del DOM
* se usan plugins basados en jQuery
* se trabaja con Bootstrap antiguo


















## 2. Cómo instalar jQuery

### 2.1. Cómo obtener jQuery

Se puede agregar jQuery a una página web de varias formas.













**Descargar la librería**

Desde el sitio oficial:

```
https://jquery.com
```

Luego incluir el archivo en el HTML:

```html
<script src="jquery.min.js"></script>
```


**Usar CDN (recomendado)**

```html
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
```









## 3. DOM y jQuery

### 3.1 DOM y jQuery

El **DOM (Document Object Model)** representa la estructura de una página HTML como un árbol de elementos.

jQuery facilita manipular estos elementos.

Ejemplo:

```javascript
$("#titulo").css("color","red")
```


### 3.2 Manipulación de elementos

Algunos métodos comunes de jQuery para trabajar con el DOM:




**Cambiar contenido**

```javascript
$("#titulo").html("Nuevo contenido")
```


**Obtener texto**

```javascript
$("#titulo").text()
```


**Cambiar atributos**

```javascript
$("#imagen").attr("src","foto.jpg")
```


**Obtener o cambiar valor**

```javascript
$("#nombre").val()
```


**Agregar elementos**

```javascript
$("#lista").append("<li>Nuevo elemento</li>")
```


**Insertar al inicio**

```javascript
$("#lista").prepend("<li>Inicio</li>")
```


**Eliminar elementos**

```javascript
$("#elemento").remove()
```














## 4. Eventos en jQuery

### 4.1. Eventos en jQuery

Los **eventos** permiten ejecutar código cuando ocurre una acción del usuario.

Ejemplos:

* click
* change
* focus
* blur

Ejemplo:

```javascript
$("#boton").click(function(){
    alert("Botón presionado")
})
```


### 4.2. Método .on()

El método `.on()` permite asignar eventos de forma flexible.

```javascript
$("#boton").on("click", function(){
    console.log("Click detectado")
})
```


### 4.3. Ejecutar un evento una sola vez

Para ejecutar una función solo una vez:

```javascript
$("#boton").one("click", function(){
    console.log("Solo una vez")
})
```


### 4.4. Desvincular eventos

Para eliminar un evento asociado:

```javascript
$("#boton").off("click")
```









## 5. Ecosistema jQuery



### 5.1. Plugins en jQuery

Un **plugin** es un complemento que extiende las funciones de una librería.

Permite agregar nuevas funcionalidades sin modificar el código principal.

Ejemplos:

* sliders
* galerías
* tablas dinámicas
* efectos visuales


### 5.2. Bootstrap y jQuery

Versiones antiguas de **Bootstrap** dependen de jQuery para que funcionen componentes como:

* modales
* dropdowns
* tooltips
* tabs

Ejemplo de inclusión:

```html
<script src="jquery.js"></script>
<script src="bootstrap.js"></script>
```


### 5.3. Ejemplos de plugins populares

Algunos plugins usados junto a Bootstrap:

- **DataTables**: Permite crear tablas con búsqueda, paginación, ordenamiento

- **Bootpag**: Plugin para paginación de contenido.

- **Tocify**: Genera automáticamente una **tabla de contenidos** basada en los encabezados de la página.

- **TabDrop**: Oculta pestañas cuando no caben en pantalla.

- **Flippant.js**: Permite **voltear elementos** con animaciones CSS.

