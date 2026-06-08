# Herramientas de Reactividad Composition API

--- 

## Indíce

- []()
<style>*{scroll-behavior: smooth}</style>




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





**Computed para filtros** Filtrar una lista de productos por categoría.

```vue
<script setup>
import { ref, computed } from "vue";

const categoria = ref("fruta");

const productos = ref([
  { id: 1, nombre: "Manzana", categoria: "fruta" },
  { id: 2, nombre: "Pera", categoria: "fruta" },
  { id: 3, nombre: "Pan", categoria: "panaderia" }
]);

const productosFiltrados = computed(() => {
  return productos.value.filter(
    producto => producto.categoria === categoria.value
  );
});
</script>

<template>
  <button @click="categoria = 'fruta'">
    Frutas
  </button>

  <button @click="categoria = 'panaderia'">
    Panadería
  </button>

  <h2>Categoría: {{ categoria }}</h2>

  <ul>
    <li
      v-for="producto in productosFiltrados"
      :key="producto.id"
    >
      {{ producto.nombre }}
    </li>
  </ul>
</template>
```





**Computed para totales** Calcular el total de un carrito.

```vue
<script setup>
import { ref, computed } from "vue";

const carrito = ref([
  { nombre: "Mouse", precio: 10000 },
  { nombre: "Teclado", precio: 20000 }
]);

const agregarProducto = () => {
  carrito.value.push({
    nombre: "Monitor",
    precio: 150000
  });
};

const total = computed(() => {
  return carrito.value.reduce(
    (acumulador, producto) => acumulador + producto.precio,
    0
  );
});
</script>

<template>
  <button @click="agregarProducto">
    Agregar Monitor
  </button>

  <ul>
    <li v-for="producto in carrito" :key="producto.nombre">
      {{ producto.nombre }} - ${{ producto.precio }}
    </li>
  </ul>

  <h2>Total: ${{ total }}</h2>
</template>
```








**Computed para búsquedas** Buscar por texto.

```vue
<script setup>
import { ref, computed } from "vue";

const busqueda = ref("");

const usuarios = ref([
  "Patricio",
  "Gabriela",
  "Juan",
  "María"
]);

const usuariosFiltrados = computed(() => {
  return usuarios.value.filter(usuario =>
    usuario.toLowerCase().includes(
      busqueda.value.toLowerCase()
    )
  );
});
</script>

<template>
  <input v-model="busqueda">

  <ul>
    <li v-for="usuario in usuariosFiltrados">
      {{ usuario }}
    </li>
  </ul>
</template>
```







**Computed para datos derivados** Generar información a partir de otros datos.

```vue
<script setup>
import { ref, computed } from "vue";

const nombre = ref("Patricio");
const apellido = ref("Garrido");

const nombreCompleto = computed(() => {
  return `${nombre.value} ${apellido.value}`;
});
</script>

<template>
  <h2>{{ nombreCompleto }}</h2>
  <button @click="apellido = 'García'">Cambiar Apellido</button>
</template>
```

**Derivar un estado**

```vue
<script setup>
import { ref, computed } from "vue";

const edad = ref(17);

const esMayorDeEdad = computed(() => {
  return edad.value >= 18;
});
</script>

<template>
  <p>{{ esMayorDeEdad }}</p>

  <p>{{ edad }}</p>

  <button @click="edad++">Incrementar</button>
  <button @click="edad--">Decrementar</button>
</template>
```




**Derivar clases CSS**

```vue
<script setup>
import { ref, computed } from "vue";

const stock = ref(3);

const claseStock = computed(() => {
  return stock.value > 0
    ? "disponible"
    : "agotado";
});
</script>

<template>
  <p :class="claseStock">
    Stock: {{ stock }}
  </p>
  <button @click="stock++">se agrego 1 al inventario</button>
  <br />
  <button @click="stock--">se vendio 1</button>
</template>

<style scoped>
.disponible {
  color: green;
}
.agotado {
  color: red;
}
</style>
```






```vue
<script setup>
import { ref, computed } from "vue";

const stock = ref(3);

const claseStock = computed(() => {
  if (stock.value === 0) {
    return "agotado";
  }

  if (stock.value <= 5) {
    return "poco-stock";
  }

  return "disponible";
});
</script>

<template>
  <p :class="claseStock">
    Stock: {{ stock }}
  </p>

  <button @click="stock++">
    Se agregó 1 al inventario
  </button>

  <br>

  <button @click="stock--" :disabled="stock === 0">
    Se vendió 1
  </button>
</template>

<style scoped>
.disponible {
  color: green;
}

.poco-stock {
  color: orange;
}

.agotado {
  color: red;
}
</style>

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

<template>
  <h1>Contador: {{ contador }}</h1>
  <button @click="contador++">Incrementar</button>
</template>
```



```vue
<script setup>
import { ref, watch } from "vue";

const busqueda = ref("");
const aviso = ref("aun no se cambia");

watch(busqueda, (nuevo) => {
  aviso.value = `se cambio a ${nuevo}`;
});
</script>

<template>
  <input v-model="busqueda">
  <p>{{ aviso }}</p>
</template>
```


**Cuándo usarlo**

* Llamadas a APIs
* Validaciones
* Guardar en LocalStorage
* Ejecutar acciones al cambiar datos








**Llamar una API cuando cambia algo**

```vue
<script setup>
import { ref, watch } from "vue";

const id = ref(1);
const pokemon = ref(null);

watch(id, async (nuevoId) => {
  const res = await fetch(
    `https://pokeapi.co/api/v2/pokemon/${nuevoId}`
  );

  pokemon.value = await res.json();
});
</script>

<template>
  <h1 v-if="pokemon">
    Pokémon: {{ pokemon.name }} <br />
    <img :src="pokemon.sprites.front_default" />
  </h1>

  <button @click="id++">
    Siguiente Pokémon
  </button>
</template>
```



**Validar formularios**

```vue
<script setup>
import { ref, watch } from "vue";

const email = ref("");
const emailValid = ref("");

watch(email, (nuevo) => {
  if (nuevo.includes("@")) {
    emailValid.value = "Email válido";
  } else {
    emailValid.value = "Email inválido";
  }
});
</script>

<template>
  <input v-model="email">
  <p>{{ emailValid }}</p>
</template>
```



**Guardar en LocalStorage**

```vue
<script setup>
import { ref, watch } from "vue";

const tema = ref("light");

watch(tema, (nuevo) => {
  localStorage.setItem("tema", nuevo);

  document.body.className = nuevo;
});
</script>

<template>
  <button @click="tema = 'light'">
    Light Mode
  </button>

  <button @click="tema = 'dark'">
    Dark Mode
  </button>
</template>

<style>
.light {
  background-color: white;
  color: black;
}

.dark {
  background-color: black;
  color: white;
}
</style>
```




**Ejecutar acciones cuando cambia un dato**

```vue
<script setup>
import { ref, watch } from "vue";

const stock = ref(5);

watch(stock, (nuevo) => {
  if (nuevo === 0) {
    alert("Producto agotado");
  }
});
</script>

<template>
  <h1>Stock: {{ stock }}</h1>
  <button @click="stock--">
    Vender
  </button>
</template>
```


































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



```vue
<script setup>
import { ref, onMounted } from "vue";

const pokemon = ref(null);

onMounted(async () => {
  const respuesta = await fetch(
    "https://pokeapi.co/api/v2/pokemon/pikachu"
  );

  pokemon.value = await respuesta.json();

  console.log("Pokémon cargado");
});
</script>

<template>
  <div v-if="pokemon">
    <h2>{{ pokemon.name }}</h2>

    <img
      :src="pokemon.sprites.front_default"
      :alt="pokemon.name"
    >

    <p>Altura: {{ pokemon.height }}</p>
    <p>Peso: {{ pokemon.weight }}</p>
  </div>
</template>
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





**Ejemplo 1: Tarjeta de producto**

**Padre**

```vue
<script setup>
import ProductCard from "./ProductCard.vue";
</script>

<template>
  <ProductCard
    nombre="Mouse Gamer"
    precio="19990"
  />
</template>
```

**Hijo**

```vue
<script setup>
const props = defineProps({
  nombre: String,
  precio: Number
});
</script>

<template>
  <div>
    <h2>{{ props.nombre }}</h2>
    <p>${{ props.precio }}</p>
  </div>
</template>
```



**Ejemplo 2: Avatar de usuario**

**Padre**

```vue
<template>
  <UserCard
    nombre="Patricio"
    avatar="https://i.pravatar.cc/150"
  />
</template>
```

**Hijo**

```vue
<script setup>
const props = defineProps({
  nombre: String,
  avatar: String
});
</script>

<template>
  <img :src="props.avatar">

  <h2>{{ props.nombre }}</h2>
</template>
```







**Ejemplo 3: Lista con v-for**

**Padre**

```vue
<script setup>
import UserCard from "./UserCard.vue";

const usuarios = [
  { id: 1, nombre: "Patricio" },
  { id: 2, nombre: "Gabriela" },
  { id: 3, nombre: "Juan" }
];
</script>

<template>
  <UserCard
    v-for="usuario in usuarios"
    :key="usuario.id"
    :nombre="usuario.nombre"
  />
</template>
```

**Hijo**

```vue
<script setup>
const props = defineProps({
  nombre: String
});
</script>

<template>
  <h2>{{ props.nombre }}</h2>
</template>
```



**Ejemplo 4: Boolean**

**Padre**

```vue
<template>
  <UserStatus
    nombre="Patricio"
    :online="true"
  />
</template>
```

**Hijo**

```vue
<script setup>
const props = defineProps({
  nombre: String,
  online: Boolean
});
</script>

<template>
  <h2>{{ props.nombre }}</h2>

  <p v-if="props.online">
    🟢 En línea
  </p>

  <p v-else>
    🔴 Desconectado
  </p>
</template>
```







**Ejemplo 5: Pasar un objeto completo**

**Padre**

```vue
<script setup>
import UserCard from "./UserCard.vue";

const usuario = {
  nombre: "Patricio",
  edad: 40,
  ciudad: "Santiago"
};
</script>

<template>
  <UserCard :usuario="usuario" />
</template>
```

**Hijo**

```vue
<script setup>
const props = defineProps({
  usuario: Object
});
</script>

<template>
  <h2>{{ props.usuario.nombre }}</h2>
  <p>{{ props.usuario.edad }}</p>
  <p>{{ props.usuario.ciudad }}</p>
</template>
```




**Ejemplo 6: Pasar un array**

Padre

```vue
<script setup>
import ProductList from "./ProductList.vue";

const productos = [
  "Mouse",
  "Teclado",
  "Monitor"
];
</script>

<template>
  <ProductList :productos="productos" />
</template>
```

Hijo

```vue
<script setup>
const props = defineProps({
  productos: Array
});
</script>

<template>
  <ul>
    <li v-for="producto in props.productos">
      {{ producto }}
    </li>
  </ul>
</template>
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










**Ejemplo 1: Saludar**

### Hijo

```vue
<script setup>
const emit = defineEmits(["saludar"]);

const enviarSaludo = () => {
  emit("saludar", "Patricio");
};
</script>

<template>
  <button @click="enviarSaludo">
    Saludar
  </button>
</template>
```

### Padre

```vue
<script setup>
import Hijo from "./Hijo.vue";

const recibirSaludo = (nombre) => {
  alert(`Hola ${nombre}`);
};
</script>

<template>
  <Hijo @saludar="recibirSaludo" />
</template>
```

---

**Ejemplo 2: Contador**

### Hijo

```vue
<script setup>
const emit = defineEmits(["incrementar"]);

const sumar = () => {
  emit("incrementar");
};
</script>

<template>
  <button @click="sumar">
    +
  </button>
</template>
```

### Padre

```vue
<script setup>
import { ref } from "vue";
import CounterButton from "./CounterButton.vue";

const contador = ref(0);

const incrementar = () => {
  contador.value++;
};
</script>

<template>
  <h2>{{ contador }}</h2>

  <CounterButton
    @incrementar="incrementar"
  />
</template>
```

---

**Ejemplo 3: Eliminar producto**

### Hijo

```vue
<script setup>
const props = defineProps({
  producto: Object
});

const emit = defineEmits(["eliminar"]);

const borrar = () => {
  emit("eliminar", props.producto.id);
};
</script>

<template>
  <button @click="borrar">
    Eliminar
  </button>
</template>
```

### Padre

```vue
<script setup>
const eliminarProducto = (id) => {
  console.log("Eliminar:", id);
};
</script>

<template>
  <ProductCard
    :producto="producto"
    @eliminar="eliminarProducto"
  />
</template>
```

---

**Ejemplo 4: Formulario Login**

### Hijo

```vue
<script setup>
import { ref } from "vue";

const emit = defineEmits(["login"]);

const email = ref("");

const enviar = () => {
  emit("login", email.value);
};
</script>

<template>
  <input v-model="email">

  <button @click="enviar">
    Login
  </button>
</template>
```

### Padre

```vue
<script setup>
const login = (email) => {
  console.log(email);
};
</script>

<template>
  <LoginForm
    @login="login"
  />
</template>
```






**Ejemplo 5: Cerrar modal**

### Hijo

```vue
<script setup>
const emit = defineEmits(["cerrar"]);
</script>

<template>
  <button @click="emit('cerrar')">
    X
  </button>
</template>
```

### Padre

```vue
<script setup>
import { ref } from "vue";

const mostrarModal = ref(true);
</script>

<template>
  <Modal
    v-if="mostrarModal"
    @cerrar="mostrarModal = false"
  />
</template>
```







**Ejemplo 6: Emitir varios datos**

**Hijo**

```vue
<script setup>
const emit = defineEmits(["guardar"]);

const guardar = () => {
  emit("guardar", {
    nombre: "Patricio",
    edad: 40
  });
};
</script>

<template>
  <button @click="guardar">
    Guardar
  </button>
</template>
```

**Padre**

```vue
<script setup>
const guardarUsuario = (usuario) => {
  console.log(usuario.nombre);
  console.log(usuario.edad);
};
</script>

<template>
  <FormUser
    @guardar="guardarUsuario"
  />
</template>
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
