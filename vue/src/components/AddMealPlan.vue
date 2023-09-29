<template>
  <div>
    <form v-on:submit.prevent="addMealPlan">
 
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Meal Plan Name</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="mealplan.mealsName"></textarea>
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Date</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="mealplan.date"></textarea>
</div>

        <button>Save</button>
    </form>

  </div>
</template>

<script>
import MealPlanService from '../services/MealPlanService.js';

export default {
    data(){
        return{
            mealplan: {}
        }
    },
    methods: {
        addMealPlan(){
            MealPlanService.addMealPlan(this.mealplan).then((response) => {
                if(response.status == 200) {
                        window.alert("Meal Plan Added!");
                        this.mealplan = {};
                        this.$router.push({name: "listOfMealPlan"});
                }
            })
            .catch((error) => {
                if (error.response){
                    window.alert("Bad Request");
                }
                else if (error.request){
                    window.alert("error");
                }
            })
        }
    }
}
</script>

<style>

</style>