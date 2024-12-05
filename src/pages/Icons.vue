<template>
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <card>
            <template slot="header">
              <h4 class="card-title">Opciones de Administración</h4>
              <p class="card-category">
                Selecciona una opción para gestionar los datos
              </p>
            </template>
            <div class="all-icons">
              <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 mb-4" v-for="(route, index) in routes" :key="index">
                  <div class="option-panel p-3 text-center">
                    <router-link :to="route.path" class="text-decoration-none">
                      <i :class="route.icon" class="display-4"></i>
                      <p>{{ route.name }}</p>
                    </router-link>
                  </div>
                </div>
              </div>
            </div>
          </card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  
  data() {
    return {
      routes: [
        { path: "/admin/agencias", name: "Agencias", icon: "fa-solid fa-building" },
        { path: "/admin/departamentos", name: "Departamentos", icon: "fa-solid fa-sitemap" },
        { path: "/admin/areas", name: "Áreas", icon: "fa-solid fa-th-large" },
        { path: "/admin/categorias", name: "Categorías", icon: "fa-solid fa-tags" },
        { path: "/admin/marcas", name: "Marcas", icon: "fa-solid fa-trademark" },
        { path: "/admin/modelos", name: "Modelos", icon: "fa-solid fa-cubes" },
        { path: "/admin/monitores", name: "Monitores", icon: "fa-solid fa-desktop" },
        { path: "/admin/sistemaoperativo", name: "Sistema Operativo", icon: "fa-solid fa-cogs" },
        { path: "/admin/procesadores", name: "Procesadores", icon: "fa-solid fa-microchip" },
        { path: "/admin/discoduro", name: "Disco Duro", icon: "fa-solid fa-hdd" },
        { path: "/admin/ram", name: "Memoria RAM", icon: "fa-solid fa-memory" },
        { path: "/admin/antivirus", name: "Antivirus", icon: "fa-solid fa-shield-alt" },
        { path: "/admin/office", name: "Office", icon: "fa-solid fa-file-alt" },
        { path: "/admin/deptoarea", name: "DeptoArea", icon: "fa-solid fa-file-alt" },
        //{ path: "/admin/administradores", name: "Administradores", icon: "fa-solid fa-user-alt" }
      ]
    };
  },
};
</script>
<style>
.option-panel {
  border: 1px solid #ccc;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s, box-shadow 0.3s;
  background-color: #ffffff;
}
.option-panel:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
.option-panel i {
  color: #007bff;
}
.option-panel p {
  margin-top: 10px;
  font-size: 1.1em;
  font-weight: bold;
  color: #333;
}
</style>
