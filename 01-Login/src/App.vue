<template>
  <div id="app" class="d-flex flex-column h-100">
    <nav-bar />
    <div class="container flex-grow-1">
      Vue App version: {{app_version}}
    </div>
    <footer class="bg-light text-center p-3">
      <div class="logo"></div>
      <p>

        Sample project provided by
        Version: {{ app_version }}
        <a href="https://auth0.com">Auth0</a>
      </p>
    </footer>


  </div>
</template>

<script lang="ts">
import NavBar from "./components/NavBar.vue";
import Error from "./components/Error.vue";


export default {
  components: {
    NavBar,
    Error,
  },

  data() {
    return {
      // Access environment variable and store it in component data
      app_version:""
    }
  },


  mounted() {
    this.app_version = window.config.appVersion
  }

};
</script>
