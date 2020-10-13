<template>
  <div>
    <card></card>
  </div>
</template>

<script>
  import Card from '../components/Card.vue'

  export default {
    name: 'Home',
    components: {
      'card': Card
    }
  }
</script>

<style>

  @import url('https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap');

  body {
    background: #1A1A1A;
  }

  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
  }

  h1, h2 {
    font-weight: normal;
  }

  ul {
    list-style-type: none;
    padding: 0;
  }

  li {
    display: inline-block;
    margin: 0 10px;
  }

  a {
    color: #42b983;
  }
</style>
