<script setup>
import { ref } from "vue";
import UserButton2 from "./UserButton2.vue";

const mensaje = ref("");

const recibirSaludo = (nombre) => {
  mensaje.value = nombre;
};
</script>

<template>
  <UserButton2 @saludar="recibirSaludo" />

  <h2>{{ mensaje }}</h2>
</template>