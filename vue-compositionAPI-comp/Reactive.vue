<script setup>
import { reactive } from "vue";

const usuario = reactive({
  nombre: "Patricio",
  edad: 41
});

const cambiarNombre = () => {
  usuario.nombre = "Juan";
};
</script>

<template>
  <h2>Reactive</h2>
  <p>{{ usuario.nombre }}</p>
  <p>{{ usuario.edad }}</p>

  <button @click="cambiarNombre">
    Cambiar nombre
  </button>
</template>