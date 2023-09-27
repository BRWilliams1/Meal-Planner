<template>
  <div class="home">
    <h1>Meals and Ingredients</h1>
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Meals ID</th>
      <th scope="col">Meals </th>
      <th scope="col">Meal Ingredients</th>
    </tr>
  </thead>
  <tbody>
    <tr v-for="meal in meals" v-bind:key="meal.mealsId">
      <td>{{ meal.mealsId }}</td>
      <td>{{ meal.meals }}</td>
      <td>{{ meal.ingredients }}</td>
    </tr>
  </tbody>
</table>
<button>Add Meal</button>
<button>Edit Meal</button>
<button>Delete Meal</button>
  </div>
  
</template>

<script>
import MealService from '../services/MealService';
export default {
  name: "home",
  data(){
    return {
      meals: []
    }
  },
  created(){
    MealService.getAllMeals().then((resp) => {
        this.meals = resp.data;
      }
    );
  }
};
</script>

<style scoped>

</style>
