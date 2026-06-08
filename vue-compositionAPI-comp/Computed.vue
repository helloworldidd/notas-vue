<script setup>
import { ref, computed } from "vue";

const nombre = ref("Patricio");
const apellido = ref("Garrido");

const nombreCompleto = computed(() => {
  console.log("Calculando...");
  return nombre.value + " " + apellido.value;
});

const cambiarNombre = () => {
  nombre.value = "Juan";
  console.log("cambiarNombre");
};


const contador = ref(0);
const renderizar = () => {
  contador.value++;
};
</script>

<template>
  <h1>Computed</h1>

  <p>Nombre: {{ nombre }}</p>
  <p>Apellido: {{ apellido }}</p>

  <h2>{{ nombreCompleto }}</h2>

  <button @click="cambiarNombre">
    Cambiar a Juan
  </button>




  <p>Contador: {{ contador }}</p>

  <button @click="renderizar">
    Renderizar
  </button>
</template>