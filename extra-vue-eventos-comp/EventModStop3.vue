<script setup>

const abrirFila = () => {
  alert("Abrir detalle fila");
};

const editar = () => {
  alert("Editar usuario");
};

</script>

<template>

  <div
    class="fila"
    @click="abrirFila"
  >

    <span>Patricio</span>

    <button @click.stop="editar">
      Editar
    </button>

  </div>

</template>

<style scoped>

.fila {
  border: 1px solid gray;
  padding: 20px;

  display: flex;
  justify-content: space-between;
}

</style>