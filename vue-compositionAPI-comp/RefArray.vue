<script setup>
import { ref } from "vue";

const tareas = ref([
  {
    id: 1,
    texto: "Estudiar Vue",
    completada: false,
  },
  {
    id: 2,
    texto: "Practicar v-for",
    completada: false,
  },
]);

const cambiarEstado = (id) => {
  const tarea = tareas.value.find(t => t.id === id);

  tarea.completada = !tarea.completada;
};
</script>

<template>
  <h2>RefArray</h2>
  <div
    v-for="tarea in tareas"
    :key="tarea.id"
  >
    <p :class="{ completada: tarea.completada }">
      {{ tarea.texto }}
    </p>

    <button @click="cambiarEstado(tarea.id)">
      Cambiar estado
    </button>
  </div>
</template>

<style scoped>
.completada {
  text-decoration: line-through;
  color: gray;
}
</style>