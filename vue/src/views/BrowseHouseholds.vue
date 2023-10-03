<template>
    <div class="home">
      <h1>Browse Households</h1>
      <button><router-link v-bind:to="{ name: 'myHousehold' }">Home</router-link></button>
    
        <div class="household-container">
      <div v-for="household in households" v-bind:key="household.householdId" class="household-card">
        <p>{{ household.householdName }}</p>
        <button @click="showDetails(household)">More Details</button>
      </div>
        </div>
        <p>{{ household.householdId }}</p>
        <p>{{ household.householdName }}</p>
        <p>{{ household.householdOwner }}</p>
        <button @click="joinHousehold(household.householdId)">Join Household</button>
      </div>
    

  </template>
  
  <script>
  import HouseholdService from '../services/HouseholdService';
  
  export default {
    name: "home",
    data(){
      return{
        households: [],
        household:{}
      }
    },
    created(){
      HouseholdService.getAllHouseholds().then((response) => {
        this.households = response.data;
      })
    },
    methods: {
            joinHousehold(householdId){
                this.household.householdId = householdId;
                HouseholdService.joinHousehold(this.household).then(response => {
                    if(response.status === 200){
                        window.alert("Household joined!");
                        this.$router.push({name: "myHousehold"});
                    }
                })
            }
        },
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