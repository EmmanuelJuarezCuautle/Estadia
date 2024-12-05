
<template>
  <div class="container mt-4">
    <h2 class="letra1">Gestión de Administradores</h2>
    <div class="text-left mb-4">
      <button class="btn btn-add btn-sm" @click="openForm">
        <i class="fa-solid fa-square-plus" style="margin-right: 10px;"></i> Agregar
      </button>
    </div>
    <div v-if="showForm" class="modal-overlay" @click.self="cancelForm">
      <div class="card modal-content">
        <div class="card-header">
          <h4 class="mb-4">{{ editMode ? 'Editar Agencia' : 'Agregar Agencia' }}</h4>
        </div>
        <div class="card-body">
          <form @submit.prevent="guardarAgencia">

            <div class="form-group">
              <label for="nombre_admin">Nombre Administrador</label>
              <input 
                type="text"
                id="nombre_admin"
                v-model="formData.nombre_admin"
                class="form-control"
                placeholder="Nombre de la agencia"
                required/>
            </div>
            <div class="form-group">
              <label for="correo_admin">Correo</label>
              <input 
                type="text"
                id="correo_admin"
                v-model="formData.correo_admin"
                class="form-control"
                placeholder="Nombre de la agencia"
                required/>
            </div>
            <div class="form-group" v-if="!editMode">
              <label for="password">Contraseña</label>
              <input 
                type="text"
                id="password"
                v-model="formData.password"
                class="form-control"
                placeholder="Ingresa una contraseña"
                required
              />
</div>

            <div class="form-group">
              <label for="activo">Activo</label>
              <input 
                type="text"
                id="activo"
                v-model="formData.activo"
                class="form-control"
                placeholder="Nombre de la agencia"
                required/>
            </div>
            <div class="form-group">
              <label for="tipo_admin">Tipo Administrador</label>
              <input 
                type="text"
                id="tipo_admin"
                v-model="formData.tipo_admin"
                class="form-control"
                placeholder="Nombre de la agencia"
                required/>
            </div>


            <div class="text-center" >
              <button type="submit" class="btn btn-success mr-2">
                <i class="fa-solid fa-check "></i> Guardar
              </button>
              <button type="button" class="btn btn-secondary" style="color: brown; border-color: brown;"
               @click="cancelForm">
                <i class="fa-solid fa-times"></i>Cancelar
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped table-hover text-center">
        <thead class="thead-dark">
          <tr>
            <th scope="col" style="width: 5%;">#</th>
            <th scope="col" style="width: 60%;">Nombre</th>
            <th scope="col" style="width: 60%;">Correo</th>
            <th scope="col" style="width: 60%;">Activo</th>
            <th scope="col" style="width: 60%;">Tipo</th>
            <th scope="col" style="width: 35%;">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="administrador in administradores" :key="administrador.id_admin">
            <td>{{ administrador.id_admin }}</td>
            <td>{{ administrador.nombre_admin }}</td>
            <td>{{ administrador.correo_admin }}</td>
            <td>{{ administrador.activo }}</td>
            <td>{{ administrador.tipo_admin }}</td>


            <td class="td-actions">
              <button class="btn btn-warning btn-sm" style="width: 100px; margin-left: 30px; margin-right: 30px;" @click="editAgency(administrador)">
                <i class="fa-solid fa-pen-to-square"style="margin-right: 10px;" ></i> Editar
              </button>
              <button class="btn btn-danger btn-sm"  style="width: 100px;" @click="eliminarAgencia(administrador.id_admin)">
                <i class="fa-solid fa-trash" style="margin-right: 10px;"></i>Eliminar
              </button>
              
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import { API_BASE_URL } from "@/config";
const apiUrl = API_BASE_URL;
export default {
  data() {
    return {
      showForm: false,
      editMode: false,
      administradores: [],
      formData: {
        id_admin: null,
        nombre_admin: "",
        correo_admin: "",
        password: "",
        activo: "",
        tipo_admin: "",
      },
    };
  },
  mounted() {
    this.fetchAgencias();
  },
  methods: {
    async fetchAgencias() {
      try {
        const response = await axios.get(`${apiUrl}/administrador`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        console.log("Datos obtenidos:", response.data);
        if (Array.isArray(response.data)) {
          this.administradores = response.data;
        } else {
          console.error("Datos no válidos recibidos de la API");
        }
      } catch (error) {
        console.error("Error al obtener los datos de la API:", error);
      }
    },
    async guardarAgencia() {
      try {
        if (this.formData.id_admin) {
          // Actualizar agencia existente
          await axios.put(`${apiUrl}/administrador/${this.formData.id_admin}`, this.formData);
        } else {
          // Crear nueva agencia
          await axios.post(`${apiUrl}/administrador`, this.formData); // Usar backticks aquí
        }
        this.fetchAgencias();
        this.cancelForm();
      } catch (error) {
        console.error("Error al guardar la agencia:", error);
      }
    },
    // Eliminar una agencia
    async eliminarAgencia(id) {
      if (confirm("¿Estás seguro de eliminar esta depto?")) {
        try {
          await axios.delete(`${apiUrl}/administrador/${id}`);
          this.fetchAgencias();
        } catch (error) {
          console.error("Error al eliminar administrador:", error);
        }
      }
    },
    // Mostrar el formulario para agregar o editar
    openForm() {
      this.showForm = true;
      this.editMode = false;
      this.resetForm();
    },
    // Cancelar el formulario
    cancelForm() {
      this.showForm = false;
      this.resetForm();
    },
    // Resetear los datos del formulario
    resetForm() {
      this.formData = {
        id_admin: null,
        nombre_admin: "",
        correo_admin: "",
        password: "",
        activo: "",
        tipo_admin: "",
      };
    },
    // Editar una agencia
    editAgency(agency) {
      this.formData = { ...agency }; // Asignar los datos de la agencia al formulario
      this.showForm = true;
      this.editMode = true;
    },
  },
};
</script>

<style>

.letra1 {
  font-family: 'letra1', sans-serif;
  font-weight: bold;
  color: #0A1A2F; /* Azul oscuro */
  font-size: 30px; /* Ajusta el tamaño según sea necesario */
  line-height: 1.2; /* Ajusta la altura de línea según sea necesario */
  text-align: center; /* Centrar el texto */
  margin: 20px 0; /* Espaciado superior e inferior */
  text-transform: uppercase; /* Transformar el texto a mayúsculas */
  letter-spacing: 1.5px; /* Espaciado entre letras */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1); /* Sombra de texto suave */
}
.letr2 {
  font-family: 'letra1', sans-serif;
  font-weight: bold;
  color: #0A1A2F; /* Azul oscuro */
  font-size: 15px; /* Ajusta el tamaño según sea necesario */
  line-height: 1.2; /* Ajusta la altura de línea según sea necesario */
  text-align: center; /* Centrar el texto */
  margin: 20px 0; /* Espaciado superior e inferior */
  text-transform: uppercase; /* Transformar el texto a mayúsculas */
  letter-spacing: 1.5px; /* Espaciado entre letras */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1); /* Sombra de texto suave */
}

.linea {
  border-top: 2px solid #c2d6d6; /* Línea azul clara */
  margin: 10px 0; /* Espaciado superior e inferior */
}
</style>

