oo   oo  ooooooo           oo       ooooooo  
ooo ooo      oo            oo       oo   oo  
ooooooo     oo             oo          ooo   
oo   oo   oo               oo        ooo     
oo   oo  oo                ooooooo  ooooooo  







<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const usuarios = ref([])
const cargando = ref(false)
const error = ref('')

const obtenerUsuarios = async () => {
  cargando.value = true

  try {
    const response = await axios.get(
      'https://reqres.in/api/users?page=1',
      {
        headers: {
          'x-api-key': 'reqres-free-v1'
        }
      }
    )

    usuarios.value = response.data.data

    console.log('Usuarios cargados')
    console.table(usuarios.value)
  }
  catch (err) {
    console.error('Error al consumir API', err)
    error.value = 'No fue posible obtener los usuarios'
  }
  finally {
    cargando.value = false
  }
}

onMounted(() => {
  obtenerUsuarios()
})
</script>

<template>
  <h1>Usuarios Reqres</h1>

  <p v-if="cargando">
    Cargando...
  </p>

  <p v-if="error">
    {{ error }}
  </p>

  <div
    v-for="usuario in usuarios"
    :key="usuario.id"
  >
    <h3>
      {{ usuario.first_name }} {{ usuario.last_name }}
    </h3>

    <p>
      {{ usuario.email }}
    </p>

    <img
      :src="usuario.avatar"
      :alt="usuario.first_name"
      width="80"
    >

    <hr>
  </div>
</template>










<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

const usuarios = ref([]);
const cargando = ref(false);
const error = ref("");

const obtenerUsuarios = async () => {
  cargando.value = true;

  try {
    const response = await axios.get(
      "https://jsonplaceholder.typicode.com/users",
      {},
    );

    usuarios.value = response.data;

    console.log("Usuarios cargados");
    console.table(usuarios.value);
  } catch (err) {
    console.error("Error al consumir API", err);
    error.value = "No fue posible obtener los usuarios";
  } finally {
    cargando.value = false;
  }
};

onMounted(() => {
  obtenerUsuarios();
});
</script>

<template>
  <h1>Usuarios Reqres</h1>

  <p v-if="cargando">Cargando...</p>

  <p v-if="error">
    {{ error }}
  </p>

  <div v-for="usuario in usuarios" :key="usuario.id">
    <h3>
      {{ usuario.name }}
    </h3>

    <p>
      {{ usuario.email }}
    </p>

    <hr />
  </div>
</template>


