<script setup>

const abrirCard = () => {
  alert("Abrir detalle producto");
};

const favorito = () => {
  alert("Producto favorito ❤️");
};

</script>

<template>

  <div
    class="card"
    @click="abrirCard"
  >

    <h2>Notebook Gamer</h2>

    <button @click.stop="favorito">
      ❤️
    </button>

  </div>

</template>

<style scoped>

.card {
  border: 2px solid black;
  padding: 20px;
  width: 200px;
}

</style>