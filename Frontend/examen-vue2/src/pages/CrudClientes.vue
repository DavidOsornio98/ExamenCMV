<template>
  <!-- Se crea tabla dinamica, los elementos se encuentran en el arreglo deserts -->
  <v-data-table
    :headers="headers"
    :items="desserts"
    sort-by="calories"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title> CRUD CLIENTES CMV</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <!-- dialogo que se estara ocultando o mostrando -->
        <v-dialog v-model="dialog" max-width="500px">
          <template v-slot:activator="{ on, attrs }">
            <!-- boton para la alta de clientes -->
            <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
              Alta Cliente
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>
            <!-- tarjeta que nos sirve para actualizar registros o dar de alta uno nuevo -->
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.nombre"
                      label="Nombre"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.apellido_paterno"
                      label="Apellido Paterno"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.apellido_materno"
                      label="Apellido Materno"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.rfc"
                      label="RFC"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.curp"
                      label="CURP"
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>
            <!-- Accion de guardar o cancelar que contiene la tarjeta para modificar registros o dar de alta -->
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close"> Cancel </v-btn>
              <v-btn color="blue darken-1" text @click="save"> Save </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <!-- Dialogo para eliminar un registro -->
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5"
              >Estas seguro de elimar el registro?</v-card-title
            >
            <v-card-actions>
              <v-spacer></v-spacer>
              <!-- Boton que cierra el dialogo sin realizar modificaciones -->
              <v-btn color="blue darken-1" text @click="closeDelete"
                >Cancel</v-btn
              >
              <!-- Boton que confirma la eliminacion de registro y ejecuta la peticion -->
              <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                >OK</v-btn
              >
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <!-- Dialogo que muestra la informacion completa de un usuario -->
        <v-dialog v-model="dialogInfo" max-width="500px">
          <v-card>
            <li v-for="(value, key, index) in infoC" :key="index">
              {{ key }} : {{ value }}
            </li>
            <v-card-actions>
              <v-spacer></v-spacer>

              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <!-- Acciones que tiene cada registro -->
    <template v-slot:item.actions="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
      <v-icon small @click="infoItem(item)"> mdi-information-outline </v-icon>
      <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize"> Reset </v-btn>
    </template>
  </v-data-table>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    dialog: false,
    dialogDelete: false,
    dialogInfo: false,
    idCliente: null,
    idClienteEliminar: null,
    // Encabezados de la tabla, text contiene el nombre que se muestra como titulo en cada columna
    // y value muestra los valores ubicados en el arreglo desserts
    headers: [
      {
        text: "ID Cliente",
        align: "start",
        sortable: false,
        value: "id_cliente",
      },
      { text: "Nombre", value: "nombre" },
      { text: "Apellido Paterno", value: "apellido_paterno" },
      { text: "Apellido Materno", value: "apellido_materno" },
      { text: "RFC", value: "rfc" },
      { text: "CURP", value: "curp" },
      { text: "FECHA ALTA", value: "fecha_alta" },
      { text: "Actions", value: "actions", sortable: false },
    ],

    desserts: [], //se llena con la consulta y se almacenan todos los clientes
    infoC: [], //se almacenan los resultados de la peticion de info de clientes
    editedIndex: -1,
    editedItem: {
      nombre: "",
      apellido_paterno: "",
      apellido_materno: "",
      rfc: "",
      curp: "",
    },
    defaultItem: {
      name: "",
      calories: 0,
      fat: 0,
      carbs: 0,
      protein: 0,
    },
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Item" : "Edit Item";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
    dialogInfo(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize(); //Se cargan todos los clientes
  },

  methods: {
    initialize() {
      //peticion http para obtener clientes
      axios.get("http://localhost:4000/clientes").then((response) => {
        this.desserts = response.data;
      });
    },

    editItem(item) {
      //Funcion para edicar la info de clientes
      const { id_cliente } = item;
      this.idCliente = id_cliente;

      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      //Funcion que activa el dialogo para eliminar cliente y obtiene su id
      const { id_cliente } = item;
      this.idClienteEliminar = id_cliente;
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },
    infoItem(item) {
      //peticion http para obtener la info completa de los clientes
      const { id_cliente } = item;
      axios
        .get(`http://localhost:4000/clientes/${id_cliente}`)
        .then((response) => {
          this.infoC = response.data;
        });
      this.dialogInfo = true;
    },

    deleteItemConfirm() {
      //se confirma y se procede a eliminar el registro de cliente
      this.desserts.splice(this.editedIndex, 1);
      this.closeDelete();
      console.log(this.idClienteEliminar);
      axios
        .delete(`http://localhost:4000/clientes/${this.idClienteEliminar}`)
        .then((response) => {});
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      //peticion http guardar los cambios de la actualizacion de datos de cliente
      // o para crear nuevo registro
      if (this.editedIndex > -1) {
        const { nombre, apellido_paterno, apellido_materno, rfc, curp } =
          this.editedItem;

        let put = {
          nombre: nombre,
          apellido_paterno: apellido_paterno,
          apellido_materno: apellido_materno,
          rfc: rfc,
          curp: curp,
        };
        axios
          .put(`http://localhost:4000/clientes/${this.idCliente}`, put)
          .then((response) => {})
          .catch((e) => {
            console.error(e);
          });
        Object.assign(this.desserts[this.editedIndex], this.editedItem);
      } else {
        this.desserts.push(this.editedItem);
        const { nombre, apellido_paterno, apellido_materno, rfc, curp } =
          this.editedItem;
        let post = {
          nombre: nombre,
          apellido_paterno: apellido_paterno,
          apellido_materno: apellido_materno,
          rfc: rfc,
          curp: curp,
        };

        axios.post(`http://localhost:4000/clientes`, post).then((response) => {
          console.log(response);
        });
      }
      this.close();
    },
  },
};
</script>

<style></style>
