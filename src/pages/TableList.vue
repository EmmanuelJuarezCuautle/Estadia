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
          <h4 class="mb-4">{{ editMode ? "Mantenimiento" : " Mantenimiento" }}</h4>
        </div>
        <div class="card-body">
          <form @submit.prevent="guardarMantenimiento">
            <div class=" mt-1">
              <!-- Buscar Número de Serie -->
              <div class="col-md-10">
                <div class="form-group d-flex">
                  <input
                    type="text"
                    v-model="searchSerie"
                    placeholder="Buscar por número de serie"
                    class="form-control"
                    :disabled="editMode || soloLectura"
                  />
                  <button
                    type="button"
                    class="btn btn-primary ml-2"
                    @click="buscarPorNumeroSerie"
                    :disabled="editMode || soloLectura"
                  >
                    Buscar
                  </button>
                </div>
              </div>

            </div>
            <div class="row mt-1">
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
          </div>

            
          <div class="row mt-1">
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
            <!-- Puerto IP -->
            <div class="col-md-4">
              <div class="form-group">
                <label for="puerto_ip">Dirección IP</label>
                <input
                  type="text"
                  id="puerto_ip"
                  v-model="formData.puerto_ip"
                  class="form-control"
                  placeholder="Puerto IP del equipo"
                  :disabled="soloLectura"
                  required
                />
              </div>
            </div>
            <!-- Monitor -->
            <div class="col-md-4">
              <div class="form-group">
                <label for="monitor">Monitor</label>
                <select
                  id="monitor"
                  v-model="formData.id_monitor"
                  class="form-control"
                  :disabled="soloLectura"
                  required
                >
                  <option value="" disabled>Seleccione monitor</option>
                  <option
                    v-for="(nombre, id) in monitores"
                    :key="id"
                    :value="id"
                  >
                    {{ nombre }}
                  </option>
                </select>
              </div>
            </div>

           </div>

          <div class="row mt-1">
            <!--Correo Equipo -->
            <div class="col-md-4">
              <div class="form-group">
                <label for="correo_equipo">Correo Equipo</label>
                <input
                  type="text"
                  id="correo_equipo"
                  v-model="formData.correo_equipo"
                  class="form-control"
                  placeholder="Correo del equipo"
                  :disabled="soloLectura"
                  required
                />
              </div>
            </div>
             <!--Password Equipo -->
             <div class="col-md-4">
              <div class="form-group">
                <label for="password_equipo">Contraseña Equipo</label>
                <input
                  type="text"
                  id="password_equipo"
                  v-model="formData.password_equipo"
                  class="form-control"
                  placeholder="Contraseña del equipo"
                  :disabled="soloLectura"
                  required
                />
              </div>
            </div>
            <!-- Accesorios -->
            <div class="col-md-4">
              <div class="form-group">
                <label for="accesorios">Accesorios</label>
                <input
                  type="text"
                  id="accesorios"
                  v-model="formData.accesorios"
                  class="form-control"
                  placeholder="Accesorios del equipo"
                  :disabled="soloLectura"
                  required
                />
              </div>
            </div>
          </div>

          <div class="row mt-1">
            <!-- Condición -->
            <div class="col-md-4">
              <div class="form-group">
                <label for="condicion">Condición</label>
                <select
                  id="condicion"
                  v-model="formData.condicion"
                  class="form-control"
                  :disabled="soloLectura"
                  required
                >
                  <option value="" disabled>Selecciona tipo de condición</option>
                  <option value="Excelente">Excelente</option>
                  <option value="Buena">Buena</option>
                  <option value="Regular">Regular</option>
                  <option value="Mala">Mala</option>
                </select>
              </div>
            </div>
            <!-- Fecha de Mantenimiento -->
            <div class="col-md-4">
              <div class="form-group">
                <label for="fecha_mant">Fecha de Mantenimiento</label>
                <input
                  type="date"
                  id="fecha_mant"
                  v-model="formData.fecha_mant"
                  class="form-control"
                  :disabled="soloLectura"
                  required
                />
              </div>
            </div>
            <!-- Comentario -->
            <div class="col-md-4">
              <div class="form-group">
                <label for="comentario">Comentario</label>
                <textarea
                  id="comentario"
                  v-model="formData.comentario"
                  class="form-control"
                  placeholder="Escribe un comentario"
                  rows="3"
                  :disabled="soloLectura"
                  required
                ></textarea>
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
  <div class="row mb-4">
    <div class="col-md-3">
      <select v-model="filters.tipoMant" class="form-control">
        <option value="">Todos los Mantenimiento</option>
        <option v-for="tipo in tipoMantOptions" :key="tipo" :value="tipo">
          {{ tipo }}
        </option>
      </select>
    </div>

    <div class="col-md-3">
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
          <th scope="col" style="width: 13%">Tipo Mant</th>
          <th scope="col" style="width: 13%">Admin</th>
          <th scope="col" style="width: 18%">Número de Serie</th>
          <th scope="col" style="width: 10%">Empleado</th>
          <th scope="col" style="width: 14%">Agencia</th>
          <th scope="col" style="width: 30%">Acciones</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="mantenimiento in filteredMantenimientos" :key="mantenimiento.id">
          <td>{{ mantenimiento.id_mod_mant }}</td>
          <td>{{ mantenimiento.tipo_mant }}</td>
          <td>{{ getAdministradorNombre(mantenimiento.id_admin) }}</td>
          <td>{{ getEquiposNombre(mantenimiento.id_equipo).numero_serie }}</td>
          <td>{{ getEquiposNombre(mantenimiento.id_equipo).empleado }}</td>
          <td>{{ getAgenciaNombre(mantenimiento.id_agencia) }}</td>
          <td class="td-actions">
            <button class="btn btn-warning btn-sm" @click="editAgency(mantenimiento)">
              <i class="fa-solid fa-pen-to-square"></i> Editar
            </button>
            <button class="btn btn-mostrar btn-sm" @click="mostrarMantenim(mantenimiento)">
            <i class="fa-solid fa-eye"></i> Mostrar
          </button>
            <button class="btn btn-danger btn-sm" @click="eliminarMantenim(mantenimiento.id_mod_mant)">
              <i class="fa-solid fa-trash"></i> Eliminar
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Paginación -->
  <div class="pagination mt-3 d-flex justify-content-center">
    <button class="btn btn-atras btn-sm" @click="previousPage" :disabled="currentPage === 1">Anterior</button>
    <span class="mx-2">Página {{ currentPage }} de {{ totalPages }}</span>
    <button class="btn btn-siguente btn-sm" @click="nextPage" :disabled="currentPage === totalPages">Siguiente</button>
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
      currentPage: 1,  // Página actual
      itemsPerPage: 5, // Número de items por página
      totalItems: 0,    // Total de items
      formData: {
        id_equipo: "",
        id_agencia: "",
        id_depto: "",
        id_area: "",
        id_catego: "",
        numero_serie: "",
        puerto_ip: "",
        correo_equipo: "",
        password_equipo: "",
        accesorios: "",
        condicion: "",
        fecha_mant: "",
      },
      soloLectura: false,
      labels: {
        numero_serie: "Número de Serie",
        id_agencia: "Agencia",
        id_depto: "Departamento",
        id_area: "Área",
        id_catego: "Categoría",
      },
      filters: {
        tipoMant: "",
        admin: "",
        agencia: "",
        numeroSerie: "",
      },
      tipoMantOptions: [ // Define las opciones de tipoMant
      'Mantenimiento Preventivo',
      'Mantenimiento Correctivo',
      // Agrega más opciones según sea necesario
    ],
    };
    
  },
  computed: {
  filteredMantenimientos() {
    // Filtra los mantenimientos según los filtros
    const mantenimientosFiltrados = this.mantenimientos.filter((mantenimiento) => {
      const equipo = this.getEquiposNombre(mantenimiento.id_equipo);
      return (
        (!this.filters.tipoMant || mantenimiento.tipo_mant === this.filters.tipoMant) &&
        (!this.filters.admin || parseInt(mantenimiento.id_admin) === parseInt(this.filters.admin)) &&
        (!this.filters.agencia || mantenimiento.id_agencia === this.filters.agencia) &&
        (!this.filters.numeroSerie || (equipo && equipo.numero_serie.includes(this.filters.numeroSerie)))
      );
    });

    this.totalItems = mantenimientosFiltrados.length; // Total de elementos filtrados

    // Paginación: aplicar paginación sobre los elementos filtrados
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    const endIndex = startIndex + this.itemsPerPage;
    return mantenimientosFiltrados.slice(startIndex, endIndex);
  },
  totalPages() {
    // Calcular el total de páginas basándonos en los elementos filtrados
    return Math.ceil(this.totalItems / this.itemsPerPage);
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
  watch: {
  filters: {
    handler() {
      this.currentPage = 1; // Restablece la página actual cuando los filtros cambian
    },
    deep: true, // Necesario para que se ejecute cuando cualquier filtro cambie
  },
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
    nextPage() {
    if (this.currentPage < this.totalPages) {
      this.currentPage++;
    }
  },
  previousPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
    }
  },
  goToPage(page) {
    if (page >= 1 && page <= this.totalPages) {
      this.currentPage = page;
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
    // Método para mostrar
    mostrarMantenim(mantenimiento) {
      this.formData = { ...mantenimiento };
      this.showForm = true;
      this.editMode = false; // Establecer editMode en false cuando se muestra
      this.soloLectura = true; // Solo lectura en modo mostrar
    },
  },
};
</script>