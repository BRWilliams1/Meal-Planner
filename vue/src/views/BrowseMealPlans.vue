<template>
    <div class="browseMealPlans">
      <h1>Browse Meal Plans</h1>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Date</th>
            <th>Meal Name</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="mealPlan in mealPlans" v-bind:key="mealPlan.mealPlanId">
            <td>{{ mealPlan.plannerDate }}</td>
            <td>{{ mealPlan.mealName }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  import MealPlansService from '../services/MealPlansService';
  
  export default {
    name: "home",
    data(){
      return{
        mealPlans: []
      }
    },
    created(){
      MealPlansService.getAllMealPlans().then((response) => {
        this.mealPlans = response.data;
      })
    },
  };
  </script>

  <style>
  .browseMealPlans {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  /* can you style the table so that eachn item has a box around it  */
   
  </style>