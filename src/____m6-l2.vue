<!-- App.vue ---------------------------- -->

<script setup>
const mascota = {
  nombre: "Milo",
  tipo: "Gato",
  edad: 3,
  vacunado: true,
  foto: "./src/assets/cat.png",
  caracteristicas: [
    "Juguetón",
    "Dormilón",
    "Cariñoso",
    "Curioso"
  ]
};
</script>

<template>
  <div class="container">

    <h1>🐾 Elige tu Mascota Ideal</h1>

    <div class="card">

      <!-- atributo dinámico -->
      <img :src="mascota.foto" :alt="mascota.nombre">

      <!-- interpolación -->
      <h2>{{ mascota.nombre }}</h2>

      <p>
        Tipo: {{ mascota.tipo }}
      </p>

      <p>
        Edad: {{ mascota.edad }} años
      </p>

      <!-- renderización condicional -->
      <p v-if="mascota.vacunado" class="vacunado">
        ✅ Vacunado
      </p>

      <p v-else class="novacunado">
        ❌ No vacunado
      </p>

      <h3>Características</h3>

      <!-- listas dinámicas -->
      <ul>
        <li
          v-for="(caracteristica, index) in mascota.caracteristicas"
          :key="index"
        >
          {{ caracteristica }}
        </li>
      </ul>

    </div>

  </div>
</template>

<style scoped>

.container {
  min-height: 100vh;
  background: #f5f5f5;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 40px;
  font-family: Arial, sans-serif;
}

h1 {
  margin-bottom: 30px;
}

.card {
  background: white;
  width: 320px;
  padding: 24px;
  border-radius: 16px;
  box-shadow: 0 8px 20px rgba(0,0,0,0.15);
  text-align: center;
}

img {
  width: 100%;
  border-radius: 12px;
  margin-bottom: 20px;
}

ul {
  text-align: left;
  padding-left: 20px;
}

.vacunado {
  color: green;
  font-weight: bold;
}

.novacunado {
  color: red;
  font-weight: bold;
}

</style>