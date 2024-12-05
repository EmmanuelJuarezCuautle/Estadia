<template>
    <div v-if="visible" :class="`alert alert-${type}`" data-notify="container">
      <button type="button" class="close" @click="closeAlert">
        &times;
      </button>
      <span data-notify="message">{{ message }}</span>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      message: {
        type: String,
        required: true,
      },
      type: {
        type: String,
        default: "info", // Valores: primary, info, success, warning, danger
      },
    },
    data() {
      return {
        visible: true,
      };
    },
    methods: {
      closeAlert() {
        this.visible = false;
      },
    },
  };
  </script>
  
  <style scoped>
  @import "/src/assets/sass/lbd/_alerts.scss";
  </style>
  