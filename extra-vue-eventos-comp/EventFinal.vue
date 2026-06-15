EventFinal.vue

Buenísimo. Te dejo un apunte corto y claro de cada modificador/evento importante del ejercicio 😄

# 1. `.stop` → detener propagación

Evita que el click siga subiendo al contenedor padre.

```vue
<script setup>
const clickCard = () => {
  console.log("CLICK CARD");
};

const clickFavorito = () => {
  console.log("CLICK FAVORITO");
};
</script>

<template>
  <div class="card" @click="clickCard">

    <h2>Tarjeta</h2>

    <button @click.stop="clickFavorito">
      Favorito
    </button>

  </div>
</template>
```

## Sin `.stop`

Click en botón:

```txt
CLICK FAVORITO
CLICK CARD
```

---

## Con `.stop`

Click en botón:

```txt
CLICK FAVORITO
```

---

# 2. `.capture` → fase de captura

Hace que el padre escuche primero.

```vue
<script setup>
const captura = () => {
  console.log("CAPTURA PADRE");
};

const clickHijo = () => {
  console.log("CLICK HIJO");
};
</script>

<template>
  <section @click.capture="captura">

    <button @click="clickHijo">
      Click
    </button>

  </section>
</template>
```

---

## Normalmente

```txt
HIJO → PADRE
```

---

## Con `.capture`

```txt
PADRE → HIJO
```

---

# 3. `.once` → ejecutar una sola vez

El evento funciona solo una vez.

```vue
<script setup>
const mostrar = () => {
  console.log("SOLO UNA VEZ");
};
</script>

<template>
  <button @click.once="mostrar">
    Mostrar
  </button>
</template>
```

---

## Resultado

Primer click:

```txt
SOLO UNA VEZ
```

Segundo click:

```txt
nada
```

---

# 4. `.passive` → mejor rendimiento scroll

Le dice al navegador:

```txt
"no voy a bloquear el scroll"
```

Mejora rendimiento.

```vue
<script setup>
const onScroll = (event) => {
  console.log(event.target.scrollTop);
};
</script>

<template>
  <div 
    class="box"
    @scroll.passive="onScroll"
  >

    <p v-for="n in 50" :key="n">
      Elemento {{ n }}
    </p>

  </div>
</template>

<style scoped>
.box {
  height: 200px;
  overflow: auto;
  border: 1px solid black;
}
</style>
```

---

# 5. `.prevent` → evitar comportamiento por defecto

Evita lo normal del navegador.

```vue
<script setup>
const abrirModal = () => {
  console.log("ABRIR MODAL");
};
</script>

<template>
  <a 
    href="https://google.com"
    @click.prevent="abrirModal"
  >
    Ir a Google
  </a>
</template>
```

---

## Sin `.prevent`

El navegador navega.

---

## Con `.prevent`

NO navega.

Solo ejecuta:

```txt
ABRIR MODAL
```

---

# 6. Registro de eventos

Guardar eventos en un array reactivo.

```vue
<script setup>
import { ref } from "vue";

const eventos = ref([]);

const agregarEvento = (texto) => {
  eventos.value.unshift(texto);
};
</script>

<template>
  <button @click="agregarEvento('CLICK BOTON')">
    Click
  </button>

  <ul>
    <li v-for="(evento, index) in eventos" :key="index">
      {{ evento }}
    </li>
  </ul>
</template>
```

---

## Resultado visual

```txt
• CLICK BOTON
• CLICK BOTON
• CLICK BOTON
```

---

# RESUMEN RÁPIDO

| Modificador | Qué hace                  |
| ----------- | ------------------------- |
| `.stop`     | Detiene propagación       |
| `.capture`  | Captura primero en padre  |
| `.once`     | Ejecuta una sola vez      |
| `.passive`  | Mejora rendimiento scroll |
| `.prevent`  | Evita acción por defecto  |

















