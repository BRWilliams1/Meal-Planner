<template>
    <div>
      <form v-on:submit.prevent="editMeal">
          <!-- Meal: <input type="text" v-model="meal.meals"/>
          Ingredients: <input type="text" v-model="meal.ingredients"/> -->
              <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Meal</label>
  <input type="text" class="form-control" id="exampleFormControlInput1"   v-model="meal.meals"> 
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Meal Ingredients</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="meal.ingredients"></textarea>
</div>
          <button>Save</button>
      </form>
    </div>
  </template>

  <script>
  import MealService from '../services/MealService.js';

  export default {
      data(){
          return{
            mealId: -1,
            meal: {}
          }
      },
      methods: {
          editMeal(){
              MealService.editMeal(this.meal).then((response) => {
                  if(response.status == 200) {
                          window.alert("Meal updated!");
                          this.$router.push({name: "home"});
                  }
              })
          }
      },
      created() {
        this.mealId = this.$route.params.id;
        MealService.getMealById(this.mealId).then(
            (response) => {
                this.meal = response.data;
            }
        );
    },
  }
  </script>

  <style>

  </style>