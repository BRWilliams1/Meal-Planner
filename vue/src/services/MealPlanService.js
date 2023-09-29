import axios from 'axios';

export default {

    getAllMealPlans(){
        return axios.get("/mealplan");
    },

    getMealPlanById(id){
        return axios.get("/mealplan/" + id);
    },

    addMealPlan(mealplan){
        return axios.post("/addMealPlan", mealplan);
    },

    editMealPlan(mealplan){
        return axios.put("/editMealPlan", mealplan);
    },

    deleteMealPlan(id){
        return axios.delete("/mealplan/" + id);
    }

}