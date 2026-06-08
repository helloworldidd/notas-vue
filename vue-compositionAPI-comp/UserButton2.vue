<script setup>
const emit = defineEmits(["saludar"]);

const enviarUp = () => {
  emit("saludar", "Patricio");
};
</script>

<template>
  <button @click="enviarUp">
    Saludar
  </button>
</template>