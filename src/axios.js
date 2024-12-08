import axios from 'axios';


import { API_BASE_URL } from "@/config";
axios.defaults.baseURL = "https://162a-189-164-39-38.ngrok-free.app/api";
axios.defaults.headers.common["ngrok-skip-browser-warning"] = "true";
axios.defaults.withCredentials = true;
const apiUrl =API_BASE_URL
const api = axios.create({
  baseURL: apiUrl,
});

// Interceptor para agregar el token en cada solicitud
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('auth_token');
    if (token) {
      config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

export default api;
