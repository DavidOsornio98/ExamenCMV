<template>
  <v-app>
    <v-main>
      <CrudClientes />
    </v-main>
  </v-app>
</template>

<script>
import CrudClientes from './pages/CrudClientes.vue';

export default {
  name: 'App',

  components: {
    CrudClientes,
  },

  data: () => ({
    //
  }),
};
</script>
