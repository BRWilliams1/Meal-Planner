<template>
  <div class="home">
    <h1>Home</h1>
    <div v-for="meal in meals" v-bind:key="meal.id">
      <p>{{meal.id}}</p>
      <h2>{{meal.meals}}</h2>
      <p>{{meal.ingredients}}</p>
      <router-link v-bind:to="{name: 'modify', params: {id: meal.id}}">See Details</router-link>
    </div>
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
