<template>
  <div class="container">
    <h1>Welcome to Housemates</h1>
    <h5>Meal Planning for Mixed Households</h5>
    <div>
        <router-link class="home-page-link" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="home-page-link" v-bind:to="{ name: 'browseMeals' }">Browse Meals</router-link>
    </div>
  </div>
</template>
<script>

</script>


<style>
/* could you style it so that the all the content is in the center of the page and so that the links look like buttons
*/
.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.home-page-link {
  display: inline-block;
  margin-top: 20px;
  margin-right: 10px; 
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border-radius: 5px;
  text-decoration: none;
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  cursor: pointer;
}
</style>