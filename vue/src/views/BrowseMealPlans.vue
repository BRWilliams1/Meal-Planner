<template>
  <div class="browseMealPlans">
    <h1>Browse Meal Plans</h1>

    <table class="table table-striped">
      <thead>
        <tr>
          <th>Meal Plan Name</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="mealPlan in mealPlanNames" v-bind:key="mealPlan.mealPlanId">
          <td><router-link v-bind:to="{ name: 'mealPlanDetails', params:{id: mealPlan.mealPlanId}}">
            {{ mealPlan.mealPlanName }}</router-link></td>
        </tr>
      </tbody>
    </table>
    <button><router-link v-bind:to="{ name: 'generateMealPlan' }">Add Mealplan</router-link></button>

  </div>
</template>
  
<script>
import MealPlansService from '../services/MealPlansService';
import HouseholdService from '../services/HouseholdService';

export default {
  name: "home",
  data() {
    return {
      mealPlanNames: [],
    }
  },
  created() {

    HouseholdService.getUsersHouseholdId().then((response) => {
      console.log(response.data);
      MealPlansService.getAllMealPlanNames(response.data.householdId).then((response) => {
        console.log(response.data);
        this.mealPlanNames = response.data;
      });
    });
  },
};
</script>

<style></style>