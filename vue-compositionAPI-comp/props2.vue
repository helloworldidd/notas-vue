<script setup>
  defineProps({

  titulo: {
    type: String,
    required: true
  },

  texto: {
    type: String,
    default: "Texto vacío"
  },

  edad: {
    type: Number,
    default: 18
  },

  activo: {
    type: Boolean,
    default: false
  }

});
  
</script>