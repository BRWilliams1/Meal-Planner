import axios from 'axios';

export default {

    getAllMealPlans(){
        return axios.get("/mealPlans");
    },

    getMealById(id){
        return axios.get("/mealPlan/" + id);
    },

    addMeal(meal){
        return axios.post("/addMealPlan", meal);
    },

    editMeal(meal){
        return axios.put("/editMealPlan", meal);
    },

    // deleteMeal(id){
    //     return axios.delete("/meals/" + id);
    // }

}