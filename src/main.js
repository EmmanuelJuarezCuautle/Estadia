import Vue from "vue";
import VueRouter from "vue-router";
import App from "./App.vue";

// LightBootstrap plugin
import LightBootstrap from "./light-bootstrap-main";
import axios from "axios";
import '@fortawesome/fontawesome-free/css/all.css';
import '@fortawesome/fontawesome-free/js/all.js';
import VueAxios from "vue-axios";  // Importa VueAxios correctamente
// router setup
import routes from "./routes/routes";

import "./registerServiceWorker";

axios.defaults.baseURL = 'https://162a-189-164-39-38.ngrok-free.app/api';
Vue.prototype.$axios = axios;

// plugin setup
Vue.use(VueRouter);
Vue.use(LightBootstrap);
Vue.use(VueAxios, axios);

// configure router
const router = new VueRouter({
  routes, // short for routes: routes
  linkActiveClass: "nav-item active",
  scrollBehavior: (to) => {
    if (to.hash) {
      return { selector: to.hash };
    } else {
      return { x: 0, y: 0 };
    }
  },
});

// Agregar el middleware de autenticación después de la configuración del router
// router.beforeEach((to, from, next) => {
//   const token = localStorage.getItem("auth_token");

//   if (to.matched.some(record => record.meta.requiresAuth)) {
//     if (!token) {
//       next({ name: "Login" });
//     } else {
//       next();
//     }
//   } else {
//     next();
//   }
// });
router.beforeEach((to, from, next) => {
  next(); // Permite el acceso a todas las rutas
});

/* eslint-disable no-new */
new Vue({
  el: "#app",
  render: (h) => h(App),
  router,
});
