<template>
  <div class="home">
    <img alt="Vue logo" src="@/assets/logo.png">
    <h1>Welcome to Your Vue.js App</h1>
    <p>This is the home page</p>
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script setup lang="ts">
import HelloWorld from '../components/HelloWorld.vue'
</script>

<style scoped>
.home {
  text-align: center;
  margin-top: 60px;
}
</style>
