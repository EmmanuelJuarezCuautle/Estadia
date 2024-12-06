<template>
  <div class="wrapper">
    <side-bar>
      <mobile-menu slot="content"></mobile-menu>
      <sidebar-link to="/admin/panel">
        <i class="nc-icon nc-chart-pie-36"></i>
        <p>Panel</p>
      </sidebar-link>
      <sidebar-link to="/admin/datosgenerales">
        <i class="nc-icon nc-bullet-list-67"></i>
        <p>Datos generales</p>
      </sidebar-link>
      <sidebar-link to="/admin/equipos">
        <i class="nc-icon nc-tv-2"></i>
        <p>Equipos</p>
      </sidebar-link>

      <!-- <sidebar-link to="/admin/modulocontrolgeneral">
        <i class="nc-icon nc-single-copy-04"></i>
        <p>Control General</p>
      </sidebar-link> -->
      <sidebar-link to="/admin/mantenimiento">
        <i class="nc-icon nc-settings-90"></i>
        <p>Mantenimientos</p>
      </sidebar-link>
      
      
      <sidebar-link to="/admin/admin">
        <i class="nc-icon nc-circle-09"></i>
        <p>Administradores</p>
      </sidebar-link>

    </side-bar>
    <div class="main-panel">
      <top-navbar></top-navbar>

      <dashboard-content @click="toggleSidebar">

      </dashboard-content>

      <content-footer></content-footer>
    </div>
  </div>
</template>
<style lang="scss">

</style>
<script>
  import TopNavbar from './TopNavbar.vue'
  import ContentFooter from './ContentFooter.vue'
  import DashboardContent from './Content.vue'
  import MobileMenu from './MobileMenu.vue'
  export default {
    components: {
      TopNavbar,
      ContentFooter,
      DashboardContent,
      MobileMenu
    },
    methods: {
      toggleSidebar () {
        if (this.$sidebar.showSidebar) {
          this.$sidebar.displaySidebar(false)
        }
      }
    }
  }

</script>
