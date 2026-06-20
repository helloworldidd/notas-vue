<script setup>
import { ref, onMounted } from "vue";

const productos = ref([]);

// const cargarProductos = async () => {
//   const respuesta = await fetch(
//     "https://fakestoreapi.com/products"
//   );

//   productos.value = await respuesta.json();
// };

// cargarProductos();

onMounted(async () => {
  const respuesta = await fetch(
    "https://fakestoreapi.com/products"
  );

  productos.value = await respuesta.json();
});
</script>

<template>
  <h1>Tienda</h1>

  <div
    v-for="producto in productos"
    :key="producto.id"
  >
    {{ producto.title }}
  </div>
</template>