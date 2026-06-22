# Formularios

_v-model_

---

## Índice

- [Formulario Simple](#formulario-simple)
- [Formulario Objeto](#formulario-objeto)
- [Formulario Object Full](#formulario-object-full)



<br>
<br>
<br>
<br>
<br>
<br>

---

## Formulario Simple

```vue
<script setup>
import { ref } from "vue";

const nombre = ref("");
const email = ref("");

const enviarFormulario = () => {
  console.log("Nombre:", nombre.value);
  console.log("Email:", email.value);
};
</script>

<template>
  <form @submit.prevent="enviarFormulario">
    <label>Nombre</label>
    <input type="text" v-model="nombre" />

    <label>Email</label>
    <input type="email" v-model="email" />

    <button type="submit">Enviar</button>
  </form>

  <p>Nombre escrito: {{ nombre }}</p>
  <p>Email escrito: {{ email }}</p>
</template>
```




<br>
<br>
<br>
<br>
<br>
<br>

---

## Formulario Objeto

```vue
<script setup>
import { reactive } from "vue";

const formulario = reactive({
  nombre: "",
  email: "",
  mensaje: "",
});

const enviarFormulario = () => {
  console.log(formulario);
};
</script>

<template>
  <form @submit.prevent="enviarFormulario">
    <input v-model="formulario.nombre" placeholder="Nombre" />
    <input v-model="formulario.email" placeholder="Email" />
    <textarea v-model="formulario.mensaje" placeholder="Mensaje"></textarea>

    <button type="submit">Enviar</button>
  </form>
</template>
```




<br>
<br>
<br>
<br>
<br>
<br>

---

## Formulario Object Full

```vue
<script setup>
import { reactive } from "vue";

const formulario = reactive({
  nombre: "",
  email: "",
  edad: "",
  pais: "",
  nivel: "",
  intereses: [],
  aceptaTerminos: false,
  mensaje: "",
});

const enviarFormulario = () => {
  console.log("Formulario enviado:", formulario);
};
</script>

<template>
  <form @submit.prevent="enviarFormulario">
    <h2>Formulario de registro</h2>

    <label>Nombre</label>
    <input v-model="formulario.nombre" type="text" placeholder="Tu nombre" />

    <label>Email</label>
    <input v-model="formulario.email" type="email" placeholder="tu@email.com" />

    <label>Edad</label>
    <input v-model="formulario.edad" type="number" placeholder="Edad" />

    <label>País</label>
    <select v-model="formulario.pais">
      <option value="">Selecciona un país</option>
      <option value="Chile">Chile</option>
      <option value="Argentina">Argentina</option>
      <option value="Perú">Perú</option>
      <option value="México">México</option>
    </select>

    <h3>Nivel</h3>

    <label>
      <input v-model="formulario.nivel" type="radio" value="Principiante" />
      Principiante
    </label>

    <label>
      <input v-model="formulario.nivel" type="radio" value="Intermedio" />
      Intermedio
    </label>

    <label>
      <input v-model="formulario.nivel" type="radio" value="Avanzado" />
      Avanzado
    </label>

    <h3>Intereses</h3>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="Vue" />
      Vue
    </label>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="CSS" />
      CSS
    </label>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="UX/UI" />
      UX/UI
    </label>

    <label>
      <input v-model="formulario.intereses" type="checkbox" value="APIs" />
      APIs
    </label>

    <label>
      <input v-model="formulario.aceptaTerminos" type="checkbox" />
      Acepto términos y condiciones
    </label>

    <label>Mensaje</label>
    <textarea
      v-model="formulario.mensaje"
      placeholder="Escribe un mensaje"
    ></textarea>

    <button type="submit">Enviar</button>
  </form>

  <h3>Datos guardados en Vue</h3>
  <pre>{{ formulario }}</pre>
</template>

<style scoped>
form {
  max-width: 500px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

input,
select,
textarea,
button {
  padding: 10px;
}
</style>
```




