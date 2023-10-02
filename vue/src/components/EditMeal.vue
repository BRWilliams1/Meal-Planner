<template>
  <div>
    <form v-on:submit.prevent="editMeal">
        <label>Meal</label>
        <input v-model="meal.mealName" />
        <label>Meal Ingredients</label>
        <textarea v-model="meal.ingredients"></textarea>
        <label>Meal Instructions</label>
        <textarea v-model="meal.instructions"></textarea>
        <button>Save</button>
    </form>
  </div>
</template>

<script>
import MealService from '../services/MealService'
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