<script setup>

const cerrar = () => {
  alert("Cerrar popup");
};

</script>

<template>

  <div
    class="fondo"
    @click="cerrar"
  >

    <div
      class="popup"
      @click.stop
    >

      <h2>Popup 😎</h2>

      <button>
        Botón interno
      </button>

    </div>

  </div>

</template>

<style scoped>

.fondo {
  background: rgba(0,0,0,0.4);
  padding: 100px;
}

.popup {
  background: white;
  padding: 20px;
}

</style>