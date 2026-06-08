# Eventos y Modificadores


--- 

## Indíce

- []()
<style>*{scroll-behavior: smooth}</style>



--- 

## 



Los eventos permiten reaccionar a acciones del usuario como clics, escritura en inputs, movimientos del mouse o envío de formularios.


---

## Índice

- Estructura básica
- Eventos básicos
    - Click
    - Doble Click
    - Mouse Enter
    - Mouse Leave
    - Mouse Over
    - Mouse Out
    - Wheel
- Eventos de formularios
    - Input
    - Change
    - Focus
    - Blur
    - Submit
- Eventos de teclado
    - Keydown
    - Keyup
    - Enter
    - ESC
    - TAB
    - SPACE
    - DELETE
    - Flechas
- Teclas modificadoras
    - CTRL
    - SHIFT
    - ALT
    - META
- Combinaciones de teclas
    - CTRL + K
    - CTRL + ENTER
    - SHIFT + ENTER
    - ALT + ENTER
    - CTRL + SHIFT + K
- Modificadores de eventos
    - .prevent
    - .stop
    - .once
    - .capture
    - .self
    - .passive
- Eventos especiales del mouse
    - Click izquierdo
    - Click derecho
    - Click rueda del mouse
    - Context Menu
- Resumen rápido
    - Eventos más usados
    - Teclas más usadas
    - Modificadores más usados
    - Mouse




---

## Estructura básica

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


---

## Eventos básicos

### Click

```vue
<button @click="mostrarAlerta">
  Click
</button>
```



### Doble Click

```vue
<button @dblclick="mostrarAlerta">
  Doble Click
</button>
```



### Mouse Enter

Cuando el cursor entra al elemento.

```vue
<div @mouseenter="mostrarAlerta">
  Hover
</div>
```



### Mouse Leave

Cuando el cursor sale.

```vue
<div @mouseleave="mostrarAlerta">
  Salir
</div>
```



### Mouse Over

Se activa al entrar sobre el elemento o alguno de sus hijos.

```vue
<div @mouseover="mostrarAlerta">
  Entrar
</div>
```



### Mouse Out

Se activa al salir del elemento o alguno de sus hijos.

```vue
<div @mouseout="mostrarAlerta">
  Salir
</div>
```



### Wheel

Detecta la rueda del mouse.

```vue
<div @wheel="mostrarAlerta">
  Scroll
</div>
```


---

## Eventos de formularios

### Input

Se ejecuta mientras escribes.

```vue
<input @input="mostrarAlerta" />
```



### Change

Se ejecuta cuando el valor cambia y el input pierde foco.

```vue
<input @change="mostrarAlerta"/>
```



### Focus

Cuando el input recibe foco.

```vue
<input @focus="mostrarAlerta"/>
```



### Blur

Cuando el input pierde foco.

```vue
<input @blur="mostrarAlerta"/>
```



### Submit

Cuando se envía un formulario.

```vue
<form @submit="mostrarAlerta">
  <button>Enviar</button>
</form>
```


---

## Eventos de teclado

### Keydown

Cuando una tecla se presiona.

```vue
<input @keydown="mostrarAlerta"/>
```



### Keyup

Cuando una tecla se suelta.

```vue
<input @keyup="mostrarAlerta"/>
```



### Enter

```vue
<input @keyup.enter="mostrarAlerta"/>
```



### ESC

```vue
<input @keydown.esc="mostrarAlerta"/>
```



### TAB

```vue
<input @keydown.tab="mostrarAlerta"/>
```



### SPACE

```vue
<input @keydown.space="mostrarAlerta"/>
```



### DELETE

```vue
<input @keydown.delete="mostrarAlerta"/>
```



### Flechas

```vue
<input @keydown.up="accion"/>
<input @keydown.down="accion"/>
<input @keydown.left="accion"/>
<input @keydown.right="accion"/>
```










---

## Teclas modificadoras

### CTRL

```vue
<input @keydown.ctrl="accion"/>
```



### SHIFT

```vue
<input @keydown.shift="accion"/>
```



### ALT

```vue
<input @keydown.alt="accion"/>
```



### META

Windows = tecla Windows

Mac = Command

```vue
<input @keydown.meta="accion"/>
```









---

## Combinaciones de teclas

### CTRL + K

```vue
<input @keydown.ctrl.k="accion"/>
```



### CTRL + ENTER

```vue
<input @keydown.ctrl.enter="accion"/>
```



### SHIFT + ENTER

```vue
<input @keydown.shift.enter="accion"/>
```



### ALT + ENTER

```vue
<input @keydown.alt.enter="accion"/>
```



### CTRL + SHIFT + K

```vue
<input @keydown.ctrl.shift.k="accion"/>
```


---

## Modificadores de eventos

Los modificadores alteran el comportamiento normal de un evento.



### .prevent

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



### .stop

Evita que el evento siga propagándose.

```vue
<button @click.stop="accion">
  Click
</button>
```



### .once

Se ejecuta solo una vez.

```vue
<button @click.once="accion">
  Solo una vez
</button>
```



### .capture

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



### .self

Solo se ejecuta si haces click directamente en el elemento.

```vue
<div @click.self="accion">
</div>
```



### .passive

Mejora rendimiento en eventos de scroll.

```vue
<div @scroll.passive="accion">
</div>
```

















---

## Eventos especiales del mouse

### Click izquierdo

```vue
<button @click.left="accion">
</button>
```



### Click derecho

```vue
<button @click.right.prevent="accion">
</button>
```



### Click rueda del mouse

```vue
<button @click.middle="accion">
</button>
```



### Context Menu

Click derecho.

```vue
<div @contextmenu.prevent="accion">
  Click derecho
</div>
```


---

## Resumen rápido

### Eventos más usados

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

### Teclas más usadas

```js
.enter
.esc
.tab
.space
.delete
```

### Modificadores más usados

```js
.prevent
.stop
.once
.capture
.self
.passive
```

### Mouse

```js
@click.left
@click.right
@click.middle
@wheel
@mouseenter
@mouseleave
```
