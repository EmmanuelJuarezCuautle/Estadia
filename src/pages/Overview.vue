<template>
  <div class="metabase-container">
    <!-- Aquí ponemos el iframe con la URL que generó Metabase -->
    <iframe
      :src="iframeUrl"
      frameborder="0"
      style="width: 100%; height: 100%;"
      allowfullscreen
    ></iframe>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // Aquí va la URL que obtuviste de Metabase
      iframeUrl: "http://localhost:3000/public/dashboard/eef00d94-e43a-4d2e-83c3-c2805ef7b511",
    };
  },
};
</script>

<style>
.metabase-container {
  height: 100vh; /* Ajusta la altura del iframe */
  width: 100%;  /* Ajusta el ancho del iframe */
}
</style>
