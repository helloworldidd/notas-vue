<script setup>

const mostrarMensaje = () => {
  alert("Evento activado 😎");
};


const padre = () => {
  console.log("PADRE");
};

const hijo = () => {
  console.log("HIJO");
};





const captura = () => {
  console.log("CAPTURE 😎");
};

const selfClick = () => {
  alert("Click directo en el DIV");
};

const scrollEvento = () => {
  console.log("SCROLL PASSIVE");
};

const leftClick = () => {
  alert("Click izquierdo");
};

const rightClick = () => {
  alert("Click derecho");
};

const middleClick = () => {
  alert("Click rueda mouse");
};

</script>

<template>

  <!-- PREVENT -->
  <form @submit.prevent="mostrarMensaje">
    <button>
      Submit prevent
    </button>
  </form>



  <!-- STOP -->
  <div
    class="padre"
    @click="padre"
  >

    <button @click.stop="hijo">
      Sin stop
    </button>

  </div>




  <!-- ONCE -->
  <button @click.once="mostrarMensaje">
    Solo una vez
  </button>



  <!-- ENTER -->
  <input
    @keyup.enter="mostrarMensaje"
    placeholder="Presiona Enter"
  >



  <!-- ESC -->
  <input
    @keydown.esc="mostrarMensaje"
    placeholder="Presiona ESC"
  >






  









  <script setup>
const abrirCard = () => {
  console.log("CARD");
};

const clickBoton = () => {
  console.log("BOTON");
};

</script>

<template>
  <div class="card" @click.capture="abrirCard">
    <h2>Card Capture 😎</h2>
    <button @click="clickBoton">
      Click
    </button>
  </div>
</template>
<style scoped>
.card {
  border: 3px solid black;
  padding: 20px;
  width: 300px;
}
button {
  margin-top: 20px;
  padding: 10px;
}
</style>









<script setup>
const accion = (texto) => {
  alert(texto);
};
</script>

<template>
  <!-- =========================
       TECLAS SIMPLES
  ========================== -->
  <input
    @keyup.enter="accion('ENTER 😎')"
    placeholder="ENTER"
  >
  <input
    @keydown.esc="accion('ESC 👀')"
    placeholder="ESC"
  >
  <input
    @keydown.tab="accion('TAB 🔥')"
    placeholder="TAB"
  >
  <input
    @keydown.space="accion('SPACE 🚀')"
    placeholder="SPACE"
  >
  <input
    @keydown.delete="accion('DELETE ❌')"
    placeholder="DELETE"
  >
  <input
    @keydown.up="accion('FLECHA ARRIBA ⬆️')"
    placeholder="FLECHA ARRIBA"
  >
  <input
    @keydown.down="accion('FLECHA ABAJO ⬇️')"
    placeholder="FLECHA ABAJO"
  >
  <input
    @keydown.left="accion('FLECHA IZQUIERDA ⬅️')"
    placeholder="FLECHA IZQUIERDA"
  >
  <input
    @keydown.right="accion('FLECHA DERECHA ➡️')"
    placeholder="FLECHA DERECHA"
  >



  <!-- =========================
       MODIFICADORAS
  ========================== -->

  <input
    @keydown.ctrl="accion('CTRL 😎')"
    placeholder="CTRL"
  >
  <input
    @keydown.shift="accion('SHIFT 👀')"
    placeholder="SHIFT"
  >
  <input
    @keydown.alt="accion('ALT 🔥')"
    placeholder="ALT"
  >
  <input
    @keydown.meta="accion('META 🚀')"
    placeholder="META"
  >



  <!-- =========================
       COMBINACIONES
  ========================== -->

  <input
    @keydown.ctrl.k="accion('CTRL + K 😎')"
    placeholder="CTRL + K"
  >
  <input
    @keydown.ctrl.enter="accion('CTRL + ENTER 🔥')"
    placeholder="CTRL + ENTER"
  >
  <input
    @keydown.shift.enter="accion('SHIFT + ENTER 👀')"
    placeholder="SHIFT + ENTER"
  >
  <input
    @keydown.alt.enter="accion('ALT + ENTER 🚀')"
    placeholder="ALT + ENTER"
  >

  <input
    @keydown.ctrl.shift.k="accion('CTRL + SHIFT + K 🤯')"
    placeholder="CTRL + SHIFT + K"
  >



  <!-- =========================
       MOUSE
  ========================== -->

  <button
    @click.left="accion('CLICK IZQUIERDO 😎')"
  >
    Click izquierdo
  </button>

  <button
    @click.right.prevent="accion('CLICK DERECHO 👀')"
  >
    Click derecho
  </button>

  <button
    @click.middle="accion('CLICK RUEDA 🔥')"
  >
    Click rueda mouse
  </button>

</template>

<style scoped>

input {
  display: block;

  margin: 12px 0;

  padding: 10px;

  width: 300px;
}

button {
  margin: 10px;

  padding: 10px 16px;
}

</style>






































</template>

<style scoped>

.padre {
  padding: 20px;
  border: 2px solid black;
  margin: 20px 0;
}

button,
input {
  margin: 10px;
  padding: 10px;
}

</style>