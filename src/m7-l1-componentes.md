## Componentes

--- 

## Indíce

- []()



--- 

## 


• Componentes y su ciclo de vida en Vue 
• Componentización 
• Reutilización de componentes y Modularización 
• Jerarquía de componentes 


• Paso de datos a un componente mediante Props
• Enviar mensajes al componente padre 
• Emitir eventos a componente padre 


• Distribución de contenido en Slots 


• Componentes dinámicos 


• Ciclo de vida de un componente 
• Cuándo usar los hooks 
• Tipos de hooks y su función 



• Aplicar estilo a un componente 
• Usando la etiqueta style 
• Class binding 
• Style binding






















## Componentes

En vez de hacer una página gigante: App.vue(1000 líneas)

La dividimos en: App.vue, Navbar.vue, Sidebar.vue, ProductCard.vue, Footer.vue

- **Componente**: Pieza de interfaz.
- **Componentización**: dividir una aplicación en componentes: orden, reutilizable, mantención, de probar
- **Reutilización de Componentes** Un mismo componente puede utilizarse muchas veces.
- **Modularización**:  Separar responsabilidades, cada componente hace una sola cosa.
- **Jerarquía de Componentes**: Vue funciona como un árbol.

```text
App.vue
│
├── Navbar.vue
│
├── Home.vue
│   │
│   ├── ProductList.vue
│   │
│   └── ProductCard.vue
│
└── Footer.vue
```

























## Props

Enviar datos desde el **padre al hijo**.



Padre:

```vue
<script setup>
import Hijo from "./Hijo.vue";
</script>

<template>
  <Hijo nombre="Marta" edad="25" />
  <Hijo nombre="Carolina" edad="28" />
</template>
```


Hijo:

```vue
<script setup>
const props = defineProps({
  nombre: String,
  edad: Number
});
</script>

<template>
  <div>
    <p>Nombre: {{ props.nombre }}</p>
    <p>Edad: {{ props.edad }}</p>
  </div>
</template>
```











## defineEmits

Enviar datos desde el **Hijo al Padre**.

Hijo:

```vue
<script setup>
const emit = defineEmits([
  'saludar'
]);

const enviar = () => {
  emit('saludar');
};

</script>

<template>
  <button @click="enviar">
    Saludar
  </button>
</template>
```



Padre:

```vue
<script setup>
import MiBoton from "./Hijo2.vue";

const recibirSaludo = (valor) => {
  alert("Hola " + valor + ", desde el hijo");
};
</script>

<template>
  <MiBoton @saludar="recibirSaludo" />
</template>

<style scoped>
</style>
```
























## Slots

Permiten insertar contenido dentro de un componente.

Principal:

```vue
<script setup>
  import Card from './components/Card.vue'
</script>

<template>
  <Card>
    <h2>Título</h2>
    <p>Contenido</p>
  </Card>
</template>
```

Component:

```vue
<template>
  <div class="card">
      <slot />
      <p>Card</p>
      <slot />
  </div>
</template>

<style scoped>
.card {
  border: 1px solid #888;
  padding: 10px;
}
</style>
```










## Slots con Nombre

Principal:

```vue
<Card>

  <template #header>
    Header
  </template>

  Contenido

  <template #footer>
    Footer
  </template>

</Card>
```


Componente:

```vue
<slot name="header" />

<slot />

<slot name="footer" />
```




























## Slots con BaseLayouts

Pagina:

```vue
<script setup>
import BaseLayout from "./BaseLayout.vue";
</script>

<template>
        <BaseLayout>

        <template #header>
            <h1>Inicio...</h1>
        </template>

        Bienvenido

        <template #footer>
            © 2026
        </template>

        </BaseLayout>
</template>

<style scoped>

</style>
```


BaseLayout:

```vue
<template>

  <div class="container">

    <header class="header">
      <slot name="header"></slot>
    </header>

    <main class="main">
      <slot></slot>
    </main>

    <footer class="footer">
      <slot name="footer"></slot>
    </footer>

  </div>

</template>

<style scoped>
.header {
  background-color: #7fbb9c;
  padding: 10px;
}

.main{
  padding: 10px;
  background-color: #8ddde6;
}

.footer{
  padding: 10px;
  background-color: #c5789c;
}

</style>
```



































# Componentes Dinámicos

Permiten cambiar componentes en tiempo real.

```vue
<script setup>
import CompA from './components/CompA.vue';

const activeComp = CompA;

</script>

<template>
  <component :is="activeComp"></component>
</template>
```
















# Componentes Dinámicos con evento Click


```vue
<script setup>
import { ref } from 'vue';

import CompA from './components/CompA.vue';
import CompB from './components/CompB.vue';

const activeComp = ref(CompA);

const mostrarA = () => {
  activeComp.value = CompA;
};

const mostrarB = () => {
  activeComp.value = CompB;
};
</script>

<template>
  <button @click="mostrarA">
    Mostrar A
  </button>

  <button @click="mostrarB">
    Mostrar B
  </button>

  <component :is="activeComp" />
</template>
```




















# Componentes Dinámicos con evento Click toggle


```vue
<script setup>
import { ref } from 'vue';

import CompA from './components/CompA.vue';
import CompB from './components/CompB.vue';

const vista = ref('A');
const activeComp = ref(CompA);

const toggleComp = () => {

  if (vista.value === 'A') {

    vista.value = 'B';
    activeComp.value = CompB;

  } else {

    vista.value = 'A';
    activeComp.value = CompA;

  }

  console.log(vista.value);

};
</script>

<template>

  <button @click="toggleComp">
    Cambiar componente
  </button>

  <p>Vista actual: {{ vista }}</p>

  <component :is="activeComp" />

</template>
```































# Ciclo de Vida de un Componente

Cada componente pasa por etapas.

```text
Creación
↓
Montaje
↓
Actualización
↓
Destrucción
```

---

# Hooks más usados y Orden del ciclo de vida
// Antes de que el componente aparezca
onBeforeMount()
↓

// Cuando el componente ya está visible
onMounted()
↓

// Antes de actualizar la vista
onBeforeUpdate()
↓

// Después de actualizar la vista
onUpdated()
↓

// Antes de eliminar el componente
onBeforeUnmount()
↓

// Después de eliminar el componente
onUnmounted()















































## Ciclo de vida

vue
onBeforeMount()    // Antes de mostrar
onMounted()        // Después de mostrar

onBeforeUpdate()   // Antes de actualizar
onUpdated()        // Después de actualizar

onBeforeUnmount()  // Antes de destruir
onUnmounted()      // Después de destruir





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







---

# onBeforeMount()

Antes de mostrar el HTML.

```vue
<script setup>
import { onBeforeMount } from "vue";

onBeforeMount(() => {
  console.log("Antes de mostrar");
});


</script>

<template>
  <h1>Hola Vue</h1>
</template>
```

Consola:

```text
Antes de mostrar
```

---

# onMounted()

Después de mostrar el HTML.

```vue
<script setup>
import { onMounted } from "vue";

onMounted(() => {
  console.log("Ya aparecí");
});
</script>

<template>
  <h1>Hola Vue</h1>
</template>
```

Consola:

```text
Ya aparecí
```

---

# onBeforeUpdate()

Antes de actualizar la vista.

```vue
<script setup>
import {
  ref,
  onBeforeUpdate
} from "vue";

const contador = ref(0);

onBeforeUpdate(() => {
  console.log("Voy a actualizar");
});
</script>

<template>
  <h2>{{ contador }}</h2>

  <button @click="contador++">
    Sumar
  </button>
</template>
```

Click:

```text
Voy a actualizar
```

---

# onUpdated()

Después de actualizar.

```vue
<script setup>
import {
  ref,
  onUpdated
} from "vue";

const contador = ref(0);

onUpdated(() => {
  console.log("Actualizado");
});
</script>

<template>
  <h2>{{ contador }}</h2>

  <button @click="contador++">
    Sumar
  </button>
</template>
```

Click:

```text
Actualizado
```

---

# onBeforeUnmount()

Antes de eliminar el componente.

### App.vue

```vue
<script setup>
import { ref } from "vue";
import Hijo from "./components/Hijo.vue";

const mostrar = ref(true);
</script>

<template>
  <button @click="mostrar = !mostrar">
    Mostrar/Ocultar
  </button>

  <Hijo v-if="mostrar" />
</template>
```

### Hijo.vue

```vue
<script setup>
import { onBeforeUnmount } from "vue";

onBeforeUnmount(() => {
  console.log("Me van a eliminar");
});

</script>

<template>
  <h2>Componente Hijo</h2>
</template>
```

Al ocultarlo:

```text
Me van a eliminar
```

---

# onUnmounted()

Después de eliminarlo.

### Hijo.vue

```vue
<script setup>
import { onUnmounted } from "vue";

onUnmounted(() => {
  console.log("Ya fui eliminado");
});
</script>

<template>
  <h2>Componente Hijo</h2>
</template>
```

Al ocultarlo:

```text
Ya fui eliminado
```

---

# Ejemplo completo para ver el orden

```vue
<script setup>
import {
  ref,
  onBeforeMount,
  onMounted,
  onBeforeUpdate,
  onUpdated
} from "vue";

const contador = ref(0);

onBeforeMount(() => {
  console.log("1 Antes de mostrar");
});

onMounted(() => {
  console.log("2 Ya aparecí");
});

onBeforeUpdate(() => {
  console.log("3 Voy a actualizar");
});

onUpdated(() => {
  console.log("4 Actualizado");
});
</script>

<template>
  <h2>{{ contador }}</h2>

  <button @click="contador++">
    Sumar
  </button>
</template>
```

Al cargar:

```text
1 Antes de mostrar
2 Ya aparecí
```

Al hacer click:

```text
3 Voy a actualizar
4 Actualizado
```

Esa demo suele ser la mejor para entender visualmente el ciclo de vida de un componente Vue. 🚀
























# Estilos en Componentes

## Style normal

```vue
<style>
h1 {
  color: red;
}
</style>
```

Afecta toda la aplicación.

---

## Style Scoped

```vue
<style scoped>
h1 {
  color: red;
}
</style>
```

Afecta sólo al componente.

---

# Class Binding

Permite agregar clases dinámicamente.

```vue
<div
  :class="{ activo: estado }"
>
</div>
```

Si:

```js
estado = true
```

Resultado:

```html
<div class="activo"></div>
```

---

# Varias clases

```vue
<div
  :class="[
    'card',
    activo ? 'ok' : 'error'
  ]"
>
</div>
```

---

# Style Binding

Permite agregar estilos dinámicos.

```vue
<div
  :style="{
    color: 'red'
  }"
>
</div>
```

---

Ejemplo reactivo:

```vue
<script setup>
import { ref } from 'vue';

const color = ref('blue');
</script>

<template>

  <div
    :style="{
      color: color
    }"
  >
    Hola
  </div>

</template>
```

---

# Resumen para entrevista

## Comunicación

```text
Props
PADRE → HIJO

Emits
HIJO → PADRE
```

## Reutilización

```text
Componentes pequeños
Responsabilidad única
```

## Hooks más usados

```js
onMounted()
onUpdated()
onUnmounted()
```

## Estilos dinámicos

```vue
:class

:style
```

## Componentes dinámicos

```vue
<component :is="Component" />
```

Si dominas **Props, Emits, Slots, onMounted, class binding y componentes dinámicos**, ya cubres aproximadamente el 80% de las preguntas típicas de Vue 3 en bootcamps y entrevistas junior. 😎
























Perfecto, siguiendo la misma lógica de `::before` y `::after`, pero ahora con **casos prácticos de Vue**.

```js id="xg1t3u"
onBeforeMount()    // Antes de mostrar
// Preparar datos
// Revisar configuraciones
// Debugging

onMounted()        // Después de mostrar
// Consumir API
// Leer LocalStorage
// Inicializar gráficos
// Inicializar mapas

onBeforeUpdate()   // Antes de actualizar
// Guardar valor anterior
// Comparar cambios
// Debugging

onUpdated()        // Después de actualizar
// Recalcular tamaños
// Actualizar plugins externos
// Saber cuándo terminó el render

onBeforeUnmount()  // Antes de destruir
// Guardar cambios pendientes
// Confirmar salida

onUnmounted()      // Después de destruir
// Limpiar intervalos
// Limpiar eventos
// Cerrar WebSockets
```

---

### Ejemplos típicos

```js id="a7r8k2"
onMounted()
```

👉 Cargar productos

```js
onMounted(async () => {
  const res = await fetch("/api/productos");
});
```

---

```js id="b9m4q1"
onMounted()
```

👉 Leer LocalStorage

```js
onMounted(() => {
  usuario.value =
    localStorage.getItem("usuario");
});
```

---

```js id="c5n7w3"
onUnmounted()
```

👉 Limpiar un timer

```js
onUnmounted(() => {
  clearInterval(timer);
});
```

---

### Chuleta rápida

```js id="d2p6e8"
onBeforeMount()    // Voy a aparecer

onMounted()        // Ya aparecí
                    // Cargar datos

onBeforeUpdate()   // Voy a actualizarme

onUpdated()        // Ya me actualicé

onBeforeUnmount()  // Me van a eliminar

onUnmounted()      // Ya me eliminaron
                    // Limpiar recursos
```

### Lo que más usarás

```text id="f4k9r2"
onMounted()
↓
Cargar información

onUnmounted()
↓
Limpiar información

Los otros hooks
↓
Casos más específicos
```

De hecho, en una SPA Vue típica:

```text id="g8m3t5"
Entrar a la página
↓
onMounted()

Salir de la página
↓
onUnmounted()
```

y esos dos cubren la mayoría de los casos reales. 🚀













## onBeforeMount()

Preparar datos antes de mostrar el componente.

```vue
<script setup>
import { ref, onBeforeMount } from "vue";

const mensaje = ref("");

onBeforeMount(() => {
  mensaje.value = "Cargando aplicación...";
});
</script>

<template>
  <h2>{{ mensaje }}</h2>
</template>
```

---

## onMounted()

Consumir una API cuando el componente ya está en pantalla.

```vue
<script setup>
import { ref, onMounted } from "vue";

const pokemon = ref(null);

onMounted(async () => {
  const res = await fetch(
    "https://pokeapi.co/api/v2/pokemon/pikachu"
  );

  pokemon.value = await res.json();
});
</script>

<template>
  <h2 v-if="pokemon">
    {{ pokemon.name }}
  </h2>
</template>
```

---

## onBeforeUpdate()

Guardar el valor anterior antes de actualizar.

```vue
<script setup>
import { ref, onBeforeUpdate } from "vue";

const contador = ref(0);

onBeforeUpdate(() => {
  console.log(
    "Valor antes de actualizar:",
    contador.value
  );
});
</script>

<template>
  <h2>{{ contador }}</h2>

  <button @click="contador++">
    Incrementar
  </button>
</template>
```

---

## onUpdated()

Saber cuándo terminó el render.

```vue
<script setup>
import { ref, onUpdated } from "vue";

const contador = ref(0);

onUpdated(() => {
  console.log("DOM actualizado");
});
</script>

<template>
  <h2>{{ contador }}</h2>

  <button @click="contador++">
    Incrementar
  </button>
</template>
```

---

## onBeforeUnmount()

Guardar cambios antes de salir.

```vue
<script setup>
import { onBeforeUnmount } from "vue";

onBeforeUnmount(() => {
  localStorage.setItem(
    "borrador",
    "Texto pendiente"
  );
});
</script>

<template>
  <h2>Editor de texto</h2>
</template>
```

---

## onUnmounted()

Limpiar un intervalo al destruir el componente.

```vue
<script setup>
import {
  onMounted,
  onUnmounted
} from "vue";

let intervalo;

onMounted(() => {
  intervalo = setInterval(() => {
    console.log("tick");
  }, 1000);
});

onUnmounted(() => {
  clearInterval(intervalo);

  console.log("Intervalo eliminado");
});
</script>

<template>
  <h2>Reloj</h2>
</template>
```




































