<template>
    <div>
      <form v-on:submit.prevent="editMeal">
          <label>Meal Name</label>
          <input v-model="mealInfo.mealName" />
          <label>Meal Description</label>
          <textarea v-model="mealInfo.description"></textarea>
          <label>Meal Ingredients</label>
          <textarea v-model="mealInfo.ingredients"></textarea>
          <label>Meal Instructions</label>
          <textarea v-model="mealInfo.instructions"></textarea>
          <button>Save</button>
      </form>
    </div>
  </template>
  
  <script>
  import MealService from '../services/MealService'
  
  export default {
      props: ['meal'],
      data(){
          return{
              mealId: -1,
              mealInfo: this.meal
          }
      },
      methods: {
          editMeal(){
              MealService.editMeal(this.mealInfo).then((response) => {
                  if(response.status == 200) {
                      window.alert("Meal updated!");
                      window.location.reload();
                  }
              });
          }
        }
  }
  
  </script>
  
  <style>
  
  </style>