<script setup>




const mostarAlerta = () => {
  alert("click");
};



</script>

<template>

  <h2>CLICK</h2>

  <button v-on:click="mostarAlerta">click</button>
  <button @click="mostarAlerta">click</button>
  <hr>


  <h2>DOBLE CLICK</h2>
  <button @dblclick="mostarAlerta">doble click</button>
  <hr>


  <h2>MOUSE MOVE</h2>
  <div class="box" @mouseenter="mostarAlerta">hover</div>
  <hr>

  <h2>MOUSE LEAVE</h2>
  <div class="box" @mouseleave="mostarAlerta">salir</div>
  <hr>

  <h2>MOUSE OVER</h2>
  <div class="box" @mouseover="mostarAlerta">entrar</div>
  <hr>

  <h2>MOUSE OUT</h2>
  <div class="box" @mouseout="mostarAlerta">salir</div>
  <hr>

  <h2>mouse wheel</h2>
  <div class="box" @wheel="mostarAlerta">scroll</div>
  <hr>

  <h2>INPUT</h2>
  <input @input="mostarAlerta">
  <hr>


  <h2>CHANGE</h2>
  <input @change="mostarAlerta">
  <hr>

  <h2>KEYDOWN</h2>
  <input @keydown="mostarAlerta">
  <hr>

  <h2>KEYUP</h2>
  <input @keyup="mostarAlerta">
  <hr>

  <h2>Focus</h2>
  <input @focus="mostarAlerta">
  <hr>

  <h2>Focus</h2>
  <input @focus="mostarAlerta">
  <hr>

  <h2>Blur</h2>
  <input @blur="mostarAlerta">
  <hr>

  <h2>SUBMIT</h2>  
  <form @submit.prevent="mostarAlerta">
    <button>
      enviar
    </button>
  </form>
  <hr>

  <h2>ENTER</h2>
  <input @keyup.enter="mostarAlerta">
  <hr>

  <h2>ESC</h2>
  <input @keydown.esc="mostarAlerta">
  <hr>

  <h2>CTRL + K</h2>
  <input @keydown.ctrl.k="mostarAlerta">
  <hr>
  
  <h2>CTRL + SHIFT + K</h2>
  <input @keydown.ctrl.shift.k="mostarAlerta">
  <hr>
  
  <h2>CTRL + ALT + K</h2>
  <input @keydown.ctrl.alt.k="mostarAlerta">
  <hr>



  <h2>CLICK DERECHO</h2>
  <div @contextmenu.prevent="mostarAlerta">
    click derecho
  </div>
  <hr>

  









</template>

<style scoped>

.box {
  width: 200px;
  height: 200px;
  background-color: rgb(180, 218, 218);
}



</style>