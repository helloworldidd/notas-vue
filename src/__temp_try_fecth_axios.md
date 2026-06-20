# Fetch vs Axios vs RedAxios















## Fetch



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














## Axios



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












# RedAxios

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







 




