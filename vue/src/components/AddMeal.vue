<template>
  <div>
    <form v-on:submit.prevent="addMeal">
        Meal: <input type="text" v-model="Meal.meals">
        Ingredients: <input type="text" v-model="Meal.ingredients">
        <button>Save</button>
    </form>
  </div>
</template>

<script>
import MealService from '../services/MealService.js';

export default {
    data(){
        return{
            Meal: {}
        }
    },
    methods: {
        addMeal(){
            MealService.addMeal(this.Meal).then((response) => {
                if(response.status == 200) {
                        window.alert("Meal Added!");
                        this.Meal = {};
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