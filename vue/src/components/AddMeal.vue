<template>
  <div>
    <form v-on:submit.prevent="addMeal">
        Meal: <input type="text" v-model="meal.meals"/>
        Ingredients: <input type="text" v-model="meal.ingredients"/>
        <button>Save</button>
    </form>
  </div>
</template>

<script>
import MealService from '../services/MealService.js';

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