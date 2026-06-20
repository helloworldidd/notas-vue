# Promise.all()
sirve para ejecutar varias promesas al mismo tiempo y esperar a que todas terminen.




## Código

Sin `Promise.all`: espera una, luego la otra, luego la otra.

```js
const usuarios = await fetch('/usuarios');
const productos = await fetch('/productos');
const categorias = await fetch('/categorias');
```


Con `Promise.all`, Ahora las 3 peticiones parten al mismo tiempo.

```js
const [usuarios, productos, categorias] = await Promise.all([
  fetch('/usuarios'),
  fetch('/productos'),
  fetch('/categorias')
]);
```




## Explicaciópn

```txt
Sin Promise.all

Usuarios    █████
Productos         █████
Categorías              █████

Tiempo total: 15s
```

```txt
Con Promise.all

Usuarios    █████
Productos   █████
Categorías  █████

Tiempo total: 5s
```

---

## Con Axios

```js
import axios from 'axios';

const [usersRes, postsRes] = await Promise.all([
  axios.get('/users'),
  axios.get('/posts')
]);

console.log(usersRes.data);
console.log(postsRes.data);
```


---

## Con Fetch

```js
const [usersRes, postsRes] = await Promise.all([
  fetch('https://jsonplaceholder.typicode.com/users'),
  fetch('https://jsonplaceholder.typicode.com/posts')
]);

const [users, posts] = await Promise.all([
  usersRes.json(),
  postsRes.json()
]);

console.log(users);
console.log(posts);
```

Fíjate que aquí usamos `Promise.all` dos veces:

1. Para esperar los `fetch`.
2. Para esperar los `.json()`.

---

## ¿Qué pasa si una falla?

```js
await Promise.all([
  Promise.resolve('A'),
  Promise.reject('Error'),
  Promise.resolve('C')
]);
```

Resultado:

```js
Error
```

Se rechaza todo inmediatamente.

Por eso suele usarse:

```js
try {
  const datos = await Promise.all([
    api.getUsers(),
    api.getProducts(),
    api.getCategories()
  ]);

  console.log(datos);
}
catch (error) {
  console.error(error);
}
```

---

## Alternativa: Promise.allSettled

Si quieres que continúe aunque una falle:

```js
const resultado = await Promise.allSettled([
  Promise.resolve('OK'),
  Promise.reject('Error')
]);

console.log(resultado);
```

Salida:

```js
[
  {
    status: 'fulfilled',
    value: 'OK'
  },
  {
    status: 'rejected',
    reason: 'Error'
  }
]
```

---

## Ejemplo real en Vue

```vue
<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const users = ref([]);
const posts = ref([]);

onMounted(async () => {
  try {
    const [usersRes, postsRes] = await Promise.all([
      axios.get('https://jsonplaceholder.typicode.com/users'),
      axios.get('https://jsonplaceholder.typicode.com/posts')
    ]);

    users.value = usersRes.data;
    posts.value = postsRes.data;
  }
  catch (error) {
    console.error(error);
  }
});
</script>
```

Este es probablemente el uso más frecuente de `Promise.all` en Vue: cargar varios recursos de una API cuando se monta una vista.
