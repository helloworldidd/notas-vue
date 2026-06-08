<!-- App.vue ---------------------------- -->



<script setup>
import { reactive, computed } from "vue";

const niveles = ["Junior", "Semi Senior", "Senior"];

const interesesDisponibles = ["Frontend", "Backend", "UX/UI", "Videojuegos"];

const paises = [
  { code: "CL", name: "Chile" },
  { code: "AR", name: "Argentina" },
  { code: "MX", name: "México" },
];

const tecnologiasDisponibles = ["Vue", "React", "Angular", "Svelte"];

// el estado del formulario
const formulario = reactive({
  nombre: "",
  edad: null,
  bio: "",
  nivel: "",
  intereses: [],
  pais: null,
  tecnologias: [],
});


// validación reactiva usand
const formularioValido = computed(() => {
  return (
    formulario.nombre.trim() !== "" &&
    formulario.edad >= 0 &&
    formulario.edad <= 120 &&
    formulario.intereses.length > 0
  );
});


// Funcion para enviar el formulario
const enviarFormulario = () => {
  alert("Formulario enviado");
  // Convierte objeto JavaScript en texto JSON
  console.log(JSON.stringify(formulario, null, 2));
};

</script>









<template>

    <h1>Registro de Perfil</h1>
      
    
      <!-- @submit envio formulario -->
      <!-- cancela el comportamiento por defecto -->
      <form class="formulario" @submit.prevent="enviarFormulario">
        <h2>Formulario</h2>
        <div>
          <label for="nombre">Nombre</label>
          <!-- v-model con modificador .trim  -->
          <!-- clase dinámica con :class -->
          <input
          id="nombre"
          type="text"
          v-model.trim="formulario.nombre"
          :class="{ error: formulario.nombre === '' }"
          />
        </div>

        <div>
          <label for="edad">Edad</label>
          <input
          id="edad"
          type="number"
          v-model.number="formulario.edad"
          min="18"
          max="80"
          />
        </div>

        <div>
          <label for="bio">Biografía</label>
          <textarea id="bio" v-model.lazy="formulario.bio"></textarea>
          <span>Caracteres: {{ formulario.bio.length }}</span>
        </div>

        <div>
          <p>Nivel</p>
          <label :for="nivel" v-for="nivel in niveles" :key="nivel">
            <input :id="nivel" type="radio" v-model="formulario.nivel" :value="nivel" />
            <span>{{ nivel }}</span>
            <br />
          </label>
        </div>
          
        <div>
          <p>Intereses</p>
          <label :for="ininteres" v-for="interes in interesesDisponibles" :key="interes">
            <input
            :id="interes"
            type="checkbox"
            v-model="formulario.intereses"
            :value="interes"
            />
            
            {{ interes }}
            <br />
          </label>
        </div>
        
        <div>
          <label for="pais">País</label>          
          <select id="pais"  v-model="formulario.pais">
            <option :value="null">Selecciona un país</option>
            <option v-for="pais in paises" :key="pais.code" :value="pais">
              {{ pais.name }}
            </option>
          </select>
        </div>
  
        <div>
          <label for="tecnologias">Tecnologías</label>
            <select id="tecnologias" multiple v-model="formulario.tecnologias">
              <option v-for="tec in tecnologiasDisponibles" :key="10 + tec" :value="tec">
                {{ tec }}
              </option>
            </select> 
        </div>
        
        <button :disabled="!formularioValido">Enviar</button>

      </form>

 

    <div class="resumen">
      <h2>Resumen en tiempo real</h2>
      <div><strong>Nombre:</strong> {{ formulario.nombre }}</div>
      <div><strong>Edad:</strong> {{ formulario.edad }}</div>
      <div><strong>Nivel:</strong> {{ formulario.nivel }}</div>
      <div><strong>País:</strong> {{ formulario.pais?.name }}</div>
      <div><strong>Intereses:</strong>
        <ul>
          <li v-for="interes in formulario.intereses" :key="interes"> 
            {{ interes }}
          </li>
        </ul>
      </div> 
      <div><strong>Tecnologías:</strong>
        <ul>
          <li v-for="tec in formulario.tecnologias" :key="tec">
            {{ tec }}
          </li>
        </ul>
      </div>  
      <div><strong>Biografía:</strong> {{ formulario.bio }}</div>
    </div>  
    
  </template>

<style scoped>


.formulario {
  display: inline-block;
  vertical-align: top;
  width: 40%;
  margin: 0 5%;
  background: #bcd4dc;
  padding: 10px;
  border-radius: 20px;
}    
.formulario div {
  margin-bottom: 20px;
  border: 1px solid #bdbadd;
}

.formulario input {
  padding: 8px;
  font-size: 13px;
}

.formulario input[type="radio"],
.formulario input[type="checkbox"] {
  width: auto;
  margin: 8px 8px 8px 0px; ;
}

.formulario select {
  padding: 8px;
  font-size: 13px;
  margin: 0 8px;
  vertical-align: top;
}
.formulario option {
  padding: 4px;
}

.resumen {
  display: inline-block;
  vertical-align: top;
  background: #dacc9e;
  width: 40%;
  margin: 0 5%;
  padding: 20px;
  box-sizing: border-box;
}

.resumen ul {
  margin: 8px;
  list-style-position: inside;
}



.resumen div {
  margin-bottom: 20px;
  border: 2px dashed #8c8a6d;
}


.error {
  border: 2px solid red;
}


input{
  width: 100%;
  border: 1px solid #000;
}
textarea{
  border: 1px solid #000;
  width: 100%;
  min-height: 100px;
  font-size: 13px;
  font-family: sans-serif;
  padding: 10px;
  box-sizing: border-box;
}
h1 {
  text-align: center;
  margin-bottom: 40px;
  color: #123a71;
}  
h2 {
  margin-bottom: 20px;
  padding: 4px;
  font-size: 16px;
  color: #333;
}  

/*

.container {
  padding: 40px;
  background: #aedce4;
  min-height: 100vh;
}  



h3{
  color: #1764cf;
  font-size: 14px;
}  
label {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  color: #1764cf;
  font-size: 13px;
  border: 1px solid #1764cf;
}  

.note{
  font-size: 80%;
  font-weight: bold;
  color: #1764cf;
}  








.layout {
  display: flex;
  gap: 40px;
  align-items: flex-start;
}  

.formulario {
  background: white;
  padding: 24px;
  border-radius: 16px;
  width: 420px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}  


input[type="text"]{
  width: 100%;
}  

input[type="radio"]{
  margin-right: 8px;
}  

input[type="checkbox"]{
  margin-right: 8px;
}  

select{
  width: 100%;
}  

textarea {
  min-height: 100px;
  resize: none;
  width: 100%;
}  

button {
  padding: 12px 20px;
  border: none;
  background: #42b883;
  color: white;
  border-radius: 8px;
  cursor: pointer;
}  

button:disabled {
  background: gray;
  cursor: not-allowed;
}  


.block {
  display: block;
  border: 2px solid #000;
  margin-bottom: 2px;
}









.resumen {
  background: #cfbe66;
  padding: 24px;
  border-radius: 16px;
  width: 420px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.resumen p {
  margin: 8px;
  border: 1px dashed #000;
}

.resumen ul {
  position: relative;
}

.resumen ul li {
  margin-left: 24px;
  font-size: 14px;
  opacity: 0.6;
}

 */

</style>



<!--  ---------------------------- -->


<!--  ---------------------------- -->



<!--  ---------------------------- -->



<!--  ---------------------------- -->



<!--  ---------------------------- -->



<!--  ---------------------------- -->



