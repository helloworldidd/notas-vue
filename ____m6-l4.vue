<!-- App.vue ---------------------------- -->



<script setup>
import { ref } from "vue";




/* VARIABLES REACTIVAS */

const busqueda = ref("");
const resultado = ref("");
const logs = ref([]);
const tipsMostrados = ref(false);
const scrollY = ref(0);
const tarjetas = ref([
  {
    id: 1,
    titulo: "Conferencia Vue"
  },

  {
    id: 2,
    titulo: "Workshop UX/UI"
  },

  {
    id: 3,
    titulo: "Hackathon Frontend"
  }
]);



/* LOGS */

const agregarLog = (texto) => {
  logs.value.unshift(texto);
};




/* BUSQUEDA */
const buscar = () => {
  if (busqueda.value.trim() === "") {
    resultado.value = "No escribiste nada 😵";
  } else {
    resultado.value = `Buscando: ${busqueda.value}`;
  }
  agregarLog("buscar");
};


const limpiar = () => {
  busqueda.value = "";
  resultado.value = "";
  agregarLog("limpiar");
};



/* TARJETAS */

const seleccionarTarjeta = (id) => {
  agregarLog(`click tarjeta ${id}`);
};

const marcarFavorito = (id) => {
  agregarLog(`favorito ${id}`);
};




/* CAPTURE */
const logCaptura = () => {
  agregarLog("capture section");
};



/* ONCE */
const mostrarTips = () => {
  tipsMostrados.value = true;
  agregarLog("mostrar tips");
};



/* SCROLL PASSIVE */
const onScroll = (event) => {
  scrollY.value = event.target.scrollTop;
  agregarLog(`scroll: ${scrollY.value}px`);
};



/* PREVENT LINK */
const abrirModalInfo = () => {
  agregarLog("prevent link");
  alert("No navega 😎");
};



/* LIMPIAR LOGS */
const limpiarLogs = () => {
  logs.value = [];
};

</script>

<template>

  <div class="container">

    <h1>Centro de Eventos 😎</h1>







    <!--FORMULARIO -->
    <form @submit.prevent="buscar">
      <input
        type="text"
        v-model="busqueda"
        @keyup.enter="buscar"
        @keydown.esc="limpiar"
        placeholder="Buscar evento"
      >
      <button>Buscar</button>
    </form>

    <p class="resultado">
      {{ resultado }}
    </p>








    <!-- TARJETAS -->
    <section
      class="cards"
      @click.capture="logCaptura"
    >

      <div
        class="card"
        v-for="card in tarjetas"
        :key="card.id"
        @click="seleccionarTarjeta(card.id)"
      >

        <h2>
          {{ card.titulo }}
        </h2>

        <button
          @click.stop="marcarFavorito(card.id)"
        >
          ❤️ Favorito
        </button>

      </div>

    </section>






    <!-- ONCE -->

    <button
      @click.once="mostrarTips"

      :disabled="tipsMostrados"
    >

      {{
        tipsMostrados
          ? "Tips mostrados"
          : "Mostrar tips"
      }}

    </button>











    <!--
         SCROLL PASSIVE
   = -->

    <div
      class="scroll-box"

      @scroll.passive="onScroll"
    >

      <p
        v-for="n in 40"
        :key="n"
      >
        Evento {{ n }}
      </p>

    </div>

    <p>
      Scroll actual: {{ scrollY }}px
    </p>









    <!--
         PREVENT
   = -->

    <a
      href="https://example.com"

      @click.prevent="abrirModalInfo"
    >
      Abrir información
    </a>









    <!--
         LOGS
   = -->

    <div class="logs">
      <div class="logs-header">
        <h2>
          Registro de eventos
        </h2>
        <button @click="limpiarLogs">
          Limpiar logs
        </button>
      </div>
      <ul>
        <li
          v-for="(log, index) in logs"
          :key="index"
        >
          {{ log }}
        </li>
      </ul>
    </div>




    

  </div>

</template>

<style scoped>

.container {
  max-width: 900px;
  margin: auto;
  padding: 20px;

  font-family: Arial;
}

form {
  display: flex;
  gap: 10px;
}

input {
  padding: 10px;
  width: 300px;
}

button {
  padding: 10px 16px;
  cursor: pointer;
}

.resultado {
  margin: 20px 0;
  font-weight: bold;
}

.cards {
  display: flex;
  gap: 16px;

  margin: 30px 0;
}

.card {
  border: 2px solid #ddd;

  padding: 20px;

  width: 220px;

  border-radius: 10px;
}

.card h2 {
  margin-bottom: 20px;
}

.scroll-box {
  height: 200px;

  overflow: auto;

  border: 2px solid black;

  padding: 10px;

  margin: 30px 0;
}

.logs {
  margin-top: 40px;

  border: 2px solid #ddd;

  padding: 20px;

  border-radius: 10px;
}

.logs-header {
  display: flex;

  justify-content: space-between;

  align-items: center;
}

ul {
  margin-top: 20px;
}

li {
  margin-bottom: 10px;
}

</style>


<!--  ---------------------------- -->


<!--  ---------------------------- -->



<!--  ---------------------------- -->



<!--  ---------------------------- -->



<!--  ---------------------------- -->



<!--  ---------------------------- -->



