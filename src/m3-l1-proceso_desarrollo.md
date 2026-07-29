# Proceso Desarrollo
_Etapas para diseñar y construir interfaces digitales_

[INDICE]



## 1. Introducción al desarrollo de interfaces




### 1.1. Desarrollo de un producto digital

El **desarrollo de un producto digital** consiste en diseñar y construir experiencias de usuario basadas en software.

Estas experiencias buscan **mejorar la interacción de los usuarios con una organización o servicio digital**.

Generalmente se utilizan **metodologías ágiles**, que permiten:

* desarrollar productos rápidamente
* probar soluciones
* iterar en base al feedback de los usuarios


### 1.2 Beneficios de un proceso estructurado

* mejor experiencia de usuario
* mayor escalabilidad
* mejora continua del producto
* adaptación a nuevas necesidades






## 2. Etapas del desarrollo de un producto digital



### 2.1 Desarrollo de un producto digital

El desarrollo de un producto digital suele seguir un **proceso estructurado**.

Aunque cada proyecto es distinto, normalmente incluye las siguientes etapas:

1. identificación de necesidades del mercado  
2. investigación de la competencia  
3. ideación de soluciones  
4. definición de una hoja de ruta del producto (product roadmap)  
5. desarrollo de un **MVP (Minimum Viable Product)**  
6. lanzamiento del producto  

Este proceso permite **reducir riesgos y validar ideas antes de invertir demasiado tiempo o recursos en el desarrollo**.

En el contexto del desarrollo web, este proceso conecta distintas áreas como **producto, diseño y desarrollo**.



### 2.2 Diseño del producto

Durante la fase de diseño se crean **representaciones visuales del producto** antes de comenzar a programar.

Estas representaciones pueden ser:

- wireframes  
- mockups  
- prototipos  

El objetivo es **definir cómo se verá y cómo funcionará la interfaz** antes de escribir código.

En esta etapa se definen aspectos como:

- la estructura de la interfaz  
- la navegación  
- los componentes visuales  
- la experiencia de usuario (UX)

Este diseño servirá como **base de trabajo para el desarrollo Front-End**.



### 2.3 Implementación del producto digital

Una vez finalizada la etapa de diseño, comienza la **implementación del producto**.

En esta etapa participan principalmente dos roles:

1. Diseñador UX/UI  
2. Desarrollador Front-End  

El diseñador UX/UI define la **experiencia de usuario y el diseño visual de la interfaz**, mientras que el desarrollador Front-End **transforma ese diseño en una interfaz funcional utilizando tecnologías como HTML, CSS y JavaScript**.

El desarrollador Front-End se encarga de:

- construir la estructura de la interfaz  
- aplicar estilos visuales  
- implementar interacciones  
- asegurar que la interfaz sea **responsiva y accesible**









## 3. Roles en el desarrollo de Interfaces

### 3.1. Rol del diseñador UX/UI

El **diseñador UX (User Experience)** se enfoca en la experiencia del usuario.

Sus tareas incluyen:

* investigación de usuarios
* definición de flujos
* estructura de navegación
* wireframes
* prototipos

El **diseñador UI (User Interface)** se enfoca en la parte visual.

Sus responsabilidades incluyen:

* diseño visual de interfaces
* tipografías
* colores
* iconografía
* componentes visuales





### 3.2. Rol del Front-End Developer

El **Front-End Developer** es el encargado de convertir el diseño en código.

Trabaja con tecnologías como:

* HTML
* CSS
* JavaScript

Su objetivo es construir **la interfaz que ve el usuario en el navegador**.

También debe garantizar:

* accesibilidad
* rendimiento
* compatibilidad entre navegadores
* diseño responsive






















## 4. Diseño de interfaces

### 4.1. Importancia de las guías de estilo

Las **guías de estilo** ayudan a mantener consistencia visual en un proyecto.

Definen reglas sobre:

* colores
* tipografías
* espaciados
* componentes visuales
* iconografía
* estilos de botones y formularios

Ejemplo de guía de estilo conocida:


Material Design
[https://m3.material.io/](https://m3.material.io/)





### 4.2. Componentes de una interfaz

Una interfaz se puede entender en tres niveles:



#### Significado

Contenido e información que se muestra al usuario.

Ejemplos:

* textos
* formularios
* botones
* menús



#### Comportamiento

Cómo responde la interfaz cuando el usuario interactúa.

Ejemplos:

* validación de formularios
* animaciones
* navegación




#### Aspecto

Apariencia visual del sistema.

Incluye:

* colores
* tipografía
* layout
* espaciados

Las **guías de estilo se centran principalmente en este aspecto**.









### 5. Organización del CSS

### 5.1. Organización del CSS

En proyectos grandes, el CSS puede crecer rápidamente y volverse difícil de mantener.

Problemas comunes:

* repetición de estilos
* reglas poco claras
* conflictos entre estilos

Por esto se utilizan **metodologías para organizar CSS**.



### 5.2. Ventajas de usar metodologías CSS

Utilizar una metodología permite:

* mayor claridad en el código
* estilos reutilizables
* mejor organización
* menor duplicación de código
* mantenimiento más sencillo

También facilita trabajar en **equipos grandes**.



### 5.3. Metodologías CSS más utilizadas


Para mantener el CSS **ordenado, reutilizable y escalable**, se utilizan metodologías que ayudan a estructurar el código en proyectos grandes.

Las más utilizadas son:

* **BEM**
* **OOCSS**
* **SMACSS**

Cada una propone una forma distinta de **organizar el CSS y construir interfaces**.


En proyectos reales muchas veces se combinan:

```
BEM → nombra clases
OOCSS → reutiliza estilos
SMACSS → organiza carpetas
```

Esto permite construir **interfaces más ordenadas y fáciles de mantener**.










## 6 Metodologías CSS

### 6.1 BEM

- **BEM (Block Element Modifier)** es una metodología para **nombrar clases CSS de forma estructurada**.
- BEM se enfoca principalmente en **cómo nombrar las clases**.
- Permite crear componentes claros y evitar conflictos entre estilos.

#### 6.1.1 Convenciones de nombres

```
bloque
bloque__elemento
bloque--modificador
```

#### 6.1.2 Uso en CSS

```css
.button {}
.button__icon {}
.button--primary {}
```

#### 6.1.3 Uso en HTML

```html
<button class="button button--primary">
  <span class="button__icon">⭐</span>
  Comprar
</button>
```

#### 6.1.4 Organización del proyecto

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










### 6.2. OOCSS

- **OOCSS (Object Oriented CSS)** aplica principios de **programación orientada a objetos al CSS** para crear estilos reutilizables.
- Se basa en dos ideas:
    * separar **estructura y apariencia**
    * separar **contenedor y contenido**
- OOCSS se enfoca en **reutilizar estilos y evitar duplicación de código**.

#### 6.2.1 Convenciones de nombres

```
objeto
objeto-modificado
```


#### 6.2.2 Uso en CSS

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

#### 6.2.3 Uso en HTML

```html
<div class="box box-light">
  Contenido
</div>
```

#### 6.2.4 Organización del proyecto

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








### 6.3 SMACSS

- **SMACSS (Scalable and Modular Architecture for CSS)** propone **organizar el CSS por categorías** dentro del proyecto.
- SMACSS se enfoca principalmente en **la organización del proyecto CSS**.
- Categorías principales:
    - Base
    - Layout
    - Module
    - State
    - Theme



#### 6.3.1 Convenciones de nombres

```
etiqueta        --> base
.l-contenedor   --> layout
.modulo         --> modules
.is-estado      --> states
.theme-nombre   --> theme
```



#### 6.3.2 Uso en CSS

```css
/* base */
body {}
h1 {}

/* layout */
.l-container {}
.l-header {}

/* modules */
.title {}
.btn {}
.card {}

/* states */
.is-active {}

/* theme */
.theme-dark {}
```

#### 6.3.3 Uso en HTML

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

#### 6.3.4 Organización del proyecto

```
css/
   base/
      reset.css
      typography.css

   layout/
      container.css
      header.css

   modules/
      btn.css
      title.css

   state/
      states.css

   theme/
      dark.css

   main.css
```



















## 7. Preprocesadores CSS





### 7.1 Preprocesadores CSS

Un **preprocesador CSS** permite escribir CSS con funcionalidades adicionales.

Por ejemplo:

* variables
* mixins
* estructuras de control
* selectores anidados

Luego el preprocesador genera **CSS estándar**.




### 7.2. Ventajas de los preprocesadores

Usar un preprocesador permite:

* organizar mejor los estilos
* reutilizar código
* escribir CSS más limpio
* reducir tiempo de desarrollo
* generar CSS optimizado

También permite usar **modo watch**, que recompila automáticamente el CSS cuando se realizan cambios.



### 7.3. Preprocesadores más utilizados

Los dos preprocesadores más populares son:

- SASS
- LESS


Ambos extienden CSS y facilitan el desarrollo de hojas de estilo complejas.



### 7.4. Sass

**Sass** es uno de los preprocesadores más utilizados.

Ventajas:

* soporte avanzado para CSS3
* variables
* mixins
* bucles
* condicionales
* generación automática de CSS optimizado

Desventajas:

* sintaxis más compleja
* curva de aprendizaje mayor



### 7.5. Less

**Less** es otro preprocesador popular.

Ventajas:

* sintaxis más simple
* fácil de aprender
* buena documentación

