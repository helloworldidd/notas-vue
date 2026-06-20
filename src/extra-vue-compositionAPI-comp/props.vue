<script setup>

defineProps({
  titulo: String,
  texto: String
});

</script>

<template>

  <div class="card">
    <h2>{{ titulo }}</h2>
    <p>{{ texto }}</p>
  </div>
</template>

<style scoped>

.card {
  border: 2px solid black;
  padding: 20px;
  border-radius: 10px;
}

</style>






<script setup>

import Card from "./components/Card.vue";

</script>

<template>

  <Card
    titulo="Hola Vue 😎"
    texto="Este texto viene desde App.vue"
  />

</template>






























