# Herramientas de Reactividad Composition API

--- 

## Indíce

- []()
<style>*{scroll-behavior: smooth}</style>



--- 

## 





---

## 1. ref()

Permite crear variables reactivas.

```vue
<script setup>
import { ref } from "vue";

const activo = ref(false);

const cambiarEstilo = () => {
  activo.value = !activo.value;
};
</script>

<template>
  <h2 :class="{ destacado: activo }">
    Hola Vue
  </h2>

  <button @click="cambiarEstilo">
    Cambiar estilo
  </button>
</template>

<style scoped>
.destacado {
  color: red;
}
</style>
```

**Usarlo con**

* Strings
* Números
* Booleanos
* Arrays
* Objetos simples

```js
const nombre = ref("Patricio");
const edad = ref(41);
const activo = ref(true);
```











---

## 2. reactive()

Permite crear objetos reactivos.

```vue
<script setup>
import { reactive } from "vue";

const usuario = reactive({
  nombre: "Patricio",
  edad: 41
});

const cambiarNombre = () => {
  usuario.nombre = "Juan";
};
</script>

<template>
  <p>{{ usuario.nombre }}</p>

  <button @click="cambiarNombre">
    Cambiar nombre
  </button>
</template>
```

**Usarlo con:**

Cuando tienes varias propiedades relacionadas.

```js
const formulario = reactive({
  nombre: "",
  email: "",
  telefono: "",
});
```







---

## 3. computed()

Crea valores calculados automáticamente.

```vue
<script setup>
import { ref, computed } from "vue";

const nombre = ref("Patricio");
const apellido = ref("Garrido");

const nombreCompleto = computed(() => {
  return nombre.value + " " + apellido.value;
});
</script>

<template>
  <h2>{{ nombreCompleto }}</h2>
</template>
```

**Cuándo usarlo**

* Filtros
* Totales
* Búsquedas
* Datos derivados

```js
const total = computed(() => {
  return precio.value * cantidad.value;
});
```

















---

## 4. watch()

Observa cambios en una variable.

```vue
<script setup>
import { ref, watch } from "vue";

const contador = ref(0);

watch(contador, (nuevo, anterior) => {
  console.log("Nuevo:", nuevo);
  console.log("Anterior:", anterior);
});
</script>
```

**Cuándo usarlo**

* Llamadas a APIs
* Validaciones
* Guardar en LocalStorage
* Ejecutar acciones al cambiar datos

```js
watch(busqueda, () => {
  buscarProductos();
});
```
















---

## 5. onMounted()

Se ejecuta cuando el componente termina de cargarse.

```vue
<script setup>
import { onMounted } from "vue";

onMounted(() => {
  console.log("Componente cargado");
});
</script>
```

**Cuándo usarlo**

* Consumir APIs
* Cargar datos
* Configurar plugins
* Manipular el DOM

```js
onMounted(() => {
  obtenerUsuarios();
});
```











---

## 6. defineProps()

Recibe datos desde el componente padre.

### Padre

```vue
<script setup>
import Hijo from "./Hijo.vue";
</script>

<template>
  <Hijo nombre="Marta" edad="25" />
  <Hijo nombre="Carolina" edad="28" />
</template>

```

### Hijo

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

**Cuándo usarlo**

Para enviar información desde un componente padre a uno hijo.

```text
Padre
 ↓
Hijo
```







---

## 7. defineEmits()

Permite enviar eventos desde el hijo al padre.

**Hijo**

```vue
<script setup>
const emit = defineEmits(["saludar"]);

const enviarSaludo = () => {
  emit("saludar");
};
</script>

<template>
  <button @click="enviarSaludo">
    Saludar
  </button>
</template>
```

**Padre**

```vue
<UserButton @saludar="mostrarMensaje" />
```

```js
const mostrarMensaje = () => {
  alert("Hola");
};
```

**Cuándo usarlo**

Para comunicar un hijo con su padre.

```text
Padre → Props → Hijo
Padre ← Emits ← Hijo
```







---

## Resumen

| Herramienta     | ¿Para qué sirve?        |
| --------------- | ----------------------- |
| `ref()`         | Variable reactiva       |
| `reactive()`    | Objeto reactivo         |
| `computed()`    | Valor calculado         |
| `watch()`       | Detectar cambios        |
| `onMounted()`   | Ejecutar al cargar      |
| `defineProps()` | Recibir datos del padre |
| `defineEmits()` | Enviar eventos al padre |

💡 Regla fácil para recordar:

```text
ref        → guardar datos
reactive   → guardar objetos
computed   → calcular datos
watch      → observar cambios
onMounted  → iniciar algo al cargar
defineProps→ bajar datos
defineEmits→ subir eventos
```

Con estas 7 herramientas ya puedes construir la mayoría de las aplicaciones Vue que se hacen en un bootcamp y gran parte de los proyectos reales.
