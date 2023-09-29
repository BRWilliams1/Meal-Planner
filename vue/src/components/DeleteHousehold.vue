<template>
    <div>
      <form v-on:submit.prevent="deleteHousehold(household.householdId)">
              <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Household ID</label>
  <input type="text" class="form-control" id="exampleFormControlInput1"   v-model="household.householdId"> 
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Household Name</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="household.householdName"></textarea>
</div>
          <button>Delete</button>
      </form>
    </div>
  </template>

  <script>
  import HouseholdService from '../services/HouseholdsService';

  export default {
      data(){
          return{
            householdId: -1,
            household: {}
          }
      },
      methods: {
            deleteHousehold(id){
                HouseholdService.deleteHousehold(id).then(response => {
                    if(response.status === 200){
                        window.alert("Household deleted!");
                        this.$router.push({name: "listOfHousehold"});
                    }
                })
            }
      },
      created() {
        this.householdId = this.$route.params.id;
        HouseholdService.getHouseholdById(this.householdId).then(
            (response) => {
                this.household = response.data;
            }
        );
    },
  }
  </script>

  <style>

  </style>