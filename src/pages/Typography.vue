<template>
  <div class="container mt-4">
    <h2 class="letra1">Gestión de Equipos</h2>
    <div class="text-left mb-4">
      <button class="btn btn-add btn-sm" @click="openForm">
        <i class="fa-solid fa-square-plus" style="margin-right: 10px"></i>
        Agregar Equipo
      </button>
    </div>
    <div v-if="showForm" class="modal-overlay" @click.self="cancelForm">
      <div class="card modal-content">
        
        <div class="card-header">
          <h4 class="mb-4">
            {{ editMode ? "Editar Equipo" : "Agregar Equipo" }}
          </h4>
        </div>
        <div class="card-body">
          <form @submit.prevent="guardarEquipo">
            
            <div class="row mt-2">
              <!-- Categoría -->
              <div class="col-md-4">
                <div class="form-group"  >
                  <label for="categoria" >Categoría</label>
                  <select
                    id="categoria"
                    v-model="formData.id_catego"
                    class="form-control"
                    :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Selecciona categoría</option>
                    <option
                      v-for="(nombre, id) in categorias"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>

              <!-- Marca -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="marca">Marca</label>
                  <select
                    id="marca"
                    v-model="formData.id_marca"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione una marca</option>
                    <option
                      v-for="(nombre, id) in marcas"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>

              <!-- Modelo -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="modelo">Modelo</label>
                  <select
                    id="modelo"
                    v-model="formData.id_modelo"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione un modelo</option>
                    <option
                      v-for="(nombre, id) in modelos"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <!--Numero Serie-->
            <div class="form-group">
              <label for="numero_serie">Número de Serie</label>
              <input
                type="text"
                id="numero_serie"
                v-model="formData.numero_serie"
                class="form-control"
                placeholder="Número de serie del equipo"
                 :disabled="soloLectura"
                required
              />
            </div>

            <div class="row mt-2">
              <!--SO-->
              <div class="col-md-4">
                <label for="so">Sistema Operativo</label>
                <select
                  id="so"
                  v-model="formData.id_so"
                  class="form-control"
                   :disabled="soloLectura"
                  required
                >
                  <option value="" disabled>Seleccione un Sistema Op</option>
                  <option v-for="(nombre, id) in sos" :key="id" :value="id">
                    {{ nombre }}
                  </option>
                </select>
              </div>
              <!--Lic SO-->
              <div class="col-md-4">
                <label for="licso">Licencia Sistema Op</label>
                <select
                  id="licso"
                  v-model="formData.id_licso"
                   :disabled="soloLectura"
                  class="form-control"
                >
                  <option value="" disabled>Seleccione una licencia</option>
                  <option v-for="(nombre, id) in licsos" :key="id" :value="id">
                    {{ nombre }}
                  </option>
                </select>
              </div>
              <!--Procesadores-->
              <div class="col-md-4">
                <label for="procesadore">Procesador</label>
                <select
                  id="procesadore"
                  v-model="formData.id_cpu"
                  class="form-control"
                   :disabled="soloLectura"
                  required
                >
                  <option value="" disabled>Seleccione un Procesador</option>
                  <option
                    v-for="(nombre, id) in procesadores"
                    :key="id"
                    :value="id"
                  >
                    {{ nombre }}
                  </option>
                </select>
              </div>
            </div>

            <div class="row mt-2">
              <!--Disco duro-->
              <div class="col-md-4">
                <label for="discoduro">Disco Duro</label>
                <select
                  id="discoduro"
                  v-model="formData.id_dd"
                  class="form-control"
                   :disabled="soloLectura"
                  required
                >
                  <option value="" disabled>Seleccione un Disco Duro</option>
                  <option
                    v-for="(nombre, id) in discosduros"
                    :key="id"
                    :value="id"
                  >
                    {{ nombre }}
                  </option>
                </select>
              </div>
              <!-- Tipo DD-->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="marca">Tipo Disco Duro</label>
                  <select
                    id="marca"
                    v-model="formData.id_tipodd"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione tipo</option>
                    <option
                      v-for="(nombre, id) in tipodiscosduros"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
              <!-- Ram -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="marca">RAM</label>
                  <select
                    id="marca"
                    v-model="formData.id_ram"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione una Ram</option>
                    <option v-for="(nombre, id) in rams" :key="id" :value="id">
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <div class="row mt-2">
              <!-- Antivirus -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="antivirus">Antivirus</label>
                  <select
                    id="antivirus"
                    v-model="formData.id_antivirus"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione ua Antivirus</option>
                    <option
                      v-for="(nombre, id) in antivirus"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
              <!-- office -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="office">Office</label>
                  <select
                    id="office"
                    v-model="formData.id_office"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione un Office</option>
                    <option
                      v-for="(nombre, id) in offices"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
              <!-- Lic Office -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="licoffice">Lic Office</label>
                  <select
                    id="licoffice"
                    v-model="formData.id_licoffice"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione una Licencia</option>
                    <option
                      v-for="(nombre, id) in licoffices"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
            </div>


            <div class="row mt-2">
              <!-- Agencias -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="agencia">Agencia</label>
                  <select
                    id="agencia"
                    v-model="formData.id_agencia"
                    class="form-control"
                     :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione Agencia</option>
                    <option
                      v-for="(nombre, id) in agencias"
                      :key="id"
                      :value="id"
                    >
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>
             <!-- Select de Departamento -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="departamento">Departamento</label>
                  <select
                    id="departamento"
                    v-model="formData.id_depto"
                    class="form-control"
                    :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione un Departamento</option>
                    <option
                      v-for="(areas, id) in departamentosAreas"
                      :key="id"
                      :value="id"
                    >
                      {{ getDepartamentoNombre(id) }}
                    </option>
                  </select>
                </div>
              </div>

              <!-- Select de Áreas -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="area">Áreas</label>
                  <select
                    id="area"
                    v-model="formData.id_area"
                    class="form-control"
                    :disabled="!filteredAreas.length || soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione un Área</option>
                    <option v-for="area in filteredAreas" :key="area.id" :value="area.id">
                      {{ area.nombre }}
                    </option>
                  </select>
                </div>
              </div>


            </div>

            <!--Empleado-->
            <div class="form-group">
              <label for="empleado">Empleado</label>
              <input
                type="text"
                id="empleado"
                v-model="formData.empleado"
                class="form-control"
                placeholder="Empleado del equipo"
                 :disabled="soloLectura"
                required
              />
            </div>
            <!--------------------------------------------------------------->

            <div class="text-center">
              <button v-if="!soloLectura" type="submit" class="btn btn-success mr-2">
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
    <div class="filters mb-4 row">
      <!-- Filtro por Categoría -->
      <div class="col-md-2">
        <select v-model="filters.categoria" class="form-control">
          <option value="">Todas las Categorías</option>
          <option v-for="(nombre, id) in categorias" :key="id" :value="id">
            {{ nombre }}
          </option>
        </select>
      </div>

      <!-- Filtro por Marca -->
      <div class="col-md-2">
        <select v-model="filters.marca" class="form-control">
          <option value="">Todas las Marcas</option>
          <option v-for="(nombre, id) in marcas" :key="id" :value="id">
            {{ nombre }}
          </option>
        </select>
      </div>

      <!-- Filtro por Modelo -->
      <div class="col-md-2">
        <select v-model="filters.modelo" class="form-control">
          <option value="">Todos los Modelos</option>
          <option v-for="(nombre, id) in modelos" :key="id" :value="id">
            {{ nombre }}
          </option>
        </select>
      </div>

      <!-- Filtro por Agencia -->
      <div class="col-md-2">
        <select v-model="filters.agencia" class="form-control">
          <option value="">Todas las Agencias</option>
          <option v-for="(nombre, id) in agencias" :key="id" :value="id">
            {{ nombre }}
          </option>
        </select>
      </div>

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
        <th scope="col" style="width: 4%">#</th>
        <th scope="col" style="width: 8%">Categoría</th>
        <th scope="col" style="width: 8%">Marca</th>
        <th scope="col" style="width: 8%">Modelo</th>
        <th scope="col" style="width: 8%">Agencia</th>
        <th scope="col" style="width: 8%">Depto</th>
        <th scope="col" style="width: 13%">Área</th>
        <th scope="col" style="width: 25%">Acciones</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="equipo in filteredEquipos" :key="equipo.id_equipo">
        <td>{{ equipo.id_equipo }}</td>
        <td>{{ getCategoriaNombre(equipo.id_catego) }}</td>
        <td>{{ getMarcaNombre(equipo.id_marca) }}</td>
        <td>{{ getModeloNombre(equipo.id_modelo) }}</td>
        <td>{{ getAgenciaNombre(equipo.id_agencia) }}</td>
        <td>{{ getDepartamentoNombre(equipo.id_depto) }}</td>
        <td>{{ getAreaNombre(equipo.id_area) }}</td>
        <td class="td-actions">
          <button class="btn btn-warning btn-sm" @click="editEquipo(equipo)">
            <i class="fa-solid fa-pen-to-square"></i> Editar
          </button>
          <button class="btn btn-mostrar btn-sm" @click="mostrarEquipo(equipo)">
            <i class="fa-solid fa-eye"></i> Mostrar
          </button>
          <button class="btn btn-danger btn-sm" @click="eliminarEquipo(equipo.id_equipo)">
            <i class="fa-solid fa-trash"></i> Eliminar
          </button>
        </td>
      </tr>
    </tbody>
  </table>
</div>

<!-- Paginación -->
<div class="pagination mt-3 d-flex justify-content-center">
  <button class="btn btn-primary btn-sm" @click="previousPage" :disabled="currentPage === 1">Anterior</button>
  <span class="mx-2">Página {{ currentPage }} de {{ totalPages }}</span>
  <button class="btn btn-primary btn-sm" @click="nextPage" :disabled="currentPage === totalPages">Siguiente</button>
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
      equipos: [],
      categorias: [],
      marcas: [],
      modelos: [],
      sos: [],
      licsos: [],
      procesadores: [],
      discosduros: [],
      tipodiscosduros: [],
      rams: [],
      antivirus: [],
      offices: [],
      licoffices: [],
      agencias: [],
      departamentos: [],
      areas: [],
      deptoareas: [],
      departamentosAreas: {},
      currentPage: 1,          // Página actual
      itemsPerPage: 5,        // Número de elementos por página

      selectedDepartamento: null, // Para el select de departamentos
     filteredAreas: [],
     filters: {
        categoria: "",
        marca: "",
        modelo: "",
        agencia: "",
        departamento: "",
        area: "",
      },

      showForm: false,
      editMode: false,
      formData: {
        id_equipo: null,
        id_catego: "",
        id_marca: "",
        id_modelo: "",
        numero_serie: "",
        id_so: "",
        id_licso: "",
        id_cpu: "",
        id_dd: "",
        id_tipodd: "",
        id_ram: "",
        id_antivirus: "",
        id_office: "",
        id_licoffice: "",
        id_agencia: "",
        id_depto: "",
        id_area: "",
        empleado: "",
        id_dep_area: "",
      },
      soloLectura: false,

    };
    
  },
  computed: {
  filteredEquipos() {
    const start = (this.currentPage - 1) * this.itemsPerPage;
    const end = start + this.itemsPerPage;
    return this.equipos.filter((equipo) => {
      return (
        (!this.filters.categoria || parseInt(equipo.id_catego) === parseInt(this.filters.categoria)) &&
        (!this.filters.marca || parseInt(equipo.id_marca) === parseInt(this.filters.marca)) &&
        (!this.filters.modelo || parseInt(equipo.id_modelo) === parseInt(this.filters.modelo)) &&
        (!this.filters.agencia || parseInt(equipo.id_agencia) === parseInt(this.filters.agencia)) &&
        (!this.filters.departamento || parseInt(equipo.id_depto) === parseInt(this.filters.departamento)) &&
        (!this.filters.area || parseInt(equipo.id_area) === parseInt(this.filters.area))
      );
    }).slice(start, end); // Filtrar por página
  },
  totalPages() {
    return Math.ceil(this.equipos.length / this.itemsPerPage); // Calcular el total de páginas
  },
},


  mounted() {
    this.fetchEquipos();
    this.fetchCategorias();
    this.fetchMarcas();
    this.fetchModelos();
    this.fetchSO();
    this.fetchLicSO();
    this.fetchProcesadores();
    this.fetchDiscosDuros();
    this.fetchTipoDiscosDuros();
    this.fetchRam();
    this.fetchAntivirus();
    this.fetchOffice();
    this.fetchLicOffice();
    this.fetchAgencias();
    this.fetchDepartamentos();
    this.fetchAreas();
    //this.fetchDeptoAreas();
    this.fetchDepartamentoArea();
  },

  watch: {
  "formData.id_depto": {
    handler() {
      this.filterAreas();
    },
    immediate: true, // Esto asegura que se ejecute al montar el componente.
  },
},

  methods: {

    async fetchEquipos() {
      try {
        const response = await axios.get(`${apiUrl}/modulocomputadoraequipo`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.equipos = response.data;
        }
      } catch (error) {
        console.error("Error al obtener los equipos:", error);
      }
    },
    //========= Categorias
    async fetchCategorias() {
      try {
        const response = await axios.get(`${apiUrl}/categoria`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.categorias = response.data.reduce((acc, categoria) => {
            acc[categoria.id_catego] = categoria.nombre_catego;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getCategoriaNombre(id_catego) {
      return this.categorias[id_catego] || "Desconocido";
    },

    //========= Marcas
    async fetchMarcas() {
      try {
        const response = await axios.get(`${apiUrl}/marca`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.marcas = response.data.reduce((acc, marca) => {
            acc[marca.id_marca] = marca.nombre_marca;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getMarcaNombre(id_marca) {
      return this.marcas[id_marca] || "Desconocido";
    },
    //========= Modelos
    async fetchModelos() {
      try {
        const response = await axios.get(`${apiUrl}/modelo`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.modelos = response.data.reduce((acc, modelo) => {
            acc[modelo.id_modelo] = modelo.nombre_modelo;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getModeloNombre(id_modelo) {
      return this.modelos[id_modelo] || "Desconocido";
    },
    //========= Sistema Operativo
    async fetchSO() {
      try {
        const response = await axios.get(`${apiUrl}/so`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.sos = response.data.reduce((acc, so) => {
            acc[so.id_so] = so.nombre_so;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getSONombre(id_so) {
      return this.sos[id_so] || "Desconocido";
    },
    //========= licencia SO
    async fetchLicSO() {
      try {
        const response = await axios.get(`${apiUrl}/licso`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.licsos = response.data.reduce((acc, licso) => {
            acc[licso.id_licso] = licso.nombre_licso;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener la Licencia SO:", error);
      }
    },
    getLicSONombre(id_licso) {
      return this.licsos[id_licso] || "Desconocido";
    },
    //========= Procesadores
    async fetchProcesadores() {
      try {
        const response = await axios.get(`${apiUrl}/procesador`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.procesadores = response.data.reduce((acc, procesador) => {
            acc[procesador.id_cpu] = procesador.nombre_cpu;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getProcesadoresNombre(id_cpu) {
      return this.procesadores[id_cpu] || "Desconocido";
    },
    //========= DiscoDuro
    async fetchDiscosDuros() {
      try {
        const response = await axios.get(`${apiUrl}/discoduro`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.discosduros = response.data.reduce((acc, discoduro) => {
            acc[discoduro.id_dd] = discoduro.nombre_dd;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getDiscosDurosNombre(id_dd) {
      return this.discosduros[id_dd] || "Desconocido";
    },
    //========= Tipo DD 
    async fetchTipoDiscosDuros() {
      try {
        const response = await axios.get(`${apiUrl}/tipodiscoduro`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.tipodiscosduros = response.data.reduce(
            (acc, tipodiscoduro) => {
              acc[tipodiscoduro.id_tipodd] = tipodiscoduro.nombre_tipodd;
              return acc;
            },
            {}
          );
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getTipoDiscosDurosNombre(id_tipodd) {
      return this.tipodiscosduros[id_tipodd] || "Desconocido";
    },
    //========= RAM
    async fetchRam() {
      try {
        const response = await axios.get(`${apiUrl}/ram`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.rams = response.data.reduce((acc, ram) => {
            acc[ram.id_ram] = ram.nombre_ram;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getRamNombre(id_ram) {
      return this.rams[id_ram] || "Desconocido";
    },
    //========= Antivirus
    async fetchAntivirus() {
      try {
        const response = await axios.get(`${apiUrl}/antivirus`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.antivirus = response.data.reduce((acc, antivirus) => {
            acc[antivirus.id_antivirus] = antivirus.nombre_antivirus;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getAntivirusNombre(id_antivirus) {
      return this.antivirus[id_antivirus] || "Desconocido";
    },
    //========= Office
    async fetchOffice() {
      try {
        const response = await axios.get(`${apiUrl}/office`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.offices = response.data.reduce((acc, office) => {
            acc[office.id_office] = office.nombre_office;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getOfficeNombre(id_office) {
      return this.offices[id_office] || "Desconocido";
    },
    //========= licoffice
    async fetchLicOffice() {
      try {
        const response = await axios.get(`${apiUrl}/licoffice`, {
          
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.licoffices = response.data.reduce((acc, licoffice) => {
            acc[licoffice.id_licoffice] = licoffice.nombre_licoffice;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las categorías:", error);
      }
    },
    getLicOfficeNombre(id_licoffice) {
      return this.licoffices[id_licoffice] || "Desconocido";
    },
    //========= Agencias
    async fetchAgencias() {
      try {
        const response = await axios.get(`${apiUrl}/agencia`, {
          
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.agencias = response.data.reduce((acc, agencia) => {
            acc[agencia.id_agencia] = agencia.nombre_age;
            return acc;
          }, {});
        }
      } catch (error) {
        console.error("Error al obtener las agencias:", error);
      }
    },
    getAgenciaNombre(id_agencia) {
      return this.agencias[id_agencia] || "Desconocido";
    },

    //========= Departamentos
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
        console.error("Error al obtener departamentos:", error);
      }
    },
    getDepartamentoNombre(id_depto) {
      return this.departamentos[id_depto] || "Desconocido";
    },

    //========= Areas
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
        console.error("Error al obtener areas:", error);
      }
    },
    getAreaNombre(id_area) {
      return this.areas[id_area] || "Desconocido";
    },
    //--------------------------const response = await axios.get(`${apiUrl}/depto-areas`
    fetchDepartamentoArea() {
  axios.get(`${apiUrl}/depto-areas`)
    .then(response => {
      this.departamentosAreas = response.data.reduce((acc, item) => {
        if (!acc[item.departamento.id_depto]) {
          acc[item.departamento.id_depto] = [];
        }
        acc[item.departamento.id_depto].push({
          id: item.area.id_area,
          nombre: item.area.nombre_area
        });
        return acc;
      }, {});
    })
    .catch(error => {
      console.error('Error al obtener los departamentos y áreas:', error);
    });
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


    // Filtra las áreas según el departamento seleccionado
    filterAreas() {
  if (this.formData.id_depto) {
    this.filteredAreas = this.departamentosAreas[this.formData.id_depto] || [];
  } else {
    this.filteredAreas = [];
  }
},
  
    async guardarEquipo() {
      try {
        if (this.formData.id_equipo) {
          // Actualizar agencia existente agencia
          await axios.put(
            `${apiUrl}/modulocomputadoraequipo/${this.formData.id_equipo}`,
            this.formData
          );
        } else {
          // Crear nueva agencia
          await axios.post(`${apiUrl}/modulocomputadoraequipo`, this.formData); // Usar backticks aquí
        }
        this.fetchEquipos();
        this.cancelForm();
      } catch (error) {
        console.error("Error al guardar la equipo:", error);
      }
    },
    // Eliminar una equipo
    async eliminarEquipo(id) {
      if (confirm("¿Estás seguro de eliminar esta Equipo?")) {
        try {
          await axios.delete(`${apiUrl}/modulocomputadoraequipo/${id}`);
          this.fetchEquipos();
        } catch (error) {
          console.error("Error al eliminar la Equipo:", error);
        }
      }
    },

    //-------------------------------------------------------------
    
 
    // Método para cancelar la edición
    cancelForm() {
      this.formData = {
        id_antivirus: null,
        id_catego: null,
        id_cpu: null,
        id_dd: null,
        id_equipo: null,
        id_licoffice: null,
        id_licso: null,
        id_marca: null,
        id_modelo: null,
        id_office: null,
        id_ram: null,
        id_so: null,
        id_tipodd: null,
        numero_serie: "",
        id_agencia: null,
        id_depto: null,
        id_area: null,
        empleado: "",
      };
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
      this.soloLectura = false;
    },
    // Resetear los datos del formulario
    resetForm() {
      this.formData = {
        id_agencia: null,
        nombre_age: "",
      };
    },
    // Editar una agencia
    editAgency(agency) {
      this.formData = { ...agency }; // Asignar los datos de la agencia al formulario
      this.showForm = true;
      this.editMode = true;
      this.soloLectura = false;
    },
    // Método para editar
    editEquipo(equipo) {
      this.formData = { ...equipo };
      this.showForm = true;
      this.editMode = true;
      this.soloLectura = false;
    },

    // Método para mostrar
    mostrarEquipo(equipo) {
      this.formData = { ...equipo };
      this.showForm = true;
      this.editMode = false; // Establecer editMode en false cuando se muestra
      this.soloLectura = true; // Solo lectura en modo mostrar
    },

    botonMostrar(){
      this.botonMostrar=false;
    }
  },
};
</script>

<style>
/* Aquí puedes incluir el estilo del nuevo diseño según lo necesites */
</style>
