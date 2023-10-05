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
        <tr v-for="mealPlan in mealPlanNames" :key="mealPlan.mealPlanId">
          <td><router-link :to="{ name: 'mealPlanDetails', params:{id: mealPlan.mealPlanId}}">
            {{ mealPlan.mealPlanName }}</router-link></td>
        </tr>
      </tbody>
    </table>
    <button><router-link :to="{ name: 'generateMealPlan' }">Add Mealplan</router-link></button>

  </div>
</template>
  
<script>
import MealPlansService from '../services/MealPlansService';
import HouseholdService from '../services/HouseholdService';

export default {
  name: "browse-meal-plans",
  data() {
    return {
      mealPlanNames: [],
    }
  },
  async created() {
    const response = await HouseholdService.getUsersHouseholdId();
    const mealPlanResponse = await MealPlansService.getAllMealPlanNames(response.data.householdId);
    this.mealPlanNames = mealPlanResponse.data;
  },
};
</script>

<style scoped>
.browseMealPlans {
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.browseMealPlans table {
  width: 50%;
}

.browseMealPlans button {
  width: 10%;
}

.browseMealPlans h1 {
  margin-bottom: 20px;
}

</style>