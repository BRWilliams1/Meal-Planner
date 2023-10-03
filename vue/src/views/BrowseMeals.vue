<template>
  <div class="home">
    <h1>Browse Meals</h1>
    <router-link v-bind:to="{name: 'addMeal' }"> Add Meal </router-link>
    <router-link v-bind:to="{name: 'browseMyMeals' }"> Browse My Meals </router-link> 
    <div class="meals-container">
      <div v-for="meal in meals" v-bind:key="meal.mealId" class="meal-card">
        <p>{{ meal.mealName }}</p>
        <button @click="showDetails(meal)">More Details</button>
      </div>
    </div>
    <div class="popup" v-if="selectedMeal">
      <h2>{{ selectedMeal.mealName }}</h2>
      <p>{{ selectedMeal.description }}</p>
      <p>{{ selectedMeal.ingredients }}</p>
      <p>{{ selectedMeal.instructions }}</p>
      <button @click="hideDetails">Close</button>
    </div>
    <!-- <router-link v-bind:to="{name: 'editMeal', params:{id : meal.mealId}}">
          Edit Meal
        </router-link>
        <router-link v-bind:to="{name: 'deleteMeal', params:{id : meal.mealId}}">
          Delete Meal
        </router-link> -->
  </div>
</template>

<script>
import MealService from '../services/MealService';

export default {
  name: "home",
  data(){
    return{
      meals: [],
      selectedMeal: null
    }
  },
  created(){
    MealService.getAllMeals().then((response) => {
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


<!-- <template>
  <div class="home">
    <h1>Browse Meals</h1>
    <router-link v-bind:to="{name: 'addMeal' }"> Add Meal </router-link>
    <div v-for="meal in meals" v-bind:key="meal.mealId">
      <p>{{ meal.mealId }}</p>
      <p>{{ meal.mealName }}</p>
      <p>{{ meal.ingredients }}</p>
      <p>{{ meal.instructions }}</p>
      <router-link v-bind:to="{name: 'editMeal', params:{id : meal.mealId}}">
        Edit Meal
      </router-link>
      <router-link v-bind:to="{name: 'deleteMeal', params:{id : meal.mealId}}">
        Delete Meal
      </router-link>
    </div>
  </div>
</template>

<script>
import MealService from '../services/MealService';

export default {
  name: "home",
  data(){
    return{
      meals: []
    }
  },
  created(){
    MealService.getAllMeals().then((response) => {
      console.log(response.data); 
      this.meals = response.data;
    })
  }
};
</script> -->