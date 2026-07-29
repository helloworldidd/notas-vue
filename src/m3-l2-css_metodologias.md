# CSS Metodologías
_Estrategias para organizar y estructurar el código CSS (BEM, OOCSS, SMACSS)_

[INDICE]

---

## 1. Organización del CSS

### 1.1. Organización del CSS

Cuando los proyectos web comienzan a crecer, el CSS puede volverse difícil de mantener.

Problemas comunes:

* repetición de estilos
* conflictos entre reglas
* dificultad para entender el código
* hojas de estilo muy largas
* dificultad para trabajar en equipo

Cuando un proyecto tiene **muchas páginas, componentes o desarrolladores**, el CSS puede volverse caótico si no existe una estructura clara.

Para solucionar estos problemas existen **metodologías de organización CSS**.

Estas metodologías ayudan a:

* mantener el código ordenado
* reutilizar estilos
* mejorar la escalabilidad
* evitar conflictos entre estilos
* facilitar el trabajo en equipo






## 2. Metodologías de organización CSS

### 2.1. Metodologías de organización CSS

Las metodologías CSS son **guías o convenciones** que ayudan a organizar el código de estilos en proyectos web.

No son librerías ni frameworks.

Son **formas de estructurar y escribir CSS** para que sea más fácil de mantener y escalar.

Las metodologías más utilizadas son:

* **BEM**
* **OOCSS**
* **SMACSS**

Cada una aborda el problema desde un enfoque diferente.


Estas metodologías buscan crear **interfaces modulares y reutilizables**, permitiendo que el CSS crezca de forma ordenada en proyectos grandes.








## 3. BEM

- Antes de escribir CSS en proyectos grandes, es importante mantener una **forma clara y consistente de nombrar las clases**.
- Cuando el proyecto crece, los nombres de las clases pueden volverse confusos y generar conflictos entre estilos.
- **BEM** es una metodología que resuelve este problema creando **una convención estructurada para nombrar clases CSS**.

### 3.1 Significado

| Tipo     | Descripción              |
| -------- | ------------------------ |
| Block    | Componente independiente |
| Element  | Parte interna del bloque |
| Modifier | Variación o estado       |


Cada clase describe **una parte específica de un componente**.


### 3.2 Ventajas

* estructura clara y organizada
* clases fáciles de entender
* evita conflictos entre estilos
* facilita el mantenimiento del CSS
* permite crear componentes reutilizables
* escala bien en proyectos grandes
* muy utilizado en proyectos y frameworks modernos

### 3.3 Convenciones de nombres

| Tipo     | Ejemplo         |
| -------- | --------------- |
| Block    | button          |
| Element  | button__icon    |
| Modifier | button--primary |

Separadores utilizados:

```
__ elemento
-- modificador
```


### 3.4 Uso en CSS

```css
.button {
  padding:10px 20px;
}

.button__icon {
  margin-right:5px;
}

.button--primary {
  background:blue;
  color:white;
}
```



### 3.5 Uso en HTML

```html
<button class="button button--primary">
  <span class="button__icon">⭐</span>
  Comprar
</button>
```



### 3.6 Organización del proyecto

- BEM **no define una estructura de carpetas obligatoria**, ya que se enfoca principalmente en **cómo nombrar las clases**.
- Sin embargo, normalmente los proyectos organizan los estilos **por componentes o bloques**.




#### Organización de carpetas

```
css/
   base/
      reset.css
      typography.css
      
   blocks/
      button.css
      card.css
      navbar.css

   utilities/
      spacing.css
      text.css

   main.css
```


Ejemplo button.css

```css
.button {}
.button__icon {}
.button--primary {}
```


#### Organización de componentes

```
components/
   Button/
      Button.css
      Button.html
      Button.js
   Card/
      Card.css
      Card.html
      Card.js
```


























## 4. OOCSS

- A medida que los proyectos crecen, aparece otro problema común: **la repetición de estilos**.
- Varios componentes pueden compartir el mismo padding, bordes o estructura, pero el código se vuelve a escribir muchas veces.
- **OOCSS (Object Oriented CSS)** busca solucionar esto aplicando principios de **programación orientada a objetos al CSS**.
- La idea es construir estilos **reutilizables**, llamados **objetos**.
- Principios de OOCSS
    1. Separar estructura y apariencia
        - La **estructura** define la forma del componente.
        - La **apariencia** define el estilo visual.
    2. Separar contenedor y contenido
        - Los estilos no deben depender del lugar donde se usan.

- Esto permite reutilizar el estilo en cualquier parte.




### 4.1 Significado

- **OOCSS (Object Oriented CSS)** : programación orientada a objetos al CSS.


### 4.2 Ventajas

* promueve la reutilización de estilos
* reduce la duplicación de código
* facilita el mantenimiento del CSS
* permite crear interfaces modulares
* mejora la escalabilidad del proyecto
* fomenta el uso de estilos reutilizables

### 4.3 Convenciones de nombres

```
objeto
objeto-modificado
```

### 4.4 Uso en CSS

```css
.box {
  padding:20px;
  border-radius:8px;
}

.box-light {
  background:white;
}

.box-dark {
  background:black;
  color:white;
}
```


### 4.5 Uso en HTML


```html
<div class="box box-light"></div>
<div class="box box-dark"></div>
```


### 4.6 Organización del proyecto

OOCSS tampoco define una estructura obligatoria, pero normalmente se separan **objetos reutilizables y componentes visuales**.

```
css/
   base/
   objects/
   components/
   utilities/
```

Ejemplo:

```
css/
   base/
      reset.css
      typography.css

   objects/
      box.css
      media.css

   components/
      button.css
      card.css

   utilities/
      spacing.css
      text.css

   main.css
```

Los **objects** son estructuras reutilizables.

Los **components** agregan estilos visuales.



















## 5. SMACSS

- Cuando un proyecto crece mucho, el problema no solo es **cómo escribir las clases**, sino también **cómo organizar todos los archivos CSS del proyecto**.
- Una aplicación grande puede tener **decenas o cientos de archivos CSS**, por lo que se necesita una arquitectura clara.
- Categorías principales
    * **Base**
    * **Layout**
    * **Module**
    * **State**
    * **Theme**
    
    
### 5.1 Significado

**SMACSS (Scalable and Modular Architecture for CSS)** propone una forma de **organizar el CSS por categorías**.

Se enfoca principalmente en **la estructura del proyecto**.


### 5.2 Ventajas

* organiza el CSS por categorías claras
* facilita la estructura del proyecto
* mejora el mantenimiento del código
* permite escalar proyectos grandes
* separa responsabilidades en los estilos
* facilita el trabajo en equipo

### 5.3 Convenciones de nombres

```
etiqueta        --> base
.l-contenedor   --> layout
.modulo         --> modules
.is-estado      --> states
.theme-nombre   --> theme
```


### 5.4 Uso en CSS

**Base**: Define estilos básicos para etiquetas HTML.
```css
body {
  font-family:Arial;
}

h1 {
  font-size:32px;
}

p {
  line-height:1.5;
}
```


**Layout**: Define la estructura de la página.
```css
.l-container {
  max-width:1200px;
  margin:auto;
}

.l-header {
  display:position;
  background-color: #f07;
}
```


**Module**: Componentes reutilizables.
```css
.title {
  border:1px solid #ddd;
  padding:20px;
}

.btn {
  padding:10px 20px;
}
```


**State**: Estados de elementos.
```css
.is-active {
  background:blue;
}

.is-hidden {
  display:none;
}
```


**Theme**: Variaciones visuales del sitio.
```css
.theme-dark {
  background:black;
  color:white;
}

.theme-light {
  background:white;
  color:black;
}
```



### 5.5 Uso en HTML

```html
<body class="theme-dark">

  <div class="l-container">
    <header class="l-header">
      <h1 class="title">titulo</h1>
      <button class="btn is-active">login</button>
    </header>
  </div>
  <div>

<body>
```



### 5.6 Organización del proyecto

```
css/
   base/
      reset.css
      typography.css

   layout/
      grid.css
      container.css

   modules/
      button.css
      card.css
      navbar.css

   state/
      states.css

   theme/
      dark.css
      
   main.css
```













## 6. Importar hojas en `main.css`

En proyectos CSS organizados en múltiples archivos, se utiliza un archivo principal llamado **`main.css`** para **importar todas las hojas de estilo del proyecto**.

Esto permite **mantener el código ordenado y modular**, cargando solo un archivo en el HTML.

### 6.1 Uso de `@import`

Para importar otros archivos CSS se utiliza la regla:

```css
@import "ruta-del-archivo.css";
```

### 6.2 Ejemplo en `main.css`

```css
@import "base/reset.css";
@import "base/typography.css";

@import "layout/grid.css";

@import "components/button.css";
@import "components/card.css";

@import "utilities/text.css";
@import "utilities/spacing.css";
```

Cada línea importa un archivo CSS desde su carpeta correspondiente.

### 6.3 Estructura del proyecto

```
css/
   base/
      reset.css
      typography.css

   layout/
      grid.css

   components/
      button.css
      card.css

   utilities/
      text.css
      spacing.css

   main.css
```

### 6.4 Uso en HTML

En el HTML solo se carga el archivo principal:

```html
<link rel="stylesheet" href="css/main.css">
```

De esta forma **`main.css` se encarga de cargar todos los estilos del proyecto**.











