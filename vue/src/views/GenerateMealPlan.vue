<template>
    <div>
        <h4>Generate Meal Plan Settings</h4>
        <form v-on:submit.prevent="addMealPlan">
            <label>Meal Plan Name</label>
            <input v-model="mealPlan.mealPlanName" />
            <label>Start Date</label>
            <input type="date" v-model="mealPlan.startDate" />
            <label>End Date</label>
            <input type="date" v-model="mealPlan.endDate" />
            <button>Save</button>
        </form>
    </div>
</template>
  
<script>
import MealPlansService from '../services/MealPlansService'
import HouseholdService from '../services/HouseholdService';

export default {
    props: ['meal'],
    data() {
        return {
            mealPlan: {
                householdId: -1,
            }
        }
    },
    created(){
      HouseholdService.getUsersHouseholdId().then((response) => {
        console.log(response.data);
        this.mealPlan.householdId = response.data.householdId;
      });
    },
    methods: {
        addMealPlan() {
            MealPlansService.addMealPlan(this.mealPlan).then((response) => {
                if (response.status == 200) {
                    window.alert("Meal Plan Added!");
                    this.mealPlan = {};
                    this.$router.push({ name: "browseMealPlans" });
                }
            })
                .catch((error) => {
                    if (error.response) {
                        window.alert("Bad Request");
                    }
                    else if (error.request) {
                        window.alert("error");
                    }
                })
        }
    }
}

</script>
  
<style></style>