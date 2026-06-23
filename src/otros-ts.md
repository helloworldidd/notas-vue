# TypeScript

> TypeScript (TS) es una extensión de JavaScript creada por Microsoft.

> La idea principal es agregar tipos de datos para detectar errores antes de ejecutar el programa.

---

## ¿Qué aporta TypeScript?

JavaScript:

```js
const nombre = 'Patricio'
const edad = 42
```

TypeScript:

```ts
const nombre: string = 'Patricio'
const edad: number = 42
```

Ahora el editor sabe qué tipo de dato debe existir.

---

## Variables

```ts
const nombre: string = 'Patricio'
const edad: number = 42
const activo: boolean = true
```

Arrays:

```ts
const nombres: string[] = ['Ana', 'Juan', 'Pedro']

const precios: number[] = [1000, 2000, 3000]
```

---

## Objetos

JavaScript:

```js
const usuario = {
  nombre: 'Patricio',
  edad: 42
}
```

TypeScript:

```ts
const usuario: {
  nombre: string
  edad: number
} = {
  nombre: 'Patricio',
  edad: 42
}
```

---

## Funciones

JavaScript:

```js
function sumar(a, b) {
  return a + b
}
```

TypeScript:

```ts
function sumar(a: number, b: number): number {
  return a + b
}
```

---

## Interfaces

Muy usadas en Vue.

```ts
interface Producto {
  id: number
  nombre: string
  precio: number
}
```

Luego:

```ts
const producto: Producto = {
  id: 1,
  nombre: 'Aros Cherry',
  precio: 12000
}
```

---

## Vue + TypeScript

<br>
<br>

### Activar TS

```vue
<script setup lang="ts">
</script>
```


<br>
<br>

### ref()

JavaScript:

```js
const contador = ref(0)
```

TypeScript:

```ts
const contador = ref<number>(0)
```

Otro ejemplo:

```ts
const nombre = ref<string>('')
```

<br>
<br>

### Props

JavaScript:

```vue
<script setup>
defineProps({
  nombre: String,
  edad: Number
})
</script>
```

TypeScript:

```vue
<script setup lang="ts">
defineProps<{
  nombre: string
  edad: number
}>()
</script>
```

Uso:

```vue
<CardComponent
  nombre="Patricio"
  :edad="42"
>
</CardComponent>
```

Si haces:

```vue
<CardComponent
  nombre="Patricio"
  edad="42"
>
</CardComponent>
```

TypeScript avisará que debería ser un número.

<br>
<br>

### Emits

JavaScript:

```js
const emit = defineEmits(['guardar'])
```

TypeScript:

```ts
const emit = defineEmits<{
  guardar: [id: number]
}>()
```

Uso:

```ts
emit('guardar', 10)
```

Error:

```ts
emit('guardar', '10')
```

<br>
<br>

### Computed

```ts
const precio = ref(1000)

const iva = computed<number>(() => {
  return precio.value * 0.19
})
```

<br>
<br>

### API

Muy útil.

```ts
interface Usuario {
  id: number
  name: string
  email: string
}
```

```ts
const usuarios = ref<Usuario[]>([])
```

```ts
const response = await fetch(url)

usuarios.value = await response.json()
```

Ahora VS Code autocompleta:

```ts
usuarios.value[0].email
```

<br>
<br>

### Pinia

```ts
interface Producto {
  id: number
  nombre: string
  precio: number
}
```

```ts
const productos = ref<Producto[]>([])
```

```ts
const total = computed(() =>
  productos.value.reduce(
    (sum, p) => sum + p.precio,
    0
  )
)
```

