<template>
    <div class="home">
        <h1>My Meals</h1>
        <router-link v-bind:to="{ name: 'addMeal' }"> Add Meal </router-link>
        <div class="meals-container">
            <div v-for="meal in meals" v-bind:key="meal.mealId" class="meal-card">
                <p>{{ meal.mealName }}</p>
                <button @click="showDetails(meal)">More Details</button>
            </div>
        </div>
        <div class="popup" v-if="selectedMeal">
            <div v-if="displayEditMeal == false">
                <h2>{{ selectedMeal.mealName }}</h2>
                <p>{{ selectedMeal.description }}</p>
                <p>{{ selectedMeal.ingredients }}</p>
                <p>{{ selectedMeal.instructions }}</p>
                <button @click="toggleEditMeal">Edit Meal</button>
                <button @click="deleteMeal">Delete Meal</button>
            </div>

            <div v-else>
                <edit-meal :meal="selectedMeal" />
                <button @click="toggleEditMeal">Cancel</button>
            </div>
            <button @click="hideDetails">Close</button>
        </div>

    </div>
</template>
  
<script>
import MealService from '../services/MealService';
import EditMeal from '../components/EditMeal.vue';

export default {
    name: "home",
    data() {
        return {
            meals: [],
            selectedMeal: null,
            displayEditMeal: false
        }
    },
    components: {
        EditMeal
    },
    created() {
        MealService.getUsersMeal().then((response) => {
            console.log(response.data);
            this.meals = response.data;
        })
    },
    methods: {
        showDetails(meal) {
            this.selectedMeal = meal;
        },
        hideDetails() {
            this.selectedMeal = null;
        },
        toggleEditMeal() {
            this.displayEditMeal = !this.displayEditMeal;
        },
        // editMeal() {
        //     MealService.editMeal(this.selectedMeal).then((response) => {
        //         if (response.status == 200) {
        //             window.alert("Meal updated!");
        //             window.location.reload();
        //         }
        //     })
        // },
        deleteMeal(){
            if(confirm("Are you sure you want to delete this Meal?")){
                MealService.deleteMeal(this.selectedMeal.mealId).then(response => {
                    if(response.status === 200){
                        window.alert("Meal deleted!");
                        window.location.reload();
                    }
                })
            }
        }
    }
};
</script>

<style scoped>
.home {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.meals-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
}

.meal-card {
    width: calc(33.33% - 10px);
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.popup {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 150px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    z-index: 999;
}
</style>