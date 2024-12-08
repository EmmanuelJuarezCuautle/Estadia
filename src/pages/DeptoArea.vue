<template>
  <div class="container mt-4">
    <h2 class="letra1">Gestión de Departamentos y Areas</h2>
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
          <h4 class="mb-4">{{ editMode ? 'Editar Departamento Area' : 'Agregar Departamento Area' }}</h4>
        </div>

        <div class="card-body">
          <form @submit.prevent="guardarDepartamento">
            <div class="form-group">
              <label for="nombre_depto">Nombre Departamento</label>
              <select id="nombre_depto" v-model="formData.id_depto" class="form-control" required @change="fetchAreas">
                <option value="" disabled>Selecciona un Departamento</option>
                <option v-for="(nombre, id) in departamentos" :key="id" :value="id">
                  {{ nombre }}
                </option>
              </select>
            </div>

            <div class="form-group">
              <label for="nombre_area">Nombre Area</label>
              <select id="nombre_area" v-model="formData.id_area" class="form-control" required>
                <option value="" disabled>Selecciona un Area</option>
                <option v-for="(nombre, id) in areas" :key="id" :value="id">
                  {{ nombre }}
                </option>
              </select>
            </div>

            <div class="text-center">
              <button type="submit" class="btn btn-success mr-2">
                <i class="fa-solid fa-check"></i> Guardar
              </button>
              <button type="button" class="btn btn-secondary" style="color: brown; border-color: brown;" @click="cancelForm">
                <i class="fa-solid fa-times"></i> Cancelar
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

        <!-- Filtros -->
    <div class="filters mb-4 row">
      <!-- Filtro por Departamento -->
      <div class="col-md-2">
        <select v-model="filters.departamento" class="form-control">
          <option value="">Todos los Departamentos</option>
          <option v-for="(nombre, id) in departamentos" :key="id" :value="id">
            {{ nombre }}
          </option>
        </select>
      </div>

      <!-- Filtro por Área -->
      <div class="col-md-2">
        <select v-model="filters.area" class="form-control">
          <option value="">Todas las Áreas</option>
          <option v-for="(nombre, id) in areas" :key="id" :value="id">
            {{ nombre }}
          </option>
        </select>
      </div>
    </div>

    <!-- Tabla Principal -->
<div class="table-responsive">
  <table class="table table-striped table-hover text-center">
    <thead class="thead-dark">
      <tr>
        <th scope="col" style="width: 5%;">#</th>
        <th scope="col" style="width: 60%;">Departamento</th>
        <th scope="col" style="width: 60%;">Áreas</th>
        <th scope="col" style="width: 35%;">Acciones</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="deptoarea in filteredDeptosAreas" :key="deptoarea.id_dep_area">
        <td>{{ deptoarea.id_dep_area }}</td>
        <td>{{ getDepartamentoNombre(deptoarea.id_depto) }}</td>
        <td>{{ getAreaNombre(deptoarea.id_area) }}</td>
        <td class="td-actions">
          <button class="btn btn-warning btn-sm" style="width: 100px; margin-left: 30px; margin-right: 30px;" @click="editAgency(deptoarea)">
            <i class="fa-solid fa-pen-to-square" style="margin-right: 10px;"></i> Editar
          </button>
          <button class="btn btn-danger btn-sm" style="width: 100px;" @click="eliminarAgencia(deptoarea.id_dep_area)">
            <i class="fa-solid fa-trash" style="margin-right: 10px;"></i> Eliminar
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
      deptosareas: [],
      departamentos: {},
      areas: {},
      filters: {
        departamento: "",
        area: "",
      },
      formData: {
        id_dep_area: null,
        id_depto: "",
        id_area: "",
      },
      filteredAreas: {},
    };
  },
  computed: {
    // Filtro de departamentos y áreas
    filteredDeptosAreas() {
      return this.deptosareas.filter(deptoarea => {
        return (
          (!this.filters.departamento || parseInt(deptoarea.id_depto) === parseInt(this.filters.departamento)) &&
          (!this.filters.area || parseInt(deptoarea.id_area) === parseInt(this.filters.area))
        );
      });
    },
  },
  mounted() {
    this.fetchDepartamentos();
    this.fetchAreas();
    this.fetchDeptosAreas();
  },
  methods: {
    async guardarDepartamento() {
    try {
      // Validar que los campos requeridos no estén vacíos
      if (!this.formData.id_depto) {
        alert("El campo 'Departamento' es obligatorio.");
        return;
      }

      if (!this.formData.id_area) {
        alert("El campo 'Área' es obligatorio.");
        return;
      }

      // Verificar si ya existe la combinación de id_depto e id_area, pero ignorando el registro actual cuando se edita
      const existeRelacion = this.deptosareas.some((deptoarea) =>
        deptoarea.id_depto === this.formData.id_depto &&
        deptoarea.id_area === this.formData.id_area &&
        deptoarea.id_dep_area !== this.formData.id_dep_area // Asegurarse de que no sea el mismo registro
      );

      if (existeRelacion) {
        alert("La relación entre el departamento y el área ya existe. No se puede duplicar.");
        return;
      }

      // Guardar o actualizar según corresponda
      if (this.formData.id_dep_area) {
        // Actualizar el registro
        await axios.put(`${apiUrl}/deptoarea/${this.formData.id_dep_area}`, this.formData);
      } else {
        // Crear un nuevo registro
        await axios.post(`${apiUrl}/deptoarea`, this.formData);
      }
      this.fetchDeptosAreas();
      this.cancelForm();
    } catch (error) {
      console.error("Error al guardar el departamento:", error);
      if (error.response && error.response.data && error.response.data.errors) {
        const errores = error.response.data.errors;
        alert(
          `Errores al guardar:\n- ${errores.id_depto ? errores.id_depto.join(", ") : ""}\n- ${errores.id_area ? errores.id_area.join(", ") : ""}`
        );
      }
    }
  },

    //-------------------------- put
    async fetchDeptosAreas() {
      try {
        const response = await axios.get(`${apiUrl}/depto-areas`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        console.log("Datos obtenidos:", response.data);
        if (Array.isArray(response.data)) {
          this.deptosareas = response.data;
        } else {
          console.error("Datos no válidos recibidos de la API");
        }
      } catch (error) {
        console.error("Error al obtener los datos de la API:", error);
      }
    },
    async fetchDepartamentos() {
      try {
        const response = await axios.get(`${apiUrl}/departamento`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.departamentos = response.data.reduce((acc, departamento) => {
            acc[departamento.id_depto] = departamento.nombre_depto;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener los departamentos:", error);
      }
    },
    async fetchAreas() {
      try {
        const response = await axios.get(`${apiUrl}/area`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.areas = response.data.reduce((acc, area) => {
            acc[area.id_area] = area.nombre_area;
            return acc;
          }, {});

        }
      } catch (error) {
        console.error("Error al obtener las áreas:", error);
      }
    },
    filterAreas() {
      const deptoId = this.formData.id_depto;
      this.filteredAreas = deptoId ? Object.keys(this.areas).reduce((acc, areaId) => {
        if (this.deptosareas.some(deptoarea => deptoarea.id_depto === deptoId && deptoarea.id_area === parseInt(areaId))) {
          acc[areaId] = this.areas[areaId];
        }
        return acc;
      }, {}) : this.areas;
    },
    getDepartamentoNombre(id_depto) {
      return this.departamentos[id_depto] || "Desconocido";
    },
    getAreaNombre(id_area) {
      return this.areas[id_area] || "Desconocido";
    },

    //-------------------------------------------------------------
    async guardarDepartamento() {
      try {
        if (this.formData.id_dep_area) {
          await axios.put(`${apiUrl}/depto-areas/${this.formData.id_dep_area}`, this.formData);
        } else {
          await axios.post(`${apiUrl}/depto-areas`, this.formData);
        }
        this.fetchDeptosAreas();
        this.cancelForm();
      } catch (error) {
        console.error("Error al guardar la departamento:", error);
      }
    },
    async eliminarAgencia(id) {
      if (confirm("¿Estás seguro de eliminar este Registro?")) {
        try {
          await axios.delete(`${apiUrl}/depto-areas/${id}`);
          this.fetchDeptosAreas();
        } catch (error) {
          console.error("Error al eliminar Departamento Area:", error);
        }
      }
    },
    openForm() {
      this.showForm = true;
      this.editMode = false;
      this.resetForm();
    },
    cancelForm() {
      this.showForm = false;
      this.resetForm();
    },
    resetForm() {
      this.formData = {
        id_dep_area: null,
        id_depto: "",
        id_area: "",
      };
      this.filteredAreas = {};
    },
    editAgency(agency) {
      this.formData = { ...agency };
      this.showForm = true;
      this.editMode = true;
      this.filterAreas();
    },
    regresar() {
      this.$router.push({ path: 'datosgenerales'});
    },
  },
};
</script>

<style scoped>
.letra1 {
  font-family: 'letra1', sans-serif;
  font-weight: bold;
  color: #0A1A2F;
  font-size: 30px;
  line-height: 1.2;
  text-align: center;
  margin: 20px 0;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
}
</style>
