<script setup>
import UserButton from "./UserButton.vue";

const saludar = () => {
  alert("Hola Patricio");
};

</script>

<template>
  <UserButton @saludar="saludar" />
</template>