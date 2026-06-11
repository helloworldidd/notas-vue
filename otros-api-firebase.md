# firebase


Qué vamos a usar realmente?

Firebase tiene muchos servicios:

Firebase
├─ Authentication
├─ Firestore Database   ← vamos a usar este
├─ Storage
├─ Hosting
├─ Analytics
├─ Functions
└─ Messaging



## configuracion
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-0.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-1.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-2.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-3.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-4.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-5.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-6.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-7.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-8.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-9.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-10.jpg" width="80%">


<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-11.jpg" width="80%">

## formulario

<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-12.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-13.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-14.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-15.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-16.jpg" width="80%">
<!-- <img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-17.jpg" width="80%"> -->

<br>
<br>

src/services/firebase.js

```js

import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyCeZVIIXmzdlGOUTfu7yXl1XKUtADGAdBQ",
  authDomain: "demo8-232af.firebaseapp.com",
  projectId: "demo8-232af",
  storageBucket: "demo8-232af.firebasestorage.app",
  messagingSenderId: "456996892608",
  appId: "1:456996892608:web:b0f8a09fa659d44f7fa225"
};

const app = initializeApp(firebaseConfig);

export const db = getFirestore(app);

```

<br>    
<br>    
src/services/mensajesService.js

```js

import { collection, addDoc } from "firebase/firestore";
import { db } from "./firebase";

export const crearMensaje = async (mensaje) => {

  await addDoc(
    collection(db, "mensajes"),
    mensaje
  );

};

```

<br>
<br>

Contact.vue
```vue
<script setup>
import { ref } from "vue";
import { collection, addDoc, serverTimestamp } from "firebase/firestore";
import { db } from "./services/firebase";

const nombre = ref("");
const email = ref("");
const mensaje = ref("");

const estado = ref("");
const cargando = ref(false);

const enviarFormulario = async () => {
  estado.value = "";

  if (!nombre.value || !email.value || !mensaje.value) {
    estado.value = "Completa todos los campos";
    return;
  }

  try {
    cargando.value = true;

    await addDoc(collection(db, "mensajes"), {
      nombre: nombre.value,
      email: email.value,
      mensaje: mensaje.value,
      creadoEn: serverTimestamp()
    });

    estado.value = "Mensaje enviado correctamente";

    nombre.value = "";
    email.value = "";
    mensaje.value = "";
  } catch (error) {
    console.error("Error al guardar en Firebase:", error);
    estado.value = "Error al enviar el mensaje";
  } finally {
    cargando.value = false;
  }
};
</script>

<template>
  <h1>Formulario Firebase</h1>

  <form @submit.prevent="enviarFormulario">
    <input
      v-model.trim="nombre"
      type="text"
      placeholder="Nombre"
    >

    <br><br>

    <input
      v-model.trim="email"
      type="email"
      placeholder="Email"
    >

    <br><br>

    <textarea
      v-model.trim="mensaje"
      placeholder="Mensaje"
    ></textarea>

    <br><br>

    <button
      type="submit"
      :disabled="cargando"
    >
      {{ cargando ? "Enviando..." : "Enviar" }}
    </button>
  </form>

  <p v-if="estado">
    {{ estado }}
  </p>
</template>


```

<br>
<br>

Listado.vue

```vue
<script setup>
import { ref, onMounted } from "vue";
import { collection, getDocs } from "firebase/firestore";
import { db } from "../services/firebase";

const mensajes = ref([]);
const cargando = ref(false);
const estado = ref("");

const cargarMensajes = async () => {
  try {

    cargando.value = true;
    estado.value = "";

    const respuesta = await getDocs(
      collection(db, "mensajes")
    );

    mensajes.value = respuesta.docs
      .map((doc) => ({
        id: doc.id,
        ...doc.data()
      }))
      .sort((a, b) => {
        const fechaA = a.creadoEn?.seconds || 0
        const fechaB = b.creadoEn?.seconds || 0;
        return fechaB - fechaA;
      });
    estado.value = `${mensajes.value.length} mensajes cargados`;
  } catch (error) {
    console.error("Error al cargar mensajes:", error);
    estado.value = "Error al cargar mensajes";
  } finally {

    cargando.value = false;

  }
};

onMounted(() => {
  cargarMensajes();
});
</script>

<template>
  <h1>Mensajes Firebase</h1>

  <button @click="cargarMensajes">
    Recargar mensajes
  </button>

  <p v-if="cargando">
    Cargando...
  </p>

  <p v-if="estado">
    {{ estado }}
  </p>

  <div v-if="mensajes.length">

    <div
      v-for="mensaje in mensajes"
      :key="mensaje.id"
    >
      <h3>
        {{ mensaje.nombre }}
      </h3>

      <p>
        {{ mensaje.email }}
      </p>

      <p>
        {{ mensaje.mensaje }}
      </p>

      <small v-if="mensaje.creadoEn">
        📅
        {{
          mensaje.creadoEn
            .toDate()
            .toLocaleDateString("es-CL")
        }}
        -
        {{
          mensaje.creadoEn
            .toDate()
            .toLocaleTimeString("es-CL")
        }}
      </small>

      <small v-else>
        📅 Sin fecha
      </small>

      <hr>
    </div>

  </div>

  <p v-else-if="!cargando">
    No hay mensajes.
  </p>
</template>


```


## crud

<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-21.jpg" width="80%">
<img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-22.jpg" width="80%">


<br>
<br>

Crud.vue
```vue
<script setup>
import { ref, onMounted } from "vue";
import {
  collection,
  addDoc,
  getDocs,
  doc,
  updateDoc,
  deleteDoc,
  serverTimestamp
} from "@firebase/firestore";
import { db } from "@/services/firebase";

const productos = ref([]);

const nombre = ref("");
const precio = ref("");
const stock = ref("");

const editandoId = ref(null);
const estado = ref("");
const cargando = ref(false);

const limpiarFormulario = () => {
  nombre.value = "";
  precio.value = "";
  stock.value = "";
  editandoId.value = null;
};

const cargarProductos = async () => {
  try {
    cargando.value = true;

    const respuesta = await getDocs(collection(db, "productos"));

    productos.value = respuesta.docs.map((documento) => ({
      id: documento.id,
      ...documento.data()
    }));

    estado.value = `${productos.value.length} productos cargados`;
  } catch (error) {
    console.error("Error al cargar productos:", error);
    estado.value = "Error al cargar productos";
  } finally {
    cargando.value = false;
  }
};

const guardarProducto = async () => {
  if (!nombre.value || !precio.value || !stock.value) {
    estado.value = "Completa todos los campos";
    return;
  }

  try {
    cargando.value = true;

    if (editandoId.value) {
      await updateDoc(doc(db, "productos", editandoId.value), {
        nombre: nombre.value,
        precio: Number(precio.value),
        stock: Number(stock.value)
      });

      estado.value = "Producto actualizado";
    } else {
      await addDoc(collection(db, "productos"), {
        nombre: nombre.value,
        precio: Number(precio.value),
        stock: Number(stock.value),
        creadoEn: serverTimestamp()
      });

      estado.value = "Producto creado";
    }

    limpiarFormulario();
    await cargarProductos();
  } catch (error) {
    console.error("Error al guardar producto:", error);
    estado.value = "Error al guardar producto";
  } finally {
    cargando.value = false;
  }
};

const editarProducto = (producto) => {
  editandoId.value = producto.id;
  nombre.value = producto.nombre;
  precio.value = producto.precio;
  stock.value = producto.stock;
};

const eliminarProducto = async (id) => {
  try {
    cargando.value = true;

    await deleteDoc(doc(db, "productos", id));

    estado.value = "Producto eliminado";

    await cargarProductos();
  } catch (error) {
    console.error("Error al eliminar producto:", error);
    estado.value = "Error al eliminar producto";
  } finally {
    cargando.value = false;
  }
};

onMounted(() => {
  cargarProductos();
});
</script>

<template>
  <section>
    <h1>CRUD Productos Firebase</h1>

    <form @submit.prevent="guardarProducto">
      <input
        v-model.trim="nombre"
        type="text"
        placeholder="Nombre"
      >

      <input
        v-model.number="precio"
        type="number"
        placeholder="Precio"
      >

      <input
        v-model.number="stock"
        type="number"
        placeholder="Stock"
      >

      <button
        type="submit"
        :disabled="cargando"
      >
        {{ editandoId ? "Actualizar" : "Crear" }}
      </button>

      <button
        v-if="editandoId"
        type="button"
        @click="limpiarFormulario"
      >
        Cancelar
      </button>
    </form>

    <p v-if="estado">
      {{ estado }}
    </p>

    <p v-if="cargando">
      Cargando...
    </p>

    <hr>

    <div
      v-for="producto in productos"
      :key="producto.id"
    >
      <h3>{{ producto.nombre }}</h3>

      <p>Precio: ${{ producto.precio }}</p>
      <p>Stock: {{ producto.stock }}</p>

      <small v-if="producto.creadoEn">
        Creado:
        {{
          producto.creadoEn
            .toDate()
            .toLocaleString("es-CL")
        }}
      </small>

      <br><br>

      <button @click="editarProducto(producto)">
        Editar
      </button>

      <button @click="eliminarProducto(producto.id)">
        Eliminar
      </button>

      <hr>
    </div>
  </section>
</template>



```

<br>
<br>

Productos.vue

```vue
<script setup>
import { ref, onMounted } from "vue";
import { collection, getDocs } from "firebase/firestore";
import { db } from "../services/firebase";

const productos = ref([]);
const cargando = ref(false);
const estado = ref("");

const cargarProductos = async () => {
  try {
    cargando.value = true;
    estado.value = "";

    const respuesta = await getDocs(collection(db, "productos"));

    productos.value = respuesta.docs
      .map((doc) => ({
        id: doc.id,
        ...doc.data()
      }))
      .sort((a, b) => {
        const fechaA = a.creadoEn?.seconds || 0;
        const fechaB = b.creadoEn?.seconds || 0;

        return fechaB - fechaA;
      });

    estado.value = `${productos.value.length} productos cargados`;
  } catch (error) {
    console.error("Error al cargar productos:", error);
    estado.value = "Error al cargar productos";
  } finally {
    cargando.value = false;
  }
};

onMounted(() => {
  cargarProductos();
});
</script>

<template>
  <section>
    <h1>Lista de productos</h1>

    <button @click="cargarProductos">
      Recargar productos
    </button>

    <p v-if="cargando">
      Cargando...
    </p>

    <p v-if="estado">
      {{ estado }}
    </p>

    <div v-if="productos.length">
      <article
        v-for="producto in productos"
        :key="producto.id"
      >
        <h2>{{ producto.nombre }}</h2>

        <p>Precio: ${{ producto.precio }}</p>

        <p>Stock: {{ producto.stock }}</p>

        <small v-if="producto.creadoEn">
          Creado:
          {{
            producto.creadoEn
              .toDate()
              .toLocaleString("es-CL")
          }}
        </small>

        <small v-else>
          Sin fecha
        </small>

        <hr>
      </article>
    </div>

    <p v-else-if="!cargando">
      No hay productos.
    </p>
  </section>
</template>


```

```vue
```
<!-- <img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-23.jpg" width="80%"> -->
<!-- <img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-24.jpg" width="80%"> -->
<!-- <img src="./img-firebase/b89ae63a9c7627ec1084a8933d2a0de2-25.jpg" width="80%"> -->

