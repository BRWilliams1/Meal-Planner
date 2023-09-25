import axios from 'axios';

// const http = axios.create({
//     baseURL: "http://localhost:3000"
//   });

export default {

    getAllMeals(){
        return axios.get("/meals");
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