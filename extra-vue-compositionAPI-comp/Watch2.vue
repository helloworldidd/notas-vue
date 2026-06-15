<script setup>
import { ref, watch } from "vue";

const busqueda = ref("");

watch(busqueda, (nuevo, anterior) => {
  console.log("Buscando:", nuevo);
});
</script>

<template>
  <h1>Buscador</h1>

  <input
    v-model="busqueda"
    placeholder="Buscar producto..."
  />

  <p>Buscando: {{ busqueda }}</p>
</template>