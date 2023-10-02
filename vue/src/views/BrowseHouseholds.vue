<template>
    <div class="home">
      <h1>Browse Households</h1>
        
      <button><router-link v-bind:to="{ name: 'myHousehold' }">Home</router-link></button>
      <div v-for="household in households" v-bind:key="household.householdId">
        <p>{{ household.householdId }}</p>
        <p>{{ household.householdName }}</p>
        <p>{{ household.householdOwner }}</p>
        <button @click="joinHousehold(household.householdId)">Join Household</button>
      </div>
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