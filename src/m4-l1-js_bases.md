# JS Bases
_Fundamentos del lenguaje JavaScript_

[INDICE]








## 1. JavaScript

### 1.1. Qué es JavaScript

JavaScript es un **lenguaje de programación utilizado para crear interactividad en páginas web**.

Fue creado originalmente para ejecutarse dentro del **navegador web**, permitiendo que las páginas HTML fueran más dinámicas.

Ejemplos de lo que permite hacer:

- responder a acciones del usuario
- validar formularios
- modificar contenido de la página
- crear animaciones
- comunicar el frontend con servidores

Hoy JavaScript también se puede usar **fuera del navegador**, por ejemplo con **Node.js**.







### 1.2. JavaScript y el navegador

El desarrollo de JavaScript está muy ligado al desarrollo de la web.

Su objetivo inicial fue:
**Agregar dinamismo e interactividad a los documentos HTML**


Cuando JavaScript se ejecuta en el navegador puede interactuar con varias APIs del entorno.

Principales elementos:

```
DOM
Eventos
Temporizadores
```

Estos permiten modificar la página y reaccionar a acciones del usuario.


















## 2. Entornos de ejecución de JavaScript

Actualmente existen **dos grandes entornos donde se ejecuta JavaScript**.

### 2.1 Navegador

Es el entorno original: El código se ejecuta dentro del navegador del usuario.

Navegadores (Browser):
- Chrome
- Firefox
- Edge
- Safari

Permite interactuar con:
- DOM
- Eventos
- Interfaces web




### 2.2 Sistema operativo (Node.js)

JavaScript también puede ejecutarse directamente en el sistema operativo mediante **Node.js**.

Esto permite crear:
- servidores web
- APIs
- herramientas de desarrollo
- aplicaciones backend









## 3. Herramientas del navegador (DevTools)

Los navegadores modernos incluyen herramientas llamadas **Developer Tools (DevTools)**.

Estas herramientas permiten:
- inspeccionar HTML
- modificar CSS
- depurar JavaScript
- analizar rendimiento
- revisar errores







### 4.1. Cómo abrir DevTools

- Google Chrome: Más herramientas → Herramientas del desarrollador
- Firefox: Herramientas → Alternar herramientas del desarrollador web

(También se puede abrir con: F12)







### 3.2. Inspector del DOM

El **inspector** permite explorar la estructura HTML de una página.

- Para usarlo:
    - Click derecho sobre un elemento → Inspeccionar

<br>

- Desde el inspector se puede:
    - ver la estructura HTML
    - modificar atributos
    - editar contenido
    - analizar estilos aplicados

Los cambios realizados en el inspector **solo son locales** y no afectan la página real.








### 3.3. Editor de CSS

Dentro de DevTools también existe un editor para modificar CSS en tiempo real.

Permite:

- probar estilos
- cambiar colores
- modificar tamaños
- revisar el box model

Estos cambios también **solo se aplican localmente en el navegador**.







### 3.4. Consola de JavaScript

La **consola** es una herramienta muy útil para ejecutar código JavaScript directamente en el navegador.

Ejemplo:

```javascript
console.log("Hola mundo")
```

La consola permite:

* probar código rápidamente
* ver mensajes del sistema
* detectar errores
* analizar valores de variables






### 3.5. Depurador de JavaScript

El **debugger** permite analizar cómo se ejecuta el código JavaScript.

Funciones principales:

- ver valores de variables
- detener ejecución con breakpoints
- seguir paso a paso el código
- identificar errores

Esto ayuda a encontrar problemas en el código.









## 4. Desarrollar con JavaScript

### 4.1. Herramientas para desarrollar JavaScript

Para escribir código JavaScript se utiliza un editor de código.

En este curso se utiliza: **Visual Studio Code**

VS Code permite:
- escribir código
- instalar extensiones
- depurar programas
- trabajar con Git
- ejecutar proyectos web






