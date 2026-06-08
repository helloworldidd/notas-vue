



<!-- App.vue ---------------------------- -->


<script setup>
import { ref, onMounted } from "vue";

import AppNavBar from "./components/AppNavBar.vue";
import HeroSection from "./components/HeroSection.vue";
import CardList from "./components/CardList.vue";

const servicios = ref([]);

onMounted(async () => {
  const respuesta = await import("./data/cards.json");
  servicios.value = respuesta.default;
});

</script>





<template>
  <AppNavBar />

  <main>
    <HeroSection />
    <CardList :cards="servicios" />
  </main>
</template>





<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: #f5f7fb;
  color: #222;
}

main {
  min-height: 100vh;
}
</style>












<!-- data/cards.json ---------------------------- -->

[
  {
    "id": 1,
    "titulo": "Marketing Digital",
    "descripcion": "Creamos estrategias para redes sociales y campañas online.",
    "icono": "📱"
  },
  {
    "id": 2,
    "titulo": "Branding",
    "descripcion": "Diseñamos identidades visuales modernas y memorables.",
    "icono": "✨"
  },
  {
    "id": 3,
    "titulo": "Fotografía",
    "descripcion": "Producción de contenido visual para marcas y productos.",
    "icono": "📸"
  }
]






<!-- components/AppNavBar.vue ---------------------------- -->

<template>
  <nav class="navbar">
    <h2>Mi Landing</h2>

    <ul>
      <li><a href="#">Inicio</a></li>
      <li><a href="#">Servicios</a></li>
      <li><a href="#">Contacto</a></li>
    </ul>
  </nav>
</template>

<style scoped>
.navbar {
  background: #222;
  color: white;
  padding: 20px 40px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

ul {
  display: flex;
  gap: 20px;
  list-style: none;
}

a {
  color: white;
  text-decoration: none;
}
</style>





<!-- components/CardList.vue ---------------------------- -->

<script setup>
import InfoCard from "./InfoCard.vue";

defineProps({
  cards: {
    type: Array,
    required: true
  }
});
</script>

<template>
  <section class="cards-section">
    <h2>Nuestros servicios</h2>

    <div class="cards-container">

      <InfoCard
        v-for="card in cards"
        :key="card.id"
        :titulo="card.titulo"
        :descripcion="card.descripcion"
        :icono="card.icono"
      />


    </div>
  </section>
</template>

<style scoped>
.cards-section {
  padding: 60px 40px;
  text-align: center;
}

.cards-container {
  display: flex;
  justify-content: center;
  gap: 24px;
  flex-wrap: wrap;
  
}
</style>





<!-- components/HeroSection.vue ---------------------------- -->


<template>
  <section class="hero">
    <h1>Bienvenido a nuestra landing page</h1>
    <p>
      Una página creada con Vue, componentes, props, v-for y datos desde JSON.
    </p>
    <button>Ver servicios</button>
  </section>
</template>

<style scoped>
.hero {
  text-align: center;
  padding: 80px 20px;
  background: linear-gradient(135deg, #6c63ff, #48c6ef);
  color: white;
}

h1 {
  font-size: 42px;
}

button {
  margin-top: 40px;
  padding: 12px 24px;
  border: none;
  border-radius: 20px;
  background: white;
  color: #333;
  cursor: pointer;
}
</style>







<!-- components/InfoCard.vue ---------------------------- -->

<script setup>
defineProps({
  titulo: String,
  descripcion: String,
  icono: String
});
</script>

<template>
  <article class="card">
    <div class="icono">{{ icono }}</div>
    <h3>{{ titulo }}</h3>
    <p>{{ descripcion }}</p>
  </article>
</template>

<style scoped>
.card {
  width: 260px;
  background: white;
  padding: 30px;
  border-radius: 16px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
}

.icono {
  font-size: 40px;
}

h3 {
  color: #6c63ff;
  
}
</style>





<!-- components/SectionComponent.vue ---------------------------- -->


<template>
    <section>  
        <h2>Seccion 1</h2>
    </section>
</template>

<script setup>

</script>

<style lang="scss" scoped>
    section{
    background-color: #cebddd;
    padding: 30px 10px;
    }
</style>
