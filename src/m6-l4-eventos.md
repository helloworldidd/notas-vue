# Eventos y Modificadores

Events y modifiers


--- 

## Índice

- [Estructura básica](#estructura-basica)
- [Eventos básicos](#eventos-básicos)
    - Click
    - Doble Click
    - Mouse Enter
    - Mouse Leave
    - Mouse Over
    - Mouse Out
    - Wheel
- [Eventos de formularios](#eventos-de-formularios)
    - Input
    - Change
    - Focus
    - Blur
    - Submit
- [Eventos de teclado](#eventos-de-teclado)
    - Keydown
    - Keyup
    - Enter
    - ESC
    - TAB
    - SPACE
    - DELETE
    - Flechas
- [Teclas modificadoras](#teclas-modificadoras)
    - CTRL
    - SHIFT
    - ALT
    - META
- [Combinaciones de teclas](#combinaciones-de-teclas)
    - CTRL + K
    - CTRL + ENTER
    - SHIFT + ENTER
    - ALT + ENTER
    - CTRL + SHIFT + K
- [Modificadores de eventos](#modificadores-de-eventos)
    - .prevent
    - .stop
    - .once
    - .capture
    - .self
    - .passive
- [Eventos especiales del mouse](#eventos-especiales-del-mouse)
    - Click izquierdo
    - Click derecho
    - Click rueda del mouse
    - Context Menu
- [Resumen rápido](#resumen-rápido)
    - Eventos más usados
    - Teclas más usadas
    - Modificadores más usados
    - Mouse



<br>
<br>
<br>
<br>
<br>
<br>

---

## Estructura básica

Los eventos permiten reaccionar a acciones del usuario como clics, escritura en inputs, movimientos del mouse o envío de formularios.


Forma larga:

```vue
<button v-on:click="mostrarAlerta">
  Click
</button>
```

Forma abreviada:

```vue
<button @click="mostrarAlerta">
  Click
</button>
```

```js
const mostrarAlerta = () => {
  alert('Hola');
};
```














<br>
<br>
<br>
<br>
<br>
<br>

---

## Eventos básicos

<br>
<br>

**Click**
```vue
<button @click="mostrarAlerta">
  Click
</button>
```



<br>
<br>

**Doble Click**
```vue
<button @dblclick="mostrarAlerta">
  Doble Click
</button>
```



<br>
<br>

**Mouse Enter**
Cuando el cursor entra al elemento.

```vue
<div @mouseenter="mostrarAlerta">
  Hover
</div>
```



<br>
<br>

**Mouse Leave**
Cuando el cursor sale.

```vue
<div @mouseleave="mostrarAlerta">
  Salir
</div>
```



<br>
<br>

**Mouse Over**
Se activa al entrar sobre el elemento o alguno de sus hijos.

```vue
<div @mouseover="mostrarAlerta">
  Entrar
</div>
```



<br>
<br>

**Mouse Out**
Se activa al salir del elemento o alguno de sus hijos.

```vue
<div @mouseout="mostrarAlerta">
  Salir
</div>
```



<br>
<br>

**Wheel**
Detecta la rueda del mouse.

```vue
<div @wheel="mostrarAlerta">
  Scroll
</div>
```



<br>
<br>
<br>
<br>
<br>
<br>

---

## Eventos de formularios



<br>
<br>

**Input**
Se ejecuta mientras escribes.

```vue
<input @input="mostrarAlerta" />
```


<br>
<br>

**Change**
Se ejecuta cuando el valor cambia y el input pierde foco.

```vue
<input @change="mostrarAlerta"/>
```


<br>
<br>

**Focus**
Cuando el input recibe foco.

```vue
<input @focus="mostrarAlerta"/>
```


<br>
<br>

**Blur**
Cuando el input pierde foco.

```vue
<input @blur="mostrarAlerta"/>
```


<br>
<br>

**Submit**
Cuando se envía un formulario.

```vue
<form @submit="mostrarAlerta">
  <button>Enviar</button>
</form>
```










<br>
<br>
<br>
<br>
<br>
<br>

---

## Eventos de teclado

<br>
<br>

**Keydown**

Cuando una tecla se presiona.

```vue
<input @keydown="mostrarAlerta"/>
```



<br>
<br>

**Keyup**
Cuando una tecla se suelta.

```vue
<input @keyup="mostrarAlerta"/>
```



<br>
<br>

**Enter**

```vue
<input @keyup.enter="mostrarAlerta"/>
```



<br>
<br>

**ESC**

```vue
<input @keydown.esc="mostrarAlerta"/>
```



<br>
<br>

**TAB**

```vue
<input @keydown.tab="mostrarAlerta"/>
```



<br>
<br>

**SPACE**

```vue
<input @keydown.space="mostrarAlerta"/>
```



<br>
<br>

**DELETE**

```vue
<input @keydown.delete="mostrarAlerta"/>
```



<br>
<br>

**Flechas**

```vue
<input @keydown.up="accion"/>
<input @keydown.down="accion"/>
<input @keydown.left="accion"/>
<input @keydown.right="accion"/>
```



















<br>
<br>
<br>
<br>
<br>
<br>

---

## Teclas modificadoras

<br>
<br>

**CTRL**

```vue
<input @keydown.ctrl="accion"/>
```



<br>
<br>

**SHIFT**

```vue
<input @keydown.shift="accion"/>
```



<br>
<br>

**ALT**

```vue
<input @keydown.alt="accion"/>
```



<br>
<br>

**META**
Windows = tecla Windows
Mac = Command

```vue
<input @keydown.meta="accion"/>
```





















<br>
<br>
<br>
<br>
<br>
<br>

---

## Combinaciones de teclas

<br>
<br>

**CTRL + K**

```vue
<input @keydown.ctrl.k="accion"/>
```



<br>
<br>

**CTRL + ENTER**

```vue
<input @keydown.ctrl.enter="accion"/>
```



<br>
<br>

**SHIFT + ENTER**

```vue
<input @keydown.shift.enter="accion"/>
```



<br>
<br>

**ALT + ENTER**

```vue
<input @keydown.alt.enter="accion"/>
```



<br>
<br>

**CTRL + SHIFT + K**

```vue
<input @keydown.ctrl.shift.k="accion"/>
```



























<br>
<br>
<br>
<br>
<br>
<br>

---

## Modificadores de eventos

Los modificadores alteran el comportamiento normal de un evento.



<br>
<br>

**.prevent**

Evita el comportamiento por defecto.

Muy usado en formularios.

```vue
<form @submit.prevent="guardar">
</form>
```

Equivale a:

```js
event.preventDefault();
```



<br>
<br>

**.stop**

Evita que el evento siga propagándose.

```vue
<button @click.stop="accion">
  Click
</button>
```



<br>
<br>

**.once**

Se ejecuta solo una vez.

```vue
<button @click.once="accion">
  Solo una vez
</button>
```



<br>
<br>

**.capture**

Captura el evento antes de que llegue a los hijos.

```vue
<div @click.capture="padre">
  <button @click="hijo">
    Click
  </button>
</div>
```

Orden:

```text
CAPTURE
BOTON
```



<br>
<br>

**.self**

Solo se ejecuta si haces click directamente en el elemento.

```vue
<div @click.self="accion">
</div>
```



<br>
<br>

**.passive**

Mejora rendimiento en eventos de scroll.

```vue
<div @scroll.passive="accion">
</div>
```
















<br>
<br>
<br>
<br>
<br>
<br>

---

## Eventos especiales del mouse

<br>
<br>

**Click izquierdo**

```vue
<button @click.left="accion">
</button>
```



<br>
<br>

**Click derecho**

```vue
<button @click.right.prevent="accion">
</button>
```



<br>
<br>

**Click rueda del mouse**

```vue
<button @click.middle="accion">
</button>
```



<br>
<br>

**Context Menu**

Click derecho.

```vue
<div @contextmenu.prevent="accion">
  Click derecho
</div>
```


























<br>
<br>
<br>
<br>
<br>
<br>


---

## Resumen rápido

<br>
<br>

**Eventos más usados**

```js
@click
@input
@change
@focus
@blur
@submit
@keydown
@keyup
```

<br>
<br>

**Teclas más usadas**

```js
.enter
.esc
.tab
.space
.delete
```

<br>
<br>

**Modificadores más usados**

```js
.prevent
.stop
.once
.capture
.self
.passive
```

<br>
<br>

**Mouse**

```js
@click.left
@click.right
@click.middle
@wheel
@mouseenter
@mouseleave
```
