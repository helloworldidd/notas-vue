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