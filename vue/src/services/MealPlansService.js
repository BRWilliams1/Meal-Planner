import axios from 'axios';

export default {

    getAllMealPlans(){
        return axios.get("/mealPlans");
    },

    getMealById(id){
        return axios.get("/meals/" + id);
    },

    addMeal(meal){
        return axios.post("/addMeal", meal);
    },

    editMeal(meal){
        return axios.put("/editMeal", meal);
    },

    deleteMeal(id){
        return axios.delete("/meals/" + id);
    }

}