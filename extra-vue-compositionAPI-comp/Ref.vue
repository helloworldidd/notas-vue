<script setup>
import { ref } from "vue";

const activo = ref(false);

const cambiarEstilo = () => {
  activo.value = !activo.value;
};
</script>

<template>
  <h2 :class="{ destacado: activo }">
    Ref
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