<script setup>
import { ref } from "vue";
const mostrarPopup = ref(false);
</script>

<template>
  <button @click="mostrarPopup = true">
    Abrir popup
  </button>
  <div v-if="mostrarPopup" class="fondo">
    <div class="popup">
      <h2>Hola 😎</h2>
      <p>Este es un popup simple con CSS.</p>
      <button @click="mostrarPopup = false">
        Cerrar
      </button>
    </div>
  </div>
</template>


<style scoped>
.fondo {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.4);
  display: grid;
  place-items: center;
}

.popup {
  background: white;
  padding: 20px;
  border-radius: 12px;
  width: 280px;
  text-align: center;
}

button {
  padding: 10px 16px;
  cursor: pointer;
}
</style>