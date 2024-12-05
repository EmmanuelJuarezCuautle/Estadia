<template>
  <div class="container mt-4">
    <h2 class="letra1">Gestión de Datos</h2>
    <div class="text-left mb-4">
      <button class="btn btn-add btn-sm" @click="openForm">
        <i class="fa-solid fa-square-plus" style="margin-right: 10px"></i>
        Agregar Datos
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
          <form @submit.prevent="guardarModulocontrolgeneral">
            <div class="row mt-2">
              <!-- Equipo -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="equipo">Equipo</label>
                  <select
                    id="equipo"
                    v-model="formData.id_equipo"
                    class="form-control"
                    :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Selecciona Equipo</option>
                    <option
                      v-for="(equipo, id) in equipos":key="id":value="id">
                      {{ equipo.id_equipo }}
                    </option>
                  </select>
                </div>
              </div>

              <!-- Agencia -->
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
                    <option value="" disabled>Seleccione una agencia</option>
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

              <!-- Departamento -->
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
                    <option value="" disabled>
                      Seleccione un Departamento
                    </option>
                    <option
                      v-for="(nombre, id) in departamentos"
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
              <!-- Area -->
              <div class="col-md-4">
                <div class="form-group">
                  <label for="area">Areas</label>
                  <select
                    id="area"
                    v-model="formData.id_area"
                    class="form-control"
                    :disabled="soloLectura"
                    required
                  >
                    <option value="" disabled>Seleccione una Area</option>
                    <option v-for="(nombre, id) in areas" :key="id" :value="id">
                      {{ nombre }}
                    </option>
                  </select>
                </div>
              </div>

              <!--Lic Categoria-->
              <div class="col-md-4">
                <label for="categoria">Categoria</label>
                <select
                  id="categoria"
                  v-model="formData.id_catego"
                  :disabled="soloLectura"
                  class="form-control"
                >
                  <option value="" disabled>Seleccione una Categoria</option>
                  <option
                    v-for="(nombre, id) in categorias"
                    :key="id"
                    :value="id"
                  >
                    {{ nombre }}
                  </option>
                </select>
              </div>

              <!--NUMERO SERIE-->
                <div class="col-md-4">
                  <label for="numero_serie">Número de serie</label>
                  <select
                    id="numero_serie"
                    v-model="formData.numero_serie"
                    :disabled="soloLectura"
                    class="form-control"
                  >
                    <option value="" disabled>Seleccione un número de serie</option>
                    <option v-for="(equipo, id) in equipos" :key="id" :value="id">
                      {{ equipo.numero_serie }}
                    </option>
                  </select>
                </div>



            </div>

            <!-- Empleado-->
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
    <!--Tabla Principal de mostrar datos de API-->
    <div class="table-responsive">
      <table class="table table-striped table-hover text-center">
        <thead class="thead-dark">
          <tr>
            <th scope="col" style="width: 5%">#</th>
            <th scope="col" style="width: 20%">Equipo</th>
            <th scope="col" style="width: 20%">Agencia</th>
            <th scope="col" style="width: 20%">Departamento</th>
            <th scope="col" style="width: 20%">Area</th>
            <th scope="col" style="width: 20%">Empleado</th>
            <th scope="col" style="width: 20%">Categoria</th>
            <th scope="col" style="width: 20%">Número de Serie</th>

            <th scope="col" style="width: 17%">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="controlgeneral in controlesgeneral"
            :key="controlgeneral.id_mod_general"
          >
            <td>{{ controlgeneral.id_mod_general }}</td>
            <td>{{ getEquiposNombre(controlgeneral.id_equipo) }}</td>
            <td>{{ getAgenciasNombre(controlgeneral.id_agencia) }}</td>
            <td>{{ getDepartamentosNombre(controlgeneral.id_depto) }}</td>
            <td>{{ getAreasNombre(controlgeneral.id_area) }}</td>
            <td>{{ controlgeneral.empleado }}</td>
            <td>{{ getCategoriaNombre(controlgeneral.id_catego) }}</td>
            <!-- Ajuste aquí -->
            <td>{{ getEquiposSerie(controlgeneral.id_equipo) }}</td>
            <!-- Ajuste aquí -->

            <td class="td-actions">
              <button
                class="btn btn-warning btn-sm"
                style="margin-right: 10px"
                @click="editEquipo(modulocontrolgeneral)"
              >
                <i class="fa-solid fa-pen-to-square"></i> Editar
              </button>
              <button
                class="btn btn-warning btn-sm"
                style="margin-right: 10px"
                @click="mostrarEquipo(modulocontrolgeneral)"
              >
                <i class="fa-solid fa-pen-to-square"></i> Mostrar
              </button>
              <button
                class="btn btn-danger btn-sm"
                @click="eliminarEquipo(equipo.id_equipo)"
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
      controlesgeneral: [],
      equipos: [],
      categorias: [],
      agencias: [],
      departamentos: [],
      areas: [],

      showForm: false,
      editMode: false,
      formData: {
        id_mod_general: null,
        id_equipo: "",
        id_agencia: "",
        id_depto: "",
        id_area: "",
        empleado: "",
        id_catego: "",
      },
      soloLectura: false,
      botonMostrar: true,
    };
  },
  mounted() {
    this.fetchControlGeneral();
    this.fetchEquipos();
    this.fetchCategorias();
    this.fetchAgencias();
    this.fetchDepartamentos();
    this.fetchAreas();
  },
  methods: {
    async fetchControlGeneral() {
      try {
        const response = await axios.get(`${apiUrl}/modulocontrolgeneral`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data)) {
          this.controlesgeneral = response.data;
        }
      } catch (error) {
        console.error("Error al obtener los datos:", error);
      }
    },
    async fetchEquipos() {
      try {
        const response = await axios.get(`${apiUrl}/modulocomputadoraequipo`, {
          headers: { "ngrok-skip-browser-warning": "true" },
        });
        console.log("Equipos obtenidos:", response.data.data);
        if (response.data && Array.isArray(response.data.data)) {
          this.equipos = response.data.data.reduce((acc, equipo) => {
            acc[equipo.id_equipo] = {
              id_equipo: equipo.id_equipo,
              numero_serie: equipo.numero_serie,
              id_catego: equipo.id_catego || "Categoría Desconocida",
            };
            return acc;
          }, {});
          console.log("Equipos procesados:", this.equipos);
        }
      } catch (error) {
        console.error("Error al obtener los Equipos:", error);
      }
    },
    getEquiposNombre(id_equipo) {
      return this.equipos[id_equipo]
        ? this.equipos[id_equipo].id_equipo
        : "Desconocido";
    },
    getEquiposSerie(id_equipo) {
      return this.equipos[id_equipo]
        ? this.equipos[id_equipo].numero_serie
        : "Desconocido";
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
    getAgenciasNombre(id_agencia) {
      return this.agencias[id_agencia] || "Desconocido";
    },
    //========= Departamento
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
        console.error("Error al obtener las agencias:", error);
      }
    },
    getDepartamentosNombre(id_depto) {
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
        console.error("Error al obtener las areas:", error);
      }
    },
    getAreasNombre(id_area) {
      return this.areas[id_area] || "Desconocido";
    },

    //========= Categorias
    async fetchCategorias() {
      try {
        const response = await axios.get(`${apiUrl}/categoria`, {
          headers: {
            "ngrok-skip-browser-warning": "true",
          },
        });
        if (response.data && Array.isArray(response.data.data)) {
          this.categorias = response.data.data.reduce((acc, categoria) => {
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

    async guardarModulocontrolgeneral() {
      try {
        if (this.formData.id_equipo) {
          // Actualizar agencia existente agencia
          await axios.put(
            `${apiUrl}/modulocontrolgeneral/${this.formData.id_equipo}`,
            this.formData
          );
        } else {
          // Crear nueva agencia
          await axios.post(`${apiUrl}/modulocontrolgeneral`, this.formData); // Usar backticks aquí
        }
        this.fetchEquipos();
        this.cancelForm();
      } catch (error) {
        console.error("Error al guardar los datos:", error);
      }
    },
    // Eliminar una equipo
    async eliminarEquipo(id) {
      if (confirm("¿Estás seguro de eliminar esta Equipo?")) {
        try {
          await axios.delete(`${apiUrl}/modulocontrolgeneral/${id}`);
          this.fetchEquipos();
        } catch (error) {
          console.error("Error al eliminar los datos:", error);
        }
      }
    },

    //-------------------------------------------------------------

    cancelForm() {
      this.formData = {
        id_mod_general: null,
        id_equipo: null,
        id_agencia: null,
        id_depto: null,
        id_area: null,
        empleado: "",
        id_catego: null,
      };
    },
    editEquipo(modulocontrolgeneral) {
      this.editMode = true;
      this.formData = { ...modulocontrolgeneral };
      this.showForm = true;
    },
    // Método para cancelar la edición
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
    mostrarEquipo(modulocontrolgeneral) {
      this.formData = { ...modulocontrolgeneral }; // Carga los datos en el formulario
      this.soloLectura = true; // Activa el modo de solo lectura solo para "Mostrar"
      this.showForm = true; // Muestra el formulario
    },
    botonMostrar() {
      this.botonMostrar = false;
    },
  },
};
</script>

<style>
/* Aquí puedes incluir el estilo del nuevo diseño según lo necesites */
</style>
