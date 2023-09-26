<template>
    <div>
      <form v-on:submit.prevent="deleteMeal(meal.mealsId)">
          Meal: <input type="text" v-model="meal.meals"/>
          Ingredients: <input type="text" v-model="meal.ingredients"/>
          <button>Delete</button>
      </form>
    </div>
  </template>

  <script>
  import MealService from '../services/MealService.js';

  export default {
      data(){
          return{
            mealId: -1,
            meal: {}
          }
      },
      methods: {
            deleteMeal(id){
                MealService.deleteMeal(id).then(response => {
                    if(response.status === 200){
                        window.alert("Meal deleted!");
                        this.$router.push({name: "home"});
                    }
                })
            }
      },
      created() {
        this.mealId = this.$route.params.id;
        MealService.getMealById(this.mealId).then(
            (response) => {
                this.meal = response.data;
            }
        );
    },
  }
  </script>

  <style>

  </style>