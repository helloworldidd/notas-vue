# Estilo CSS Bootstrap Vuetify


--- 
## Indíce

- [Intro](#intro)
- [Instalación](#instalacion)
- [Estructura básica](#estructura-basica)
- [Grid (Responsive)](#grid-(responsive))
- [Breakpoints](#breakpoints)
- [Componentes](#componentes)
- [Utilidades CSS](#utilidades-css)
- [Directivas](#directivas)
- [Lo más usado](#lo-mas-usado)

<style>*{scroll-behavior: smooth}</style>



--- 
## Intro




https://vuetifyjs.com/
**Vuetify** es la implementación oficial y completa de **Material Design** para **Vue.js**


```
indice

- Instalación
- Estructura básica
- Grid (Responsive)
- Breakpoints

- Componentes
  - Botones
  - Cards
  - Inputs
  - Imágenes
  - Iconos
  - Diálogos
  - Barra superior
  - Menú lateral

- Utilidades CSS
  - Colores
  - Padding:
  - Texto centrado:
  - Flex
  - Espaciado (Gap)

- Directivas
  - Ciclos Vue
  - Condicionales Vue

- Lo más usado

```

---
## Instalación


```bash
npm i vuetify
npm i -D vite-plugin-vuetify
npm i @mdi/font
```






---
## Estructura básica

```vue
<v-app>
  <v-main>

    <v-container>

      Contenido

    </v-container>

  </v-main>
</v-app>
```




---
## Grid (Responsive)

```vue
<v-container>
  <v-row>

    <v-col cols="12" md="6">
      Columna 1
    </v-col>

    <v-col cols="12" md="6">
      Columna 2
    </v-col>

  </v-row>
</v-container>
```

---
## Breakpoints

```text
cols="12"  -> móvil
sm="6"     -> tablet
md="6"     -> notebook
lg="4"     -> desktop
xl="3"     -> grande
```

---
## Componentes

### Botones

```vue
<v-btn>
  Botón
</v-btn>
```

Color:

```vue
<v-btn color="primary">
  Guardar
</v-btn>
```

Icono:

```vue
<v-btn icon="mdi-home" />
```






### Cards

```vue
<v-card>

  <v-card-title>
    Título
  </v-card-title>

  <v-card-text>
    Contenido
  </v-card-text>

</v-card>
```





### Inputs

Texto:

```vue
<v-text-field label="Nombre" v-model="nombre" />
```



Textarea:

```vue
<v-textarea label="Mensaje" />
```

Select:

```vue
<v-select :items="['Vue','React','Angular']" />
```

Checkbox:

```vue
<v-checkbox label="Acepto" />
```

Switch:

```vue
<v-switch label="Dark Mode" />
```








### Imágenes

```vue
<v-img src="imagen.jpg" height="300" />
```




### Iconos

```vue
<v-icon>
  mdi-home
</v-icon>
```

Ejemplos:

```text
mdi-home
mdi-account
mdi-heart
mdi-cart
mdi-menu
mdi-close
mdi-magnify
mdi-email
mdi-phone
```



### Diálogos

```vue
<v-dialog v-model="dialog">

  <v-card>
    <v-card-title>
      Hola
    </v-card-title>
  </v-card>

</v-dialog>
```



### Barra superior

```vue
<v-app-bar>

  <v-app-bar-title>
    Mi App
  </v-app-bar-title>

</v-app-bar>
```


### Menú lateral

```vue
<v-navigation-drawer>

  Menú

</v-navigation-drawer>
```












---
## Utilidades CSS



### Colores

```vue
color="primary"
```

o

```html
class="bg-primary"
```

Colores principales:

```text
primary
secondary
success
warning
error
info
```

Material Design:

```text
red
blue
green
orange
purple
pink
brown
grey
```


### Padding:

```html
pa-4
```

Margin:

```html
ma-4
```

Padding horizontal:

```html
px-4
```

Padding vertical:

```html
py-4
```

### Texto centrado:

```html
text-center
```




### Flex

```html
d-flex
```

Centrar horizontal:

```html
justify-center
```

Centrar vertical:

```html
align-center
```

Todo centrado:

```html
d-flex justify-center align-center
```






### Espaciado (Gap)

```html
ga-2
ga-4
ga-6
ga-8
```

Ejemplo:

```vue
<v-row class="ga-4"></v-row>
```










---
## Directivas


### Ciclos Vue

```vue
<v-card
  v-for="item in productos"
  :key="item.id"
>
  {{ item.nombre }}
</v-card>
```


### Condicionales Vue

```vue
<v-alert
  v-if="error"
  type="error"
>
  Error
</v-alert>
```





---
## Lo más usado

  ```text
  v-container
  v-row
  v-col

  v-btn

  v-card
  v-card-title
  v-card-text

  v-text-field
  v-select
  v-checkbox

  v-icon
  v-img

  v-app-bar
  v-navigation-drawer
  v-dialog
  ```



