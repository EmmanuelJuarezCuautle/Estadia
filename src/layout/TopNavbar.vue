<template>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <div class="collapse navbar-collapse justify-content-end">
        <ul class="nav navbar-nav mr-auto">
          <!--<base-dropdown tag="li">
            <template slot="title">
              <i class="nc-icon nc-planet"></i>
              <b class="caret"></b>
              <span class="notification">5</span>
            </template>
            <a class="dropdown-item" href="#">Notification 1</a>
            <a class="dropdown-item" href="#">Notification 2</a>
            <a class="dropdown-item" href="#">Notification 3</a>
            <a class="dropdown-item" href="#">Notification 4</a>
            <a class="dropdown-item" href="#">Another notification</a>
          </base-dropdown>-->
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="#" class="nav-link" @click="salir">
              <i class="nc-icon nc-button-power" style="margin-right: 5px;"></i>
              Salir
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>

export default {
  computed: {
    routeName () {
      const {name} = this.$route
      return this.capitalizeFirstLetter(name)
    }
  },
  data () {
    return {
      activeNotifications: false
    }
  },
  methods: {
    capitalizeFirstLetter (string) {
      return string.charAt(0).toUpperCase() + string.slice(1)
    },
    toggleNotificationDropDown () {
      this.activeNotifications = !this.activeNotifications
    },
    closeDropDown () {
      this.activeNotifications = false
    },
    toggleSidebar () {
      this.$sidebar.displaySidebar(!this.$sidebar.showSidebar)
    },
    hideSidebar () {
      this.$sidebar.displaySidebar(false)
    },
    salir() {
  console.log("Intentando cerrar sesión...");

  const token = localStorage.getItem('auth_token');
  if (!token) {
    console.error("No hay token disponible");
    return;
  }

  console.log("Token obtenido:", token);

  this.$axios.post('/auth/logout', {}, {
    headers: {
      Authorization: `Bearer ${token}`
    }
  })
    .then(response => {
      console.log("Respuesta del servidor:", response.data);
      localStorage.removeItem('auth_token');
      this.$router.push('/login');
    })
    .catch(error => {
      console.error("Error al cerrar sesión:", error.response ? error.response.data : error);
    });
}
,
  }
}
</script>

<style>
/* Estilos adicionales si los necesitas */
</style>
