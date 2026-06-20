# APIs de Imágenes para practicar Vue

---

## 1. Dog API

Devuelve una imagen aleatoria de perro.

URL:

```txt
https://dog.ceo/api/breeds/image/random
```

Componente Vue:

```vue
<script setup>
import { ref, onMounted } from "vue";

const imagen = ref("");

const cargarImagen = async () => {
  const response = await fetch(
    "https://dog.ceo/api/breeds/image/random"
  );

  const data = await response.json();

  imagen.value = data.message;
};

onMounted(cargarImagen);
</script>

<template>
  <h2>Dog API</h2>

  <img
    v-if="imagen"
    :src="imagen"
    width="300"
  >
</template>
```

---

## 2. Random User API

Devuelve personas aleatorias con foto.

URL:

```txt
https://randomuser.me/api/
```

Componente Vue:

```vue
<script setup>
import { ref, onMounted } from "vue";

const usuario = ref(null);

const cargarUsuario = async () => {
  const response = await fetch(
    "https://randomuser.me/api/"
  );

  const data = await response.json();

  usuario.value = data.results[0];
};

onMounted(cargarUsuario);
</script>

<template>
  <div v-if="usuario">
    <h2>
      {{ usuario.name.first }}
      {{ usuario.name.last }}
    </h2>

    <img :src="usuario.picture.large">
  </div>
</template>
```

---

## 3. PokéAPI

Permite obtener sprites de Pokémon.

URL:

```txt
https://pokeapi.co/api/v2/pokemon/25
```

Componente Vue:

```vue
<script setup>
import { ref, onMounted } from "vue";

const pokemon = ref(null);

const cargarPokemon = async () => {
  const response = await fetch(
    "https://pokeapi.co/api/v2/pokemon/25"
  );

  pokemon.value = await response.json();
};

onMounted(cargarPokemon);
</script>

<template>
  <div v-if="pokemon">
    <h2>{{ pokemon.name }}</h2>

    <img
      :src="pokemon.sprites.front_default"
    >
  </div>
</template>
```

---

## 4. Lorem Picsum

Devuelve imágenes aleatorias.

URL:

```txt
https://picsum.photos/v2/list?page=1&limit=10
```

Componente Vue:

```vue
<script setup>
import { ref, onMounted } from "vue";

const imagenes = ref([]);

const cargarImagenes = async () => {
  const response = await fetch(
    "https://picsum.photos/v2/list?page=1&limit=10"
  );

  imagenes.value = await response.json();
};

onMounted(cargarImagenes);
</script>

<template>
  <h2>Galería</h2>

  <img
    v-for="imagen in imagenes"
    :key="imagen.id"
    :src="imagen.download_url"
    width="200"
  >
</template>
```

---

## 5. Lorem Picsum sin fetch

También puedes obtener imágenes aleatorias sin consumir una API.

```html
<img src="https://picsum.photos/300/200">
```

Con semilla fija:

```html
<img src="https://picsum.photos/seed/vue/300/200">
```

---

# Patrón Vue para consumir imágenes

```vue
<script setup>
import { ref, onMounted } from "vue";

const imagenes = ref([]);

const cargarDatos = async () => {
  const response = await fetch(URL);

  const data = await response.json();

  imagenes.value = data;
};

onMounted(cargarDatos);
</script>

<template>
  <img
    v-for="imagen in imagenes"
    :key="imagen.id"
    :src="imagen.url"
  >
</template>
```

---

# Conceptos que practicas

- ref()
- onMounted()
- async / await
- fetch()
- response.json()
- v-if
- v-for
- :src
- :key
- renderizado de listas
- renderizado condicional

---

# Ejercicios recomendados

### Nivel 1

Mostrar una imagen aleatoria de perro.

### Nivel 2

Mostrar una persona aleatoria con nombre y foto.

### Nivel 3

Mostrar un Pokémon con su sprite.

### Nivel 4

Crear una galería de 10 imágenes usando Picsum.

### Nivel 5

Agregar un botón:

```html
<button @click="cargarImagen">
  Nueva imagen
</button>
```

para cargar una nueva imagen cada vez que el usuario haga clic.

### Nivel 6

Agregar estados:

```js
const loading = ref(false);
const error = ref(null);
```

y mostrar mensajes mientras se realiza la petición.

---

# APIs recomendadas para aprender Vue

| API | Tipo |
|------|--------|
| JSONPlaceholder | Datos fake |
| DummyJSON | Ecommerce |
| Random User | Usuarios |
| Dog API | Imágenes |
| Cat Fact | Texto |
| PokéAPI | Pokémon |
| Picsum | Galería de imágenes |
| Open Meteo | Clima |