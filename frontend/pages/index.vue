<template>
  <div>
    <h1>Liste des machines actives</h1>
    <ul>
      <li v-for="(container, i) in containers" :key="i">
        <a :href="container" class="machine">
          <img src="../assets/images/pc.png" alt="PC icon" />
          poste {{ i }}
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
import containers from '../static/containers.json'
export default {
  name: 'IndexPage',
  data() {
    return {
      containers,
    }
  },
}
</script>

<style lang="scss">
@font-face {
  font-family: 'Microgramma D';
  src: url('../assets/fonts/Microgramma D.otf');
}

html {
  font-family: 'Microgramma D', sans-serif;
  min-height: 100vh;
}

body {
  margin: 0;
  padding: 30px;
  background-color: khaki;
  background-image: url('../assets/images/waves.svg');
  background-position: center bottom 50px;
  background-repeat: no-repeat;
  background-size: contain;
  height: 100%;
}

ul {
  padding: 40px;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: 50px;
  list-style: none;

  border: solid 8px black;
  background-color: burlywood;
  box-shadow: 20px 20px 0 rgba(0, 0, 0, 0.6);

  background-image: url('../assets/images/points.svg');
  background-repeat: no-repeat;
  background-size: cover;
  li {
    a {
      display: block;
      text-decoration: none;
      color: black;

      text-align: center;
      padding: 20px;
      transition: all 0.5s;

      border: solid 8px black;
      background-color: peru;
      box-shadow: 0 0 0 rgba(0, 0, 0, 0.8);
      &:hover {
        box-shadow: 10px 10px 0 rgba(0, 0, 0, 0.6);
        transform: translate3d(-10px, -10px, 0);
      }
    }
    img {
      width: 100%;
      height: 100%;
    }
  }
}
</style>
