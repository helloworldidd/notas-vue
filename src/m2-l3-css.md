# CSS
_Estilos y diseño visual de las páginas web_

[INDICE]

## 1. CSS

### 1.1. Qué es

**CSS**

_Cascading Style Sheets_ es el lenguaje que se usa para **definir el diseño y la apariencia de una página web**.

Mientras **HTML estructura el contenido**, **CSS permite modificar cómo se ve ese contenido**, por ejemplo:

* colores
* tipografía
* tamaños
* márgenes
* fondos
* bordes

En CSS trabajamos principalmente con **propiedades**, que son instrucciones que le dicen al navegador **cómo debe mostrarse un elemento**.


### 1.2. Enlaces de interés
- [Descripción CSS **Wikipedia**](https://es.wikipedia.org/wiki/Hojas_de_estilo_en_cascada)  
- [Documentación CSS **W3Schools**](https://www.w3schools.com/css/)
- [Documentación CSS **MDN**](https://developer.mozilla.org/es/docs/Web/CSS)
- [Documentación CSS **Oficial**](https://www.w3.org/Style/CSS/specs.en.html)









## 2. Estructura CSS


### 2.1. Estructura básica de una regla CSS

```css
selector{
    propiedad: valor;
}
```

**Selector**
Indica a qué elemento HTML se aplicará el estilo.

**Propiedad**
La característica que queremos modificar (color, tamaño, margen, etc.).

**Valor**
El valor que tendrá esa propiedad.


- Ejemplo

```css
p{
    color: blue;
    font-size: 18px;
}
```

Cuando estilizas algo en CSS normalmente trabajas con:
```
texto
colores
tamaño
espacios
bordes
fondos
posición
```

Esos **7 tipos de propiedades** permiten crear casi cualquier diseño web.
Esto significa:

* Todos los **párrafos `p`** tendrán **color azul**
* El tamaño del texto será **18 píxeles**



### 2.2. Estructura hoja CSS3
```css
/* RESET / NORMALIZACIÓN */

*{
  margin:0;
  padding:0;
  box-sizing:border-box;
}


/* ESTILOS GENERALES */

body{
  font-family: Arial, sans-serif;
  background:#f4f4f4;
  color:#333;
}

h1, h2, h3{
  margin-bottom:10px;
}


/* LAYOUT (estructura) */

header{
  background:black;
  color:white;
  padding:20px;
}

main{
  width:80%;
  margin:auto;
}

footer{
  text-align:center;
  padding:10px;
}

/* COMPONENTES */

.button{
  background:blue;
  color:white;
  padding:10px 20px;
  border:none;
  border-radius:5px;
}

.card{
  background:white;
  padding:20px;
  border-radius:10px;
}


/* ESTADOS */

.button:hover{
  background:darkblue;
}


/* RESPONSIVE */

@media (max-width:768px){
  main{
    width:95%;
  }
}
```


### 2.3. Cómo aplicar estilos CSS

Existen **tres formas de aplicar CSS en HTML**:

- **Inline** → estilo directamente en la etiqueta HTML  
- **Interno** → estilos dentro de la etiqueta `<style>` en el `<head>`  
- **Externo** → estilos en un archivo `.css` separado

Ejemplo de CSS **externo** conectado al HTML:

```html
<link rel="stylesheet" href="assets/css/styles.css">
```

### 2.4. Nombres de selectores CSS

Existen **3 formas de seleccionar elementos en CSS**:

- **Etiquetas**
- **Clases**
- **ID**

Ejemplos de selectores:

<div class="tag-code">etiqueta</div>

```CSS
p { }
```

<div class="tag-code">clase</div>

```CSS
.menu { }
```

<div class="tag-code">id</div>

```CSS
#header { }
```

Reglas para nombrar clases:

- No usar espacios en los nombres
- Usar **minúsculas**
- Separar palabras con **guiones `-`**
- Los nombres deben describir la función del elemento

Ejemplos correctos:

```css
.header
.main-menu
.product-card
.footer-links
.navbar-item
```

Ejemplos incorrectos:

```css
.Header
main menu
productCard
footer Links
nav bar item
```

Ejemplo de uso en HTML:

```html
<div class="product-card">
  <h2 class="product-title">Producto</h2>
  <button class="buy-button">Comprar</button>
</div>
```














## 3. Elementos CSS

### 3.1. Tipografía (Fonts)

Controla cómo se ve el texto.

```css
font-family: Arial;
font-size: 16px;
font-weight: bold;
font-style: italic;
font-variant: small-caps;
```

Ejemplo:

```css
h1{
    font-family: Arial, sans-serif;
    font-size: 32px;
    font-weight: bold;
}
```

Valores comunes:

```css
font-weight: normal | bold | 100–900
font-style: normal | italic
```



### 3.2. Texto

Controla el formato del texto.

```css
color: red;
text-align: center;
text-decoration: underline;
text-transform: uppercase;
letter-spacing: 2px;
line-height: 1.6;
```

Ejemplo:

```css
p{
    color: #333;
    text-align: justify;
    line-height: 1.6;
}
```

Valores útiles:

```
text-align: left | center | right | justify
text-decoration: underline | none | line-through
text-transform: uppercase | lowercase | capitalize
```



### 3.3. Colores

CSS permite usar distintos formatos.

```css
color: red;
color: #ff0000;
color: rgb(255,0,0);
color: hsl(0,100%,50%);
```

Ejemplo:

```css
h2{
    color: #2563eb;
}
```



### 3.4. Tamaño de elementos

Controla el tamaño de las cajas.

```css
width: 300px;
height: 200px;
max-width: 100%;
min-height: 100px;
```

Ejemplo:

```css
div{
    width: 400px;
    height: 200px;
}
```



### 3.6. Background (fondos)
Permite definir fondos.

```css
background-color: lightblue;
background-image: url("imagen.jpg");
background-repeat: no-repeat;
background-position: center;
background-size: cover;
```

Ejemplo:

```css
body{
    background-color: #f5f5f5;
}
```



### 3.7. Bordes

Define bordes de elementos.

```css
border: 1px solid black;
border-width: 2px;
border-style: dashed;
border-color: red;
border-radius: 10px;
```

Ejemplo:

```css
div{
    border: 2px solid black;
    border-radius: 8px;
}
```

Valores comunes:

```
solid
dashed
dotted
double
```



### 3.8. Margin (espacio externo)
Separa elementos entre sí.

```css
margin:20px;
margin-top: 10px;
margin-right :20px;
margin-bottom: 10px;
margin-left: 20px;
```

Forma abreviada:

```css      
margin: 10px 20px 10px 20px;
```



### 3.9. Padding (espacio interno)

Separa el contenido del borde.

```css
padding: 20px;
padding-top: 10px;
padding-right: 20px;
padding-bottom: 10px;
padding-left: 20px;
```

Ejemplo:

```css
div{
    padding: 15px;
}
```



### 3.10. Display

Define cómo se comporta un elemento.

```css
display: block;
display: inline;
display: inline-block;
display: flex;
display: grid;
display: none;
```

Ejemplo:

```css
nav{
    display: flex;
}
```



### 3.11. Posicionamiento

Controla la posición del elemento.

```css
position: static;
position: relative;
position: absolute;
position: fixed;
position: sticky;
```

Ejemplo:

```css
div{
    position: relative;
    top: 10px;
    left: 20px;
}
```



### 3.12. Overflow

Controla contenido que se sale del contenedor.

```css
overflow: hidden;
overflow: auto;
overflow: scroll;
```



### 3.13. Listas

Controla el estilo de listas.

```css
list-style-type: square;
list-style-position: inside;
list-style-image: url(icono.png);
```

Valores comunes:

```
disc
circle
square
decimal
none
```



### 3.14. Sombras

Sombras para elementos.

```css
box-shadow: 2px 2px 10px rgba(0,0,0,0.3);
```

Sombras para texto:

```css
text-shadow: 1px 1px 2px black;
```



### 3.15. Transparencia

```css
opacity:0.5;
```

Valores:

```
0 → invisible
1 → visible
```



### 3.16. Cursor

Cambia el cursor del mouse.

```css
cursor: pointer;
cursor: default;
cursor: move;
```



### 3.17. Responsividad (Media Queries)

Permite cambiar estilos según el tamaño de pantalla.
Esto aplica estilos solo en pantallas pequeñas.


código base 
```css
@media (min-width: 980px) {

}

@media (max-width: 980px) {

}

@media (max-width: 768px) {

}

@media (max-width: 480px) {
    body{
        background-color:lightgray;
    }
}

```



### 3.18 Cambiar imageneres según ancho de pantalla
```html
<picture>
  <source srcset="./assets/img/demo-mobile.png" media="(max-width: 768px)">
  <source srcset="./assets/img/demo.png" media="(max-width: 1000px)">
  <img srcset="./assets/img/demo.png" alt="description" class="photo">
</picture>

<style>
  .photo{width: 600px;}

  @media (max-width: 768px) {
    .photo{width: 300px;}
  }
</style>
```

<div class="dev-view">resultado ⬇️</div>

<picture>
  <source srcset="./assets/img/demo-mobile.png" media="(max-width: 768px)">
  <source srcset="./assets/img/demo.png" media="(max-width: 1000px)">
  <img srcset="./assets/img/demo.png" alt="description" class="photo">
</picture>


<style>
  .photo{width: 600px;}

  @media (max-width: 768px) {
    .photo{width: 300px;}
  }
</style>















Perfecto, entonces lo dejamos **realmente enfocado en CSS** (no en HTML).
Te lo ordeno como **buenas prácticas reales de CSS** que se enseñan en desarrollo front-end.













## 4. Buenas prácticas CSS

### 4.1 Usar nombres de clases claros

Las clases deben describir **la función del elemento**, no su apariencia.

Mejor:

```css
.product-card
.main-menu
.footer-links
```

Evitar:

```css
.caja1
.rojo
.grande
```

Esto hace que el código sea **más entendible y mantenible**.




### 4.2 Mantener el CSS organizado

Ordenar las propiedades dentro de una regla ayuda a leer el código.

Un orden común es:

```
1. layout
2. box model
3. tipografía
4. visual
```

Ejemplo:

```css
.card {
  display: flex;
  width: 300px;

  padding: 20px;
  margin: 10px;

  font-size: 16px;
  text-align: center;

  background: white;
  border-radius: 8px;
}
```




### 4.3 Evitar selectores demasiado largos

Selectores muy largos hacen el CSS más difícil de mantener.

Evitar:

```css
header nav ul li a span {
  color: red;
}
```

Mejor:

```css
.nav-link {
  color: red;
}
```

Las **clases suelen ser la mejor forma de aplicar estilos**.




### 4.4 No abusar de `!important`

`!important` rompe la cascada natural del CSS.

Evitar:

```css
color: red !important;
```

Solo usarlo **en casos muy específicos**.



### 4.5 Reutilizar estilos

Si varios elementos comparten estilos, usar **clases reutilizables**.

Ejemplo:

```css
.btn {
  padding: 10px 20px;
  border-radius: 6px;
}

.btn-primary {
  background: blue;
  color: white;
}
```

Esto evita repetir código.



### 4.6 Mantener indentación y código limpio

Un CSS ordenado es más fácil de mantener.

Buenas prácticas:

* usar indentación
* dejar espacios entre bloques
* comentar secciones importantes

Ejemplo:

```css
/* BOTONES */

.btn {
  padding: 10px;
  border-radius: 5px;
}
```












## 5. Ejemplo Hoja de estilo CSS

### 5.1 Código

HTML

```html
<h1 id="titulo">Mi página</h1>
<p class="texto">Hola mundo</p>
```

CSS

```css
body{
    font-family: Arial;
    background-color: #f4f4f4;
}

#titulo{
    color: #2563eb;
    text-align: center;
}

.texto{
    font-size: 18px;
    line-height: 1.6;
    margin: 20px;
}
```


