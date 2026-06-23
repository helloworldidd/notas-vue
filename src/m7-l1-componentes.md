# Componentes

> Los componentes son la base de Vue. Permiten dividir una aplicación en piezas pequeñas, reutilizables e independientes, facilitando la organización, mantenimiento y escalabilidad del código.

<br>

---

## Índice

* [Componetización](#componetización)
* [Paso de Datos](#paso-de-datos)
  + [Props](#props)
  + [Emits](#emits)
* [Slots](#slots)
  + [Slots con Nombre](#slots-con-nombre)
  + [Slots con BaseLayouts](#slots-con-baselayouts)
* [Componentes Dinámicos](#componentes-dinámicos)
  + [Con evento Click](#con-evento-click)
  + [Con evento Click toggle](#con-evento-click-toggle)
* [Ciclo de Vida](#ciclo-de-vida)
  + [Ciclo de vida](#ciclo-de-vida)
  + [Hijo.vue](#hijovue)
* [Ejemplos Ciclo de vida](#ejemplos-ciclo-de-vida)
  + [Los más usados](#los-más-usados)
  + [Otros Casos](#otros-casos)
* [Aplicar Estilos](#aplicar-estilos)
  + [Style normal](#style-normal)
  + [Style Scoped](#style-scoped)
  + [Class Binding](#class-binding)
  + [Varias clases](#varias-clases)
  + [Style Binding](#style-binding)












<br>

---

## Componetización

> La componetización consiste en separar una interfaz grande en múltiples componentes con responsabilidades específicas. Esto permite reutilizar código, mejorar la legibilidad y simplificar el desarrollo.



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




















<br>
<br>
<br>
<br>
<br>
<br>


---

## Paso de Datos

> Los componentes suelen necesitar intercambiar información. Vue proporciona mecanismos para enviar datos desde un componente padre a uno hijo y para comunicar eventos desde el hijo hacia el padre.

<br>
<br>

### Props

> Las Props permiten enviar datos desde un componente padre hacia un componente hijo. Son la forma principal de configurar y personalizar componentes reutilizables.

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







<br>
<br>
<br>
<br>

### Emits

> Los Emits permiten que un componente hijo notifique eventos al componente padre. Se utilizan para comunicar acciones o cambios que ocurren dentro del componente hijo.

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


















<br>
<br>
<br>
<br>
<br>
<br>




---

## Slots

> Los Slots permiten insertar contenido personalizado dentro de un componente desde el exterior. Son especialmente útiles para crear componentes flexibles y reutilizables.


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








<br>
<br>

### Slots con Nombre

> Los Slots con nombre permiten definir múltiples áreas de contenido dentro de un mismo componente, indicando exactamente dónde debe renderizarse cada bloque.



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



























<br>
<br>

### Slots con BaseLayouts

> Los Slots pueden utilizarse para construir layouts reutilizables, permitiendo definir estructuras comunes mientras cada página personaliza su contenido.

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





























<br>
<br>
<br>
<br>
<br>
<br>

---

## Componentes Dinámicos

> Los componentes dinámicos permiten cambiar qué componente se muestra en pantalla según una condición, una selección del usuario o el estado de la aplicación.

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












<br>
<br>



### Con evento Click

> Un componente puede reaccionar a la interacción del usuario mediante eventos. El evento click permite ejecutar acciones cuando se hace clic sobre un elemento.

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



















<br>
<br>

### Con evento Click toggle

> El patrón toggle permite alternar entre dos estados, como mostrar u ocultar información, activar o desactivar elementos, o cambiar componentes dinámicamente.

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
























<br>
<br>
<br>
<br>
<br>
<br>





---

## Ciclo de Vida

> Los componentes atraviesan distintas etapas desde su creación hasta su destrucción. Vue ofrece hooks que permiten ejecutar código en momentos específicos de ese ciclo.


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


<br>
<br>
<br>
<br>

**Ciclo de vida**:
  
<br>

- **onBeforeMount()**
<small>Antes de mostrar</small>
  - Preparar datos
  - Revisar configuraciones
  - Debugging
- **onMounted()**
<small>Después de mostrar</small>
  - Consumir API
  - Leer LocalStorage
  - Inicializar gráficos
  - Inicializar mapas
  <br>

- **onBeforeUpdate()**
<small>Antes de actualizar</small>
  - Guardar valor anterior
  - Comparar cambios
  - Debugging
- **onUpdated()**
<small> Después de actualizar</small>
  - Recalcular tamaños
  - Actualizar plugins externos
  - Saber cuándo terminó el render
  <br>
- **onBeforeUnmount()**
<small>Antes de destruir</small>
  - Guardar cambios pendientes
  - Confirmar salida
- **onUnmounted()** 
<small>Después de destruir</small>
  - Limpiar intervalos
  - Limpiar eventos
  - Cerrar WebSockets




<br>
<br>


**Ciclo de vida en código**:

<br>
<br>

**onBeforeMount()** Antes de mostrar el HTML.

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

<br>
<br>

**onMounted()** Después de mostrar el HTML.

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









<br>
<br>

**onBeforeUpdate()** Antes de actualizar la vista.

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












<br>
<br>

**onUpdated()** Después de actualizar.

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





<br>
<br>

**onBeforeUnmount()** Antes de eliminar el componente.

App.vue

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

Hijo.vue

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






<br>
<br>

**onUnmounted()** Después de eliminarlo.

Hijo.vue

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











<br>
<br>
<br>
<br>
<br>
<br>

---

## Ejemplos Ciclo de vida

> A continuación veremos ejemplos prácticos para comprender cuándo y por qué utilizar los distintos hooks disponibles en Vue.


<br>
<br>

### Los más usados

> Estos hooks son los más utilizados en aplicaciones reales para cargar datos, reaccionar a cambios y ejecutar lógica cuando el componente se monta.


  - **onMounted()** para Cargar información
  - **onUnmounted()** para Limpiar información


<br>
<br>

**onMounted()** 👉 Cargar productos

```js
onMounted(async () => {
  const res = await fetch("/api/productos");
});
```

**onMounted()** 👉 Leer LocalStorage

```js
onMounted(() => {
  usuario.value =
    localStorage.getItem("usuario");
});
```

**onUnmounted()** 👉 Limpiar un timer

```js
onUnmounted(() => {
  clearInterval(timer);
});
```































<br>
<br>
<br>
<br>
<br>
<br>

### Otros Casos

> Vue ofrece hooks adicionales para situaciones más específicas, como optimización, depuración o limpieza de recursos antes de destruir un componente.


<br>
<br>

**onBeforeMount()** 📖Preparar datos antes de mostrar el componente.

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






<br>
<br>

**onMounted()** 🌐Consumir una API cuando el componente ya está en pantalla.

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









<br>
<br>

**onBeforeUpdate()** 💾💾Guardar el valor anterior antes de actualizar.

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








<br>
<br>

**onUpdated()** 👁️Saber cuándo terminó el render.

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









<br>
<br>

**onBeforeUnmount()** 💾Guardar cambios antes de salir.

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









<br>
<br>

**onUnmounted()** 🧹⌚Limpiar un intervalo al destruir el componente.

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









































<br>
<br>
<br>
<br>
<br>
<br>

---

## Aplicar Estilos

> Vue permite aplicar estilos utilizando CSS tradicional y también técnicas dinámicas que reaccionan automáticamente al estado de la aplicación.


<br>
<br>

### Style normal
> Permite aplicar estilos CSS de forma tradicional, afectando a todos los elementos que coincidan con los selectores definidos.

Afecta toda la aplicación.

```vue
<style>
h1 {
  color: red;
}
</style>
```



<br>
<br>


### Style Scoped

> Los estilos Scoped limitan el alcance del CSS al componente actual, evitando conflictos con estilos de otros componentes.

Afecta sólo al componente.

```vue
<style scoped>
h1 {
  color: red;
}
</style>
```



<br>
<br>

### Class Binding

> Class Binding permite agregar o quitar clases CSS dinámicamente según variables, condiciones o estados de la aplicación.

Permite agregar clases dinámicamente.

```vue
<div
  :class="{ activo: estado }"
>
</div>
```

Si:`estado = true`
Resultado:`<div class="activo"></div>`


<br>
<br>

### Varias clases

> Vue permite combinar múltiples clases dinámicamente, facilitando la creación de interfaces más flexibles y adaptables a distintos escenarios.


```vue
<div
  :class="[
    'card',
    activo ? 'ok' : 'error'
  ]"
>
</div>
```

### Style Binding

> Style Binding permite aplicar estilos CSS directamente desde JavaScript de forma dinámica. Es útil cuando los valores de los estilos dependen de variables, datos o estados del componente.

Permite agregar estilos dinámicos.

```vue
<div
  :style="{
    color: 'red'
  }"
>
</div>
```



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

## ★
