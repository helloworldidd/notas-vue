<script setup>
import { ref, onMounted } from "vue";

const mostrarPopup = ref(false);

onMounted(() => {

  setTimeout(() => {
    mostrarPopup.value = true;
  }, 2000);

});

const cerrarPopup = () => {
  mostrarPopup.value = false;
};
</script>

<template>

  <div
    v-if="mostrarPopup"
    class="fondo"
    @click="cerrarPopup"
  >

    <div
      class="popup"
      @click.stop
    >

      <h2>Hola 😎</h2>

      <p>
        Haz click fuera del popup para cerrarlo.
      </p>

      <button @click="cerrarPopup">
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

  display: flex;
  justify-content: center;
  align-items: center;
}

.popup {
  background: white;
  padding: 20px;
  border-radius: 12px;
  width: 300px;
  text-align: center;
}

button {
  margin-top: 10px;
  padding: 10px 16px;
}

</style>