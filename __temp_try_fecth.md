

### TRY AND CATCH




``` vue
<script setup>
import { ref, onMounted } from "vue";

const usuarios = ref([]);
const error = ref("");
const cargando = ref(false);

onMounted(async () => {
  cargando.value = true;

  try {
    const response = await fetch(
      "https://jsonplaceholder.typico_de.com/users"
    );

    if (!response.ok) {
      throw new Error(
        `Error ${response.status}: ${response.statusText}`
      );
    }

    usuarios.value = await response.json();

    console.log("Datos cargados correctamente");
    console.table(usuarios.value);
  }
  catch (err) {
    console.error("Error al obtener usuarios:", err);

    error.value = "fallooo 😭:"+err.message;
  }
  finally {
    cargando.value = false;
  }
});
</script>

<template>
  <div>
    <h1>Usuarios</h1>

    <p v-if="cargando">
      Cargando usuarios...
    </p>

    <p v-if="error">
      {{ error }}
    </p>

    <div
      v-for="usuario in usuarios"
      :key="usuario.id"
    >
      <h3>
        {{ usuario.name }}
      </h3>

      <p>
        {{ usuario.email }}
      </p>

      <p>
        {{ usuario.phone }}
      </p>

      <hr>
    </div>
  </div>
</template>

<style scoped>
h1 {
  margin-bottom: 20px;
}
</style>

```












### FETCH vs AXIOS vs REDAXIOS



#### FETCH



<script setup>
import { ref, onMounted } from "vue";

const usuarios = ref([]);

onMounted(async () => {
  try {
    const response = await fetch(
      "https://jsonplaceholder.typicode.com/users"
    );

    if (!response.ok) {
      throw new Error("Error al obtener usuarios");
    }

    usuarios.value = await response.json();
  }
  catch (err) {
    console.error(err);
  }
});
</script>

<template>
  <div
    v-for="usuario in usuarios"
    :key="usuario.id"
  >
    <h3>{{ usuario.name }}</h3>
    <p>{{ usuario.email }}</p>
  </div>
</template>






#### AXIOS



<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

const usuarios = ref([]);

onMounted(async () => {
  try {
    const response = await axios.get(
      "https://jsonplaceholder.typicode.com/users"
    );

    usuarios.value = response.data;
  }
  catch (err) {
    console.error(err);
  }
});
</script>

<template>
  <div
    v-for="usuario in usuarios"
    :key="usuario.id"
  >
    <h3>{{ usuario.name }}</h3>
    <p>{{ usuario.email }}</p>
  </div>
</template>












#### REDAXIOS

<script setup>
import { ref, onMounted } from "vue";
import axios from "redaxios";

const usuarios = ref([]);

onMounted(async () => {
  try {
    const response = await axios.get(
      "https://jsonplaceholder.typicode.com/users"
    );

    usuarios.value = response.data;
  }
  catch (err) {
    console.error(err);
  }
});
</script>

<template>
  <div
    v-for="usuario in usuarios"
    :key="usuario.id"
  >
    <h3>{{ usuario.name }}</h3>
    <p>{{ usuario.email }}</p>
  </div>
</template>







 































