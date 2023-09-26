<template>
  <div class="home">
    <h1>Home</h1>
    <table>
      <tr v-for="meal in meals" v-bind:key="meal.mealsId">
        <td>{{ meal.mealsId }}</td>
        <td>{{ meal.meals }}</td>
        <td>{{ meal.ingredients }}</td>
      </tr>
    </table>
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
