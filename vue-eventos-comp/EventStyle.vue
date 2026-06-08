<script setup>
import { ref } from "vue";

const activo = ref(false);
</script>

<template>

  <input
    type="text"
    :class="{ 'activo-demo': activo }"
    @focus="activo = true"
    @blur="activo = false"
    placeholder="Haz click aquí"
  >

</template>

<style scoped>

input {
  padding: 10px;
  border: 2px solid gray;
  outline: none;
}

.activo-demo {
  border: 2px solid red;
  background-color: #ffe5e5;
}

</style>