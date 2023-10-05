<template>
  <div class="browseMealPlans">
    <h1>Meal Plan: {{ this.mealPlanName }}</h1>
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
          <div>
            <form v-on:submit.prevent="addMealToMealPlan">
            <label>All Meals</label>
            <select v-model="selectedMeal" @change="createMealPlanData(selectedMeal, mealPlan)">
              <option v-for="meal in allMeals" v-bind:key="meal" :value="meal">{{ meal.mealName }}</option>
            </select>
            <button>Save</button>
            <label>My Meals</label>
            <select v-model="selectedMeal" @change="createMealPlanData(selectedMeal, mealPlan)">
              <option v-for="meal in myMeals" v-bind:key="meal" :value="meal">{{ meal.mealName }}</option>
            </select>
            <button>Save</button>
          </form>
          </div>

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
      mealPlanData: {
        mealId: -1,
        mealPlanId: -1,
        plannerDate: "",
      },
      selectedMeal: null,
    }
  },
  created() {
    this.mealPlanId = this.$route.params.id;
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
    MealService.getMealById(this.selectedMealId).then((response) => {
      this.mealName = response.data.mealName;
    });
  },
  methods: {
    addMealToMealPlan() {
      console.log(this.mealPlanData);
      MealPlansService.addMealToMealPlan(this.mealPlanData).then((response) => {
        if (response.status == 200) {
          window.alert("Meal added to meal plan!");
          window.location.reload();
        }
      }).catch((error) => {
                if (error.response){
                    window.alert("Bad Request");
                }
                else if (error.request){
                    window.alert("error");
                }
            })
    },
    createMealPlanData(selectedMeal, mealPlan) {
      this.mealPlanData.mealId = selectedMeal.mealId;
      this.mealPlanData.mealPlanId = mealPlan.mealPlanId;
      this.mealPlanData.plannerDate = mealPlan.plannerDate;
    }
  }
};
</script>

<style></style>