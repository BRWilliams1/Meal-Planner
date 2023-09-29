<template>
  <div class="home">
    
    <h1>List Of Meal Plan</h1>
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Meal Plan ID</th>
      <th scope="col">Meal Plan Name</th>
      <th scope="col">Meal Plan Date</th>
      <th scope="col">Household ID</th>
        </tr>
  </thead>
  <tbody>
    <tr v-for="mealplan in mealplans" v-bind:key="mealplan.mealsPlansId">
      <td>{{ mealplan.mealsPlansId }}</td>
      <td>{{ mealplan.mealsName }}</td>
      <td>{{ mealplan.date }}</td>
      <td>{{ mealplan.householdId }}</td>
        <button> 
         <router-link
      v-bind:to="{name: 'editMealPlan', params:{id : mealplan.mealsPlansId} }" 
   
    > Edit Meal Plan </router-link>
    </button>
        <button>
         <router-link
      v-bind:to="{name: 'deleteMealplan', params:{id : mealplan.mealsPlansId}  }" 
   
    > Delete Mealplan  </router-link>
         </button> 

    </tr>
  </tbody>
</table>
 <button>
 <router-link
      v-bind:to="{name: 'addMealPlan' }"
   
   > Add Meal Plan </router-link> 
   
</button> 

  </div>
  
</template>


<script>
import MealPlanService from '../services/MealPlanService';

export default {
  name: "home",
  data(){
    return {
      mealPlans: []
    }
  },
  created(){
    MealPlanService.getAllMealPlans().then((resp) => {
        this.mealPlans = resp.data;
      }
    );
  }
};
</script>

<style scoped>

</style>
