<template>
  <div class="browseMealPlans">

    <div class="mealPlans">
      <h1>Browse Meal Plans</h1>

      <table >
        <thead>
          <tr>
            <th>Meal Plan Name</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="mealPlan in mealPlanNames" :key="mealPlan.mealPlanId">
            <td><router-link :to="{ name: 'mealPlanDetails', params: { id: mealPlan.mealPlanId } }">
                {{ mealPlan.mealPlanName }}</router-link></td>
          </tr>
        </tbody>
      </table>
      <button><router-link :to="{ name: 'generateMealPlan' }">Add Mealplan</router-link></button>

    </div>

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
.mealPlans{
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 5px solid #083D77;
  border-radius: 15px;
  height: 50%;
  padding: 15px;
  width: 100%;
}

.browseMealPlans {
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100vh;
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