<template>
    <div>
      <form v-on:submit.prevent="editMealPLan">
        <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Meal Plan ID</label>
  <p  class="form-control" id="exampleFormControlInput1">{{mealplan.mealPlanId}}</p>
</div>
              <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Meal Plan Name</label>
  <input type="text" class="form-control" id="exampleFormControlInput1"   v-model="mealPlan.mealsName"> 
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Household ID</label>
  <p  class="form-control" id="exampleFormControlInput1">{{mealplan.householdId}}  </p>
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Date</label>
  <input type="text" class="form-control" id="exampleFormControlInput1"   v-model="mealPlan.date"> 
</div>

          <button>Save</button>
      </form>
    </div>
  </template>

  <script>
  import MealPlansService from '../services/MealPlansService';

  export default {
      data(){
          return{
            MealPlanId: -1,
            MealPlan: {}
          }
      },
      methods: {
          editMealPlan(){
              MealPlansService.editMealPlan(this.MealPlan).then((response) => {
                  if(response.status == 200) {
                          window.alert("MealPlan updated!");
                          this.$router.push({name: "listOfMealPlan"});
                  }
              })
          }
      },
      created() {
        this.MealPlanId = this.$route.params.id;
        MealPlansService.getMealPlanById(this.MealPlanId).then(
            (response) => {
                this.MealPlan = response.data;
            }
        );
    },
  }
  </script>

  <style>

  </style>