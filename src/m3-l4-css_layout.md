# CSS Layout
_Modelo de Cajas_

[INDICE]



## 1. Modelo de cajas

### 1.1. ¿Qué es el modelo de cajas?

En CSS, cada elemento de una página web se representa como **una caja rectangular**.

El navegador utiliza el **modelo de cajas (Box Model)** para calcular:

- el tamaño del elemento
- el espacio que ocupa
- la separación con otros elementos
- su distribución dentro del documento

Cada caja está compuesta por cuatro áreas principales:

```css
margin
border
padding
content
```

Estas áreas determinan **cómo se ve y cuánto espacio ocupa un elemento en la página**.



### 1.2. Partes del modelo de cajas

#### Content (contenido)

Es el **contenido real del elemento**.

Puede ser, por ejemplo:

* texto
* imágenes
* videos
* otros elementos HTML

El tamaño del contenido se puede definir con propiedades como:

```css
width
height
```



#### Padding (relleno)

Es el **espacio interno entre el contenido y el borde**.

Propiedades:

```css
padding-top
padding-right
padding-bottom
padding-left
```

Forma abreviada:

```css
padding: 20px;
```



#### Border (borde)

Es el borde que rodea al contenido y al padding del elemento.

Ejemplo:

```css
border: 1px solid black;
```



#### Margin (margen)

Es el **espacio externo entre un elemento y los elementos que lo rodean**.

Propiedades:

```css
margin-top
margin-right
margin-bottom
margin-left
```

Forma abreviada:

```css
margin: 20px;
```



### 1.3. Elementos de bloque vs elementos en línea

En HTML, los elementos no se comportan todos igual.
Dos comportamientos básicos son los **elementos de bloque** y los **elementos en línea**.

#### Elementos de bloque

Características:

* ocupan todo el ancho disponible por defecto
* generan un salto de línea
* normalmente aceptan `width` y `height`

Ejemplos:

```html
<div>
<p>
<h1>
<section>
```



#### Elementos en línea

Características:

* no generan salto de línea
* ocupan solo el espacio necesario
* normalmente `width` y `height` no se aplican de forma directa

Ejemplos:

```html
<span>
<a>
<strong>
<em>
```



### 1.4. Relación con el layout

Aunque el **modelo de cajas** es la base para entender cómo ocupan espacio los elementos, hoy existen sistemas modernos para construir layouts más complejos.

Los más importantes son:

* **Flexbox**
* **CSS Grid**

Estas herramientas permiten organizar elementos de forma más eficiente y crear **interfaces responsivas con mayor facilidad**.













## 2. Display

La propiedad `display` define **cómo se comporta un elemento dentro del layout de la página**.

Determina:

- si el elemento genera salto de línea
- cómo ocupa espacio
- cómo se relaciona con otros elementos
- qué tipo de sistema de layout utiliza

Ejemplos de valores comunes:

```css
display: block;
display: inline;
display: inline-block;
display: flex;
display: grid;
```



### 2.1 block

Los elementos con `display: block`:

* ocupan **todo el ancho disponible**
* generan **salto de línea**
* aceptan `width` y `height`

Ejemplo:

```css
display: block;
```

Elementos HTML que usan este comportamiento por defecto:

```html
<div>
<p>
<section>
<h1>
```



### 2.2 inline

Los elementos con `display: inline`:

* **no generan salto de línea**
* ocupan **solo el espacio necesario**
* normalmente **no aceptan width ni height**

Ejemplo:

```css
display: inline;
```

Elementos comunes:

```html
<span>
<a>
<strong>
<em>
```



### 2.3 inline-block

`inline-block` combina características de `inline` y `block`.

Características:

* no genera salto de línea
* permite usar `width` y `height`
* mantiene comportamiento en línea

Ejemplo:

```css
display: inline-block;
```



### 2.4 none

El valor `none` **oculta completamente el elemento**.

* el elemento desaparece del layout
* no ocupa espacio en la página

Ejemplo:

```css
display: none;
```



### 2.5 visibility: hidden

A diferencia de `display: none`, el elemento **se vuelve invisible pero sigue ocupando espacio**.

Ejemplo:

```css
visibility: hidden;
```



### 2.6 flex

`display: flex` activa el sistema de layout **Flexbox**.

El elemento se convierte en un **contenedor flex**, y sus hijos pasan a ser **elementos flexibles**.

Ejemplo:

```css
display: flex;
```

Flexbox permite:

* alinear elementos
* distribuir espacio
* crear layouts responsivos



### 2.7 grid

`display: grid` activa el sistema de layout **CSS Grid**.

Permite organizar elementos en **filas y columnas**.

Ejemplo:

```css
display: grid;
```

Grid es muy útil para construir **layouts complejos de página**.








































## 3. Posicionamiento

La propiedad `position` permite controlar **cómo se ubican los elementos dentro de la página**.

```css
position: valor;
```

Los valores más comunes son:

* static
* relative
* absolute
* fixed
* sticky

Cada uno define **cómo se posiciona un elemento respecto al flujo del documento o al contenedor**.



### 3.1 static

Es el posicionamiento **por defecto**.

El elemento sigue el **flujo normal del documento**.

```css
position: static;
```

En este modo, las propiedades `top`, `left`, `right` y `bottom` **no tienen efecto**.



### 3.2 relative

Permite mover un elemento **respecto a su posición original**.

El elemento **sigue ocupando su espacio original en el layout**.

```css
position: relative;
top: 10px;
left: 20px;
```

Se usa mucho para **definir el contenedor de elementos absolute**.



### 3.3 absolute

Posiciona el elemento **respecto a su contenedor posicionado más cercano**.

Un contenedor posicionado es un elemento que tenga:

```
position: relative
position: absolute
position: fixed
position: sticky
```

Ejemplo:

```css
position: absolute;
top: 0;
left: 0;
```

El elemento **sale del flujo normal del documento**.



### 3.4 fixed

El elemento queda **fijo respecto a la ventana del navegador (viewport)**.

No se mueve al hacer scroll.

Ejemplos típicos:

* menús fijos
* botones flotantes
* barras de navegación

```css
position: fixed;
```



### 3.5 sticky

Combina comportamiento **relative y fixed**.

El elemento se comporta como `relative` hasta que alcanza una posición definida en el scroll.

Ejemplo:

```css
position: sticky;
top: 0;
```

Se usa mucho en:

* encabezados
* menús que se quedan pegados al hacer scroll



### 3.6 float

`float` no pertenece a `position`, pero históricamente se utilizó para organizar elementos en la página.

```css
float: left;
float: right;
```

Antiguamente se usaba para construir layouts, pero hoy ha sido reemplazado en gran parte por:

* **Flexbox**
* **CSS Grid**









## 4. Layout

Un **layout** define cómo se organizan los elementos dentro de una página web.

Determina aspectos como:

- la distribución del contenido
- la estructura visual
- la jerarquía de la información

Un buen layout mejora:

- la legibilidad
- la navegación
- la experiencia de usuario

Existen diferentes formas de construir layouts.



### 4.1 Layout fijo

Tiene un **ancho definido en píxeles**.

```css
width: 1200px;
```

Características:

* el tamaño del layout no cambia
* puede generar **scroll horizontal** en pantallas pequeñas

Fue muy usado en los primeros sitios web.



### 4.2 Layout fluido

Utiliza **unidades relativas como porcentajes**.

```css
width: 100%;
```

Características:

* el contenido se adapta al ancho de la pantalla
* es más flexible que el layout fijo



### 4.3 Layout elástico

Utiliza **unidades relativas basadas en el tamaño de fuente**, como:

```css
em
rem
```

Esto permite que el layout **se adapte al tamaño del texto y a la configuración del usuario**.



### 4.4 Layout absoluto

Los elementos se posicionan manualmente usando `position`.

```css
position: absolute;
```

Características:

* los elementos salen del flujo normal del documento
* requiere controlar posiciones manualmente

Este enfoque se utiliza **mucho menos en diseño moderno**, ya que hoy se prefieren sistemas de layout como **Flexbox y CSS Grid**.











## 5. Inspeccionar elementos en el navegador

Los navegadores modernos incluyen herramientas de desarrollo llamadas **Developer Tools**, que permiten analizar y modificar una página web en tiempo real.

Estas herramientas son fundamentales para **desarrolladores Front-End**, ya que permiten inspeccionar el HTML, el CSS y el comportamiento de los elementos en la página.

### 5.1 Cómo abrir el inspector

Existen varias formas de abrirlo:

**Click derecho → Inspeccionar**

También se puede abrir con la tecla:

```
F12
```


### 5.2 Qué permite hacer el inspector

El inspector permite:

- ver la estructura **HTML**
- ver los **estilos CSS aplicados**
- analizar el **modelo de cajas (Box Model)**
- identificar **márgenes, bordes y padding**
- modificar estilos **en tiempo real**

Esto permite **experimentar y entender cómo se comportan los elementos dentro del layout**.






















