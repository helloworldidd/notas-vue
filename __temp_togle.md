

### TOGGLE

```vue
<script setup>
import { ref } from 'vue'

const fav = ref(false)

const toggleFav = () => {
  fav.value = !fav.value
}
</script>

<template>
  <button @click="toggleFav">
    {{ fav ? '❤️' : '🤍' }}
  </button>
</template>
```
