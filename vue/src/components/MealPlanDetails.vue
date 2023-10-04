<template>
    <div class="browseMealPlans">
      <h1>Meal Plan: {{ this.mealPlanName }}</h1>
  
      <table class="table table-striped">
        <p>{{ this.mealPlanId }}</p>
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
            <label>All Meals</label>
          <select >
              <option v-for="meal in allMeals"  v-bind:key="meal.mealId">{{ meal.mealName }}</option>
          </select>
          <input type="submit" value="Save">
          <label>My Meals</label>
          <select >
              <option v-for="meal in myMeals"  v-bind:key="meal.mealId">{{ meal.mealName }}</option>
          </select>
          <input type="submit" value="Save">
            <!-- <button><router-link
                v-bind:to="{ name: 'editMealPlan', params: { id: mealPlan.mealPlanId } }">Edit</router-link></button> -->
          </tr>
        </tbody>
      </table>
  
    </div>
  </template>
    
  <script>
  import MealPlansService from '../services/MealPlansService';
  import MealService from '../services/MealService';
  
  export default {
    name: "home",
    data() {
      return {
        mealPlans: [],
        allMeals: [],
        myMeals: [],
        mealPlanId: -1,
        mealPlanName: "",
      }
    },
    created() {
      this.mealPlanId = this.$route.params.id;
      console.log(this.mealPlanId);
      MealPlansService.getMealPlansByMealPlanId(this.mealPlanId).then((response) => {
              this.mealPlans = response.data;
              this.mealPlans.forEach(mealPlan => {
                this.mealPlanName = mealPlan.mealPlanName;
              });
          });
      MealService.getAllMeals().then((response) => {
        this.allMeals = response.data;
      });
      MealService.getUsersMeal().then((response) => {
        this.myMeals = response.data;
      });
    },
  };
  </script>
  
  <style></style>