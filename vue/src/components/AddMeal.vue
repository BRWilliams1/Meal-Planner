<template>
  <div>
    <form v-on:submit.prevent="addMeal">
        <label>Meal</label>
        <input v-model="meal.mealName" />
        <label>Meal Description</label>
        <textarea v-model="meal.description"></textarea>
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
            meal: {}
        }
    },
    methods: {
        addMeal(){
            MealService.addMeal(this.meal).then((response) => {
                if(response.status == 200) {
                        window.alert("Meal Added!");
                        this.meal = {};
                        this.$router.push({name: "home"});
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