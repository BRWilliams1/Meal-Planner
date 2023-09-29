<template>
    <div>
      <form v-on:submit.prevent="deleteMealPlan(meal.mealsPlansId)">
              <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Meal Plan ID</label>
  <p class="form-control" id="exampleFormControlInput1"> {{mealPlan.mealsPlansId}} </p>
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Meal Plan Name</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="mealPlan.mealsName"></textarea>
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Date</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="mealPlan.date"></textarea>
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">House Hold Id</label>
  <p class="form-control" id="exampleFormControlTextarea1" rows="3"> {{mealPlan.householdId}}</p>
</div>
          <button>Delete</button>
      </form>
    </div>
  </template>

  <script>
  import MealPlanService from '../services/MealPlanService';

  export default {
      data(){
          return{
            mealPlanId: -1,
            mealPlan: {}
          }
      },
      methods: {
            deleteHousehold(id){
                MealPlanService.deleteMealPlan(id).then(response => {
                    if(response.status === 200){
                        window.alert("Meal Plan deleted!");
                        this.$router.push({name: "listOfMealPlan"});
                    }
                })
            }
      },
      created() {
        this.mealPlanId = this.$route.params.id;
        MealPlanService.getMealPlanById(this.mealPlanId).then(
            (response) => {
                this.mealPlan = response.data;
            }
        );
    },
  }
  </script>

  <style>

  </style>