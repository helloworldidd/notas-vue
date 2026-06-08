<script setup>
import { ref, watch } from "vue";

const contador = ref(0);

watch(contador, (nuevo, anterior) => {
  console.log("Nuevo:", nuevo);
  console.log("Anterior:", anterior);
});

const sumar = () => {
  contador.value++;
};
</script>

<template>
  <h1>watch</h1>

  <p>{{ contador }}</p>

  <button @click="sumar">
    Sumar
  </button>
</template>