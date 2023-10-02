<template>
    <div class="household">
      <div >
      <h1>Household Members</h1>

      <div v-for="member in members" v-bind:key="member.id">
        <!-- <p>{{ member.id }}</p> -->
        <p>{{ member.username }}</p>
        <!-- <p>{{ member.householdId }}</p> -->
        <p>{{ member.householdOwner }}</p>
      </div>
      </div>

     
    </div>
  </template>
  
  <script>
  import HouseholdService from '../services/HouseholdService';

  export default {
    name: "home",
    data(){
      return{
        members: []
      }
    },
    created(){
      HouseholdService.getHouseholdMembers().then((response) => {
        console.log(response.data);
        this.members = response.data;
      });
    },
  };
  </script>

  <style>
  .household {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  </style>