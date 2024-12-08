<template>
  <div class="container mt-4">
    <h2 class="letra1">Gestión de Mantenimientos</h2>
    <div class="text-left mb-4">
      <button class="btn btn-add btn-sm" @click="openForm">
        <i class="fa-solid fa-square-plus" style="margin-right: 10px"></i>
        Agregar
      </button>
    </div>
    <div v-if="showForm" class="modal-overlay" @click.self="cancelForm">
      <div class="card modal-content">
        <div class="card-header">
          <h4 class="mb-4">{{ editMode ? "Editar Mantenimiento" : "Agregar Mantenimiento" }}</h4>
        </div>
        <div class="card-body">
          <form @submit.prevent="guardarMantenimiento">
            <div class="row mt-2">
              <!-- Buscar Número de Serie -->
              <div class="col-md-12">
                <div class="form-group d-flex">
                  <input
                    type="text"
                    v-model="searchSerie"
                    placeholder="Buscar por número de serie"
                    class="form-control"
                  />
                  <button type="button" class="btn btn-primary ml-2" @click="buscarPorNumeroSerie">
                    Buscar
                  </button>
                </div>
              </div>
            </div>
            <div class="row mt-2">
              <!-- Número de Serie -->
              <div class="col-md-4" v-for="(label, key) in labels" :key="key">
                <div class="form-group">
                  <label :for="key">{{ label }}</label>
                  <input
                    type="text"
                    :id="key"
                    v-model="formData[key]"
                    class="form-control"
                    :placeholder="`Ingrese ${label.toLowerCase()}`"
                    readonly
                  />
                </div>
              </div>
            </div>

            
            <div class="row mt-2">
              <!-- Tipo de Mantenimiento -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="tipo_mant">Tipo de Mantenimiento</label>
                  <select
                    id="tipo_mant"
                    v-model="formData.tipo_mant"
                    class="form-control"
                    :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Selecciona tipo de mantenimiento</option>
                    <option value="Preventivo">Preventivo</option>
                    <option value="Correctivo">Correctivo</option>
                    <option value="Predictivo">Predictivo</option>
                  </select>
                </div>
              </div>

              <!-- Administrador -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="administrador">Admin</label>
                  <select
                    id="administrador"
                    v-model="formData.id_admin"
                    class="form-control"
                    :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione Admin</option>
                    <option
                      v-for="(nombre, id) in administradores"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
            </div>



            <div class="text-center">
              <button type="submit" class="btn btn-success mr-2">
                <i class="fa-solid fa-check"></i> Guardar
              </button>
              <button
                type="button"
                class="btn btn-secondary"
                style="color: brown; border-color: brown"
                @click="cancelForm"
              >
                <i class="fa-solid fa-times"></i> Cancelar
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
     <!-- Filtros -->
    <div class="row mb-3">
      <div class="col-md-3">
        <select v-model="filters.tipoMant" class="form-control">
          <option value="">Todos los Tipos de Mantenimiento</option>
          <option v-for="tipo in tipoMantOptions" :key="tipo" :value="tipo">
            {{ tipo }}
          </option>
        </select>
      </div>

      <!-- Filtro por Administrador -->
      <div class="col-md-2">
        <select v-model="filters.admin" class="form-control">
          <option value="">Todos los Administradores</option>
          <option v-for="(nombre, id) in administradores" :key="id" :value="id">
            {{ nombre }}
          </option>
        </select>
      </div>



      <div class="col-md-3">
        <select v-model="filters.agencia" class="form-control">
          <option value="">Todas las Agencias</option>
          <option v-for="agencia in agencias" :key="agencia.id_agencia" :value="agencia.id_agencia">
            {{ agencia.nombre_age }}
          </option>
        </select>
      </div>

      <div class="col-md-3">
        <input
          type="text"
          v-model="filters.numeroSerie"
          class="form-control"
          placeholder="Buscar por Número de Serie"
        />
      </div>
    </div>

    <!-- Tabla Principal -->
    <div class="table-responsive">
      <table class="table table-striped table-hover text-center">
        <thead class="thead-dark">
          <tr>
            <th scope="col" style="width: 5%">#</th>
            <th scope="col" style="width: 15%">Tipo Mant</th>
            <th scope="col" style="width: 10%">Admin</th>
            <th scope="col" style="width: 15%">Número de Serie</th>
            <th scope="col" style="width: 10%">Empleado</th>
            <th scope="col" style="width: 15%">Agencia</th>
            <th scope="col" style="width: 30%">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="mantenimiento in filteredMantenimientos" :key="mantenimiento.id_mod_mant">
            <td>{{ mantenimiento.id_mod_mant }}</td>
            <td>{{ mantenimiento.tipo_mant }}</td>
            <td>{{ getAdministradorNombre(mantenimiento.id_admin) }}</td>
            <td>{{ getEquiposNombre(mantenimiento.id_equipo).numero_serie }}</td>
            <td>{{ getEquiposNombre(mantenimiento.id_equipo).empleado }}</td>
            <td>{{ getAgenciaNombre(mantenimiento.id_agencia) }}</td>
            <td class="td-actions">
              <button
                class="btn btn-warning btn-sm"
                @click="editAgency(mantenimiento)"
              >
                <i class="fa-solid fa-pen-to-square"></i> Editar
              </button>
              <button
                class="btn btn-danger btn-sm"
                @click="eliminarMantenim(mantenimiento.id_mod_mant)"
              >
                <i class="fa-solid fa-trash"></i> Eliminar
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
      mantenimientos: [],
      administradores: [],
      equipos: [],
      agencias: [],
      departamentos: [],
      areas: [],
      categorias: [],
      searchSerie: "",
      formData: {
        id_equipo: "",
        id_agencia: "",
        id_depto: "",
        id_area: "",
        id_catego: "",
        numero_serie: "",
      },
      labels: {
        numero_serie: "Número de Serie",
        id_agencia: "Agencia",
        id_depto: "Departamento",
        id_area: "Área",
        id_catego: "Categoría",
        id_equipo: "Equipo",
      },
      filters: {
        tipoMant: "",
        admin: "",
        agencia: "",
        numeroSerie: "",
      },
    };
    
  },
  computed: {
    tipoMantOptions() {
      // Extraer opciones únicas de tipo_mant
      return [...new Set(this.mantenimientos.map((m) => m.tipo_mant))];
    },
    filteredMantenimientos() {
  return this.mantenimientos.filter((mantenimiento) => {
    const equipo = this.getEquiposNombre(mantenimiento.id_equipo);
    return (
      (!this.filters.tipoMant || mantenimiento.tipo_mant === this.filters.tipoMant) &&
      (!this.filters.admin || parseInt(mantenimiento.id_admin) === parseInt(this.filters.admin)) &&
      (!this.filters.agencia || mantenimiento.id_agencia === this.filters.agencia) &&
      (!this.filters.numeroSerie || (equipo && equipo.numero_serie.includes(this.filters.numeroSerie)))
    );
  });
},

  },
  mounted() {
    this.fetchMantenimiento();
    this.fetchAgencias();
    this.fetchDepartamentos();
    this.fetchAreas();
    this.fetchMonitor();
    this.fetchEquipos();
    this.fetchAdministradores();
  },
  
  
  methods: {
    async fetchMantenimiento() {
      try {
        const response = await axios.get(`${apiUrl}/modulomantenimiento`, {
          headers: { "ngrok-skip-browser-warning": "true" },
        });
        this.mantenimientos = Array.isArray(response.data) ? response.data : [];
      } catch (error) {
        console.error("Error al obtener mantenimientos:", error);
      }
    },
    async fetchEquipos() {
      try {
        const response = await axios.get(`${apiUrl}/modulocomputadoraequipo`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.equipos = response.data.reduce((acc, equipo) => {
            acc[equipo.id_equipo] = equipo;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener los equipos:", error);
      }
    },
    getEquiposNombre(id_equipo) {
      return this.equipos[id_equipo] || {};
    },
    async fetchAdministradores() {
      try {
        const response = await axios.get(`${apiUrl}/administrador`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.administradores = response.data.reduce((acc, administrador) => {
            acc[administrador.id_admin] = administrador.nombre_admin;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las administradores:", error);
      }
    },
    getAdministradorNombre(id_admin) {
      return this.administradores[id_admin] || "Desconocido";
    },
    
    async fetchAgencias() {
      try {
        const response = await axios.get(`${apiUrl}/agencia`, {
          headers: { "ngrok-skip-browser-warning": "true" },
        });
        this.agencias = Array.isArray(response.data) ? response.data : [];
      } catch (error) {
        console.error("Error al obtener agencias:", error);
      }
    },
    getAgenciaNombre(id_agencia) {
  const agencia = this.agencias.find((a) => a.id_agencia === id_agencia);
  return agencia ? agencia.nombre_age : "Sin asignar";
},

    async fetchDepartamentos() {
      try {
        const response = await axios.get(`${apiUrl}/departamento`, {
          headers: { "ngrok-skip-browser-warning": "true" },
        });
        this.departamentos = Array.isArray(response.data) ? response.data : [];
      } catch (error) {
        console.error("Error al obtener departamentos:", error);
      }
    },
    getDepartamentoNombre(id_depto) {
      return this.departamentos[id_depto] || "Desconocido";
    },
    async fetchAreas() {
      try {
        const response = await axios.get(`${apiUrl}/area`, {
          headers: { "ngrok-skip-browser-warning": "true" },
        });
        this.areas = Array.isArray(response.data) ? response.data : [];
      } catch (error) {
        console.error("Error al obtener áreas:", error);
      }
    },
    getAreaNombre(id_area) {
      return this.areas[id_area] || "Desconocido";
    },
    async buscarPorNumeroSerie() {
      if (!this.searchSerie.trim()) {
        alert("Por favor, introduce un número de serie.");
        return;
      }
      try {
        const response = await axios.get(
          `${apiUrl}/modulocomputadoraequipo`,
          { headers: { "ngrok-skip-browser-warning": "true" },
            params: { numero_serie: this.searchSerie } }
        );
        const equipo = response.data.find(
          (item) => item.numero_serie === this.searchSerie
        );
        if (equipo) {
          Object.assign(this.formData, equipo);
        } else {
          alert("No se encontró un equipo con ese número de serie.");
        }
      } catch (error) {
        console.error("Error al buscar equipo:", error);
        alert("Hubo un error al buscar el equipo.");
      }
    },

    
    async fetchMonitor() {
      try {
        const response = await axios.get(`${apiUrl}/monitor`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.monitores = response.data.reduce((acc, monitor) => {
            acc[monitor.id_monitor] = monitor.nombre_monitor;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener los monitores:", error);
      }
    },

    
    async guardarMantenimiento() {
      try {
        if (this.formData.id_mod_mant) {
          await axios.put(`${apiUrl}/modulomantenimiento/${this.formData.id_mod_mant}`, this.formData);
        } else {
          await axios.post(`${apiUrl}/modulomantenimiento`, this.formData);
        }
        this.fetchMantenimiento();
        this.cancelForm();
      } catch (error) {
        console.error("Error al guardar mantenimiento:", error);
      }
    },
    async eliminarMantenim(id) {
      if (confirm("¿Estás seguro de eliminar este mantenimiento?")) {
        try {
          await axios.delete(`${apiUrl}/modulomantenimiento/${id}`);
          this.fetchMantenimiento();
        } catch (error) {
          console.error("Error al eliminar el mantenimiento:", error);
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
      this.soloLectura = false;
    },
    resetForm() {
      this.formData = {
        id_mod_mant: null,
        tipo_mant: "",
        id_admin: "",
        id_equipo: "",
        id_agencia: "",
        id_depto: "",
        id_area: "",
        id_catego: "",
        id_monitor: "",
        empleado: "",
        numero_serie: "",
        puerto_ip: "",
        correo_equipo: "",
        password_equipo: "",
        accesorios: "",
        condicion: "",
        comentario: "",
        fecha_mant: "",
      };
    },
    editAgency(mantenimiento) {
      this.formData = { ...mantenimiento };
      this.showForm = true;
      this.editMode = true;
      this.soloLectura = false;
    },
  },
};
</script>