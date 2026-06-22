<br>
<br>

css
::before    // Antes del contenido
::after     // Después del contenido 


### ::before → Antes del contenido

```html id="shwl5v"
<h1 class="titulo">
  Vue
</h1>
```

```css id="8k4t88"
.titulo::before {
  content: "⭐ ";
}
```

Resultado visual:

```text id="lujlwm"
⭐ Vue
```

---

### ::after → Después del contenido

```html id="f8v63r"
<h1 class="titulo">
  Vue
</h1>
```

```css id="v4z4wf"
.titulo::after {
  content: " 🚀";
}
```

Resultado visual:

```text id="w0zz17"
Vue 🚀
```

---

### Ejemplo usando ambos

```html id="v86bq3"
<h1 class="titulo">
  Vue
</h1>
```

```css id="h2sjdf"
.titulo::before {
  content: "⭐ ";
}

.titulo::after {
  content: " 🚀";
}
```

Resultado visual:

```text id="u1t4a9"
⭐ Vue 🚀
```

---

## Chuleta visual

```text id="vz6m11"
::before
    ↓
⭐

[ CONTENIDO ]

🚀
    ↑
::after
```

---

## Equivalencia mental con JS

```css id="i4y2t7"
::before
```

≈

```js id="36k6e4"
prepend()
```

---

```css id="elx15n"
::after
```

≈

```js id="zsmql6"
append()
```

---

### Resumen

```css id="4g4gtg"
::before    /* Antes del contenido */

::after     /* Después del contenido */
```

👉 Crean contenido visual sin modificar el HTML. 🚀
















































js
append()          // Agrega al final
prepend()         // Agrega al inicio
before()          // Inserta antes del elemento
after()           // Inserta después del elemento


### append() → Agrega al final

```html
<div id="contenedor">
  <p>Uno</p>
</div>
```

```js
const h1 = document.createElement("h1");
h1.textContent = "Dos";

contenedor.append(h1);
```

Resultado:

```html
<div id="contenedor">
  <p>Uno</p>
  <h1>Dos</h1>
</div>
```

---

### prepend() → Agrega al inicio

```html
<div id="contenedor">
  <p>Uno</p>
</div>
```

```js
const h1 = document.createElement("h1");
h1.textContent = "Dos";

contenedor.prepend(h1);
```

Resultado:

```html
<div id="contenedor">
  <h1>Dos</h1>
  <p>Uno</p>
</div>
```

---

### before() → Inserta antes del elemento

```html
<p id="parrafo">Hola</p>
```

```js
const h1 = document.createElement("h1");
h1.textContent = "Título";

parrafo.before(h1);
```

Resultado:

```html
<h1>Título</h1>

<p id="parrafo">Hola</p>
```

---

### after() → Inserta después del elemento

```html
<p id="parrafo">Hola</p>
```

```js
const h1 = document.createElement("h1");
h1.textContent = "Título";

parrafo.after(h1);
```

Resultado:
```html
<p id="parrafo">Hola</p>

<h1>Título</h1>
```

    insertBefore()    // Inserta antes de un nodo hijo específico
    replaceWith()     // Reemplaza un elemento
    replaceChild()    // Reemplaza un hijo
    remove()          // Elimina el elemento
    removeChild()     // Elimina un hijo
    appendChild()     // Agrega un hijo al final
    insertAdjacentHTML() // Inserta HTML en una posición
    insertAdjacentElement() // Inserta un elemento en una posición
    insertAdjacentText() // Inserta texto en una posición




