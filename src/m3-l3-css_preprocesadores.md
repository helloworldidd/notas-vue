# CSS Preprocesadores
_Herramientas que extienden CSS para escribir estilos más organizados y reutilizables_

[INDICE]

---

## 1. Preprocesador CSS

### 1.1. Qué es un preprocesador CSS

Un **preprocesador CSS** es una herramienta que permite **escribir estilos con funcionalidades adicionales que no existen en CSS puro**.

El código del preprocesador se **compila a CSS estándar**, que es el único formato que entiende el navegador.

Flujo de trabajo:

```
Sass / Less / Stylus
↓
compilación
↓
CSS
↓
navegador
```

Los preprocesadores agregan características como:

* variables
* nesting (anidación)
* mixins
* funciones
* modularización de archivos

Esto permite escribir **CSS más organizado, reutilizable y escalable**.







### 1.2. Preprocesadores más conocidos

Algunos preprocesadores CSS son:

| Preprocesador                          | Característica                    |
| ----------------------------------------- | --------------------------------- |
|  <img src="http://helloworldidd.github.io/sourceinvaders/assets/source/brands/sass-original.svg" width="40px"> | [Sass](https://sass-lang.com/)              | sintaxis simple                   |
|  <img src="http://helloworldidd.github.io/sourceinvaders/assets/source/brands/less-plain-wordmark.svg" width="40px"> | [Less](https://lesscss.org/)              | sintaxis simple                   |
|  <img src="http://helloworldidd.github.io/sourceinvaders/assets/source/brands/stylus-original.svg" width="40px"> | [Stylus](https://stylus-lang.com/)              | sintaxis simple                   |
|  <img src="http://helloworldidd.github.io/sourceinvaders/assets/source/brands/postcss-icon.svg" width="40px"> | [PostCSS](https://postcss.org/)           | sistema moderno basado en plugins |

Hoy en día **Sass (SCSS)** es el más utilizado en desarrollo frontend.








## 3. Sass

### 3.1. Qué es Sass

**[Sass / SCSS](https://sass-lang.com/) (Syntactically Awesome Style Sheets)** es un **preprocesador CSS**.

Permite escribir estilos de forma más organizada y luego **compilar ese código a CSS estándar**.

Sass agrega características que **no existen en CSS puro**, como:

* variables
* anidación de selectores
* mixins
* funciones
* estructuras de control





### 3.2. Ventajas de usar Sass

- *Mejor organización* : Permite dividir los estilos en **archivos pequeños y modulares**.
- Reduce la repetición de código: Se pueden reutilizar **variables y mixins**.
- Permite lógica de programación, se pueden usar:
    * variables
    * funciones
    * bucles
    * condicionales
- Compilación automática: Sass puede **vigilar cambios en los archivos y generar CSS automáticamente**.






### 3.3 Sintaxis de Sass

Existen dos sintaxis:

| Sintaxis             | Extensión |
| -------------------- | --------- |
| Sass (indentada)     | `.sass`   |
| SCSS (similar a CSS) | `.scss`   |

La más utilizada actualmente es **SCSS**.






### 3.4 Instalación de Sass

#### Instalación de Sass

Para usar Sass primero es necesario tener instalado **[Node.js](https://nodejs.org/es/download)**, ya que Sass se instala mediante **npm (Node Package Manager)**.

- Instalar Sass de forma global: `npm install -g sass`

- Verificar instalación: `sass --version`

- Compilar un archivo Sass: Para convertir un archivo `.scss` a CSS: `sass estilo.scss estilo.css`

- Modo vigilancia: el CSS se actualizará automáticamente. `sass --watch estilo.scss estilo.css`














#### Uso de Sass en VS Code

VS Code tiene soporte para `.scss`.

También se pueden usar extensiones como:

```
SCSS IntelliSense
```

Esto permite:

* autocompletado
* sugerencias de variables
* navegación entre archivos


















### 3.5 Arquitectura de proyectos con Sass

#### Patrón 7-1

El **patrón 7-1** es una forma común de organizar proyectos Sass.

Consiste en **7 carpetas y 1 archivo principal**.

```
sass/
│
├── abstracts (o utilities)
├── base
├── components
├── layout
├── pages (o views)
├── themes
├── vendors
│
└── main.scss
```

- **abstracts** (o utilities)
  * variables
  * mixins
  * funciones
  * placeholders
  
- **base** Define estilos base del proyecto.
  * reset
  * tipografías

- **components**: Componentes reutilizables.
  - buttons
  - cards
  - forms

- **layout**: Estructura general de la página.
  - header
  - footer
  - grid
  - sidebar

- **pages** (o views). Estilos específicos de páginas.
  - home
  - contact
  - dashboard

- **themes** Estilos para distintos temas.
  - dark
  - light

- **vendors** Librerías externas.
  - bootstrap
  - normalize


#### Buenas prácticas Sass

Algunas reglas comunes:

* usar **2 espacios** en lugar de tab
* mantener líneas cortas
* usar comillas simples
* evitar unidades en valores `0`

Ejemplo correcto:

```
margin: 0;
padding: 10px;
```

























### 3.6 Elementos de SASS


#### Variables
Las **variables** permiten reutilizar valores.

Ejemplo:

```scss
$primary-color: blue;

.button{
  background: $primary-color;
}
```

Ventajas:

* evita repetir valores
* facilita cambios globales



#### Scope de variables

Las variables pueden tener **alcance local o global**.

```scss
$color: red;

.card{
  $color: blue;
  color: $color;
}
```

El valor dentro del selector **solo afecta ese bloque**.



#### Mixins

Los **mixins** permiten reutilizar bloques de CSS.

```scss
@mixin center {
  display:flex;
  justify-content:center;
  align-items:center;
}
```

Uso:

```scss
.box{
  @include center;
}
```



#### Mixins con parámetros

Los mixins pueden recibir argumentos.

```scss
@mixin size($w,$h){
  width:$w;
  height:$h;
}

.box{
  @include size(200px,100px);
}
```



#### Partials

Sass permite dividir el código en **archivos parciales**.

Los partials comienzan con `_`.

Ejemplo:

```
_variables.scss
_buttons.scss
_layout.scss
```



#### Importar archivos

Sass permite usar otros archivos con:

```scss
@use "variables";
```

Antes se utilizaba:

```scss
@import
```

Pero **@use es el método recomendado actualmente**.



#### Nesting

Sass permite **anidar selectores**.

```scss
nav{

  ul{
    list-style:none;
  }

  a{
    color:black;
  }

}
```

CSS generado:

```css
nav ul{}
nav a{}
```

Esto facilita entender la **jerarquía de estilos**.













### 3.7. Flujo de trabajo con Sass

Proceso típico:

```
escribir Sass
↓
compilar a CSS
↓
usar CSS en la web
```

El navegador **solo entiende CSS**, no Sass.



