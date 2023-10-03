<template>
    <div class="myHoushold">
      <div v-if="household.householdId != 0">
        <h1>{{ household.householdName }}</h1> 
        <form v-on:submit.prevent="editHousehold">
        <label>Household</label>
        <input v-model="household.householdName" />

        <button>Save</button>
    </form>
        <!-- <p>{{ household.householdId }}</p>
        <p>{{ household }}</p> -->
        <button v-on:click="leaveHousehold">Leave Household</button>
        <button v-on:click="deleteHousehold">Delete Household</button>
        <household-members/>
      </div>
      <div v-else>
        <h1>Create Household</h1>
        <add-household/>
        <!-- <p>{{ household.householdId }}</p> -->
        <router-link v-bind:to="{name: 'browseHouseholds'}"> Browse Household </router-link>

      </div>
    </div>
  </template>
  
  <script>
  import AddHousehold from '../components/AddHousehold.vue';
  import HouseholdMembers from '../components/HouseholdMembers.vue';
  import HouseholdService from '../services/HouseholdService';
  
  
  export default {
    components: {
      HouseholdMembers,
      AddHousehold
    },
    data(){
      return{
        household: {}
      }
    },
    created(){
      
      HouseholdService.getUsersHouseholdId().then((response) => {
        console.log(response.data);
        this.household = response.data;
      });
    },
    methods: {
      leaveHousehold(){
          if (confirm("Are you sure you want to leave this household?")){
            HouseholdService.resetUsersHousehold().then((response) => {
                if(response.status == 200) {
                        window.alert("Left Household");
                        window.location.reload();
                }
            }).catch((error) => {
                if (error.response){
                    window.alert("Bad Request");
                }
                else if (error.request){
                    window.alert("error");
                }
            })
          }
        },
        deleteHousehold(){
          if(confirm("Are you sure you want to delete this household?")){
            HouseholdService.resetMembersHousehold(this.household).then((response) => {
              console.log(this.household);
              HouseholdService.deleteHousehold(this.household.householdId);
                  if(response.status == 200) {
                          window.alert("Household Deleted");
                          window.location.reload();
                  }
              }).catch((error) => {
                  if (error.response){
                      window.alert("Bad Request");
                  }
                  else if (error.request){
                      window.alert("error");
                  }
              })
          }
        },
editHousehold(){
            HouseholdService.editHousehold(this.household).then((response) => {
                if(response.status == 200) {
                        window.alert("Household updated!");
                }
            })
          }




    }
  };
  
  </script>
  
  <style>
  .myHoushold {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  </style>