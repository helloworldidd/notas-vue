<script setup>


import { onMounted, onUnmounted } from "vue";

const detectarTecla = (event) => {
  if (  event.ctrlKey &&
  event.key === "9") {
    alert("Presionaste 9 😎");
  }
};

onMounted(() => {
  window.addEventListener("keyup", detectarTecla);
});

onUnmounted(() => {
  window.removeEventListener("keyup", detectarTecla);
});
</script>

<template>
  <h1>Presiona 9 en cualquier lugar 👀</h1>
</template>

<style scoped></style>