<template>
  <div ref="chart" style="width: 100%; height: 400px;"></div>
</template>

<script>
import * as echarts from 'echarts';

export default {
  name: 'BaseChart',
  props: {
    chartOptions: {
      type: Object,
      required: true,
    },
  },
  mounted() {
    this.initChart();
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$refs.chart);
      this.chart.setOption(this.chartOptions);
    },
  },
  watch: {
    chartOptions(newOptions) {
      if (this.chart) {
        this.chart.setOption(newOptions);
      }
    },
  },
};
</script>

<style scoped>
/* Puedes agregar más estilos según tus preferencias */
</style>
