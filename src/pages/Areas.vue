<template>
  <div class="container mt-4">
    <h2 class="letra1">Gestión de Areas</h2>
    <div class="text-left mb-4">
      <button class="btn btn-add btn-sm" @click="regresar" style="margin-right: 5px;">
        <i class="fa-solid fa-circle-left" style="margin-right: 10px;"></i> Regresar
      </button>
      <button class="btn btn-add btn-sm" @click="openForm">
        <i class="fa-solid fa-square-plus" style="margin-right: 10px;"></i> Agregar
    </button>
    </div>
    <div v-if="showForm" class="modal-overlay" @click.self="cancelForm">
      <div class="card modal-content">
        <div class="card-header">
          <h4 class="mb-4">{{ editMode ? 'Editar Area' : 'Agregar Area' }}</h4>
        </div>
        <div class="card-body">
          <form @submit.prevent="guardarAgencia">
            <div class="form-group">
              <label for="nombre_area">Nombre Area</label>
              <input 
                type="text"
                id="nombre_area"
                v-model="formData.nombre_area"
                class="form-control"
                placeholder="Nombre de la area"
                required
              />
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
            <th scope="col" style="width: 35%;">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="area in areas" :key="area.id_area">
            <td>{{ area.id_area }}</td>
            <td>{{ area.nombre_area }}</td>

            <td class="td-actions">
              <button class="btn btn-warning btn-sm" style="width: 100px; margin-left: 30px; margin-right: 30px;" @click="editAgency(area)">
                <i class="fa-solid fa-pen-to-square"style="margin-right: 10px;" ></i> Editar
              </button>
              <button class="btn btn-danger btn-sm"  style="width: 100px;" @click="eliminarAgencia(area.id_area)">
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
      areas: [],
      formData: {
        id_area: null,
        nombre_area: "",
      },
    };
  },
  mounted() {
    this.fetchAreas();
  },
  methods: {
    async fetchAreas() {
      try {
        const response = await axios.get(`${apiUrl}/area`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        console.log("Datos obtenidos:", response.data);
        if (Array.isArray(response.data)) {
          this.areas = response.data;
        } else {
          console.error("Datos no válidos recibidos de la API");
        }
      } catch (error) {
        console.error("Error al obtener los datos de la API:", error);
      }
    },
    async guardarAgencia() {
      try {
        if (this.formData.id_area) {
          // Actualizar agencia existente
          await axios.put(`${apiUrl}/area/${this.formData.id_area}`, this.formData);
        } else {
          // Crear nueva agencia
          await axios.post(`${apiUrl}/area`, this.formData); // Usar backticks aquí
        }
        this.fetchAreas();
        this.cancelForm();
      } catch (error) {
        console.error("Error al guardar la area:", error);
      }
    },
    // Eliminar una agencia
    async eliminarAgencia(id_area) {
      if (confirm("¿Estás seguro de eliminar esta area?")) {
        try {
          await axios.delete(`${apiUrl}/area/${id_area}`);
          this.fetchAreas();
        } catch (error) {
          console.error("Error al eliminar la area:", error);
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
        id_area: null,
        nombre_area: "",
      };
    },
    // Editar una agencia
    editAgency(agency) {
      this.formData = { ...agency }; // Asignar los datos de la agencia al formulario
      this.showForm = true;
      this.editMode = true;
    },
    regresar() {
      this.$router.push({ path: 'datosgenerales'});
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

