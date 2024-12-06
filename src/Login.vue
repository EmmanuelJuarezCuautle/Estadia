<template>
  <div class="login-container">
    <div class="login-box">
      <!-- Header -->
      <h2>Iniciar Sesión</h2>

      <!-- Icon -->
      <div class="login-icon">
        <img src="../public/img/vue-logo-login.png" alt="User Icon" />
      </div>

      <!-- Login Form -->
      <form v-on:submit.prevent="login">
        <input 
          type="text" 
          placeholder="Correo electrónico" 
          v-model="correo_admin" 
          class="input-field" 
        />
        <input 
          type="password" 
          placeholder="Contraseña" 
          v-model="password" 
          class="input-field" 
        />
        <button type="submit" class="login-btn">Ingresar</button>
      </form>

      <!-- Error Message -->
      <div class="error-message" v-if="error">
        {{ message }}
      </div>
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
      correo_admin: "",
      password: "",
      error: false,
      message: "",
    };
  },
  methods: {
    login() {
      const json = {
        correo_admin: this.correo_admin,
        password: this.password,
      };
      axios
        .post(`${apiUrl}/login`, json)
        .then((response) => {
          if (response.data.status === "ok") {
            this.$router.push("/admin/panel");
          } else {
            this.error = true;
            this.message = response.data.message;
          }
        })
        .catch((error) => {
          console.error(error);
          this.error = true;
          this.message = "Hubo un error al intentar hacer login";
        });
    },
  },
};
</script>

<style scoped>
/* General Styles */
body {
  font-family: "Poppins", sans-serif;
  background-color: #f3f4f6;
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;
  padding: 40px;
  background: linear-gradient(135deg, #56baed, #39ace7);
}

.login-box {
  background: #ffffff;
  border-radius: 15px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
  width: 100%;
  max-width: 500px; /* Ajustado para hacerlo más grande */
  padding: 40px; /* Espacio interno mayor */
  text-align: center;
}

.login-box h2 {
  font-size: 2rem; /* Aumentado */
  margin-bottom: 30px; /* Más espacio debajo */
  color: #333;
}

.login-icon img {
  width: 200px; /* Icono más grande */
  margin-bottom: 20px;
}

.input-field {
  width: 100%;
  padding: 18px; /* Aumentado */
  margin: 15px 0; /* Más espacio entre campos */
  border: 1px solid #ddd;
  border-radius: 8px; /* Bordes más redondeados */
  font-size: 1.1rem; /* Texto más grande */
  background: #f9f9f9;
}

.input-field:focus {
  border-color: #56baed;
  outline: none;
  background: #fff;
}

.login-btn {
  width: 100%;
  padding: 18px; /* Más alto */
  background-color: #56baed;
  color: #ffffff;
  border: none;
  border-radius: 8px;
  font-size: 1.2rem; /* Texto más grande */
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s;
}

.login-btn:hover {
  background-color: #39ace7;
}

.error-message {
  margin-top: 20px;
  padding: 12px;
  background-color: #ffdddd;
  color: #d8000c;
  border: 1px solid #f5c6cb;
  border-radius: 8px;
  font-size: 1rem;
}
</style>

