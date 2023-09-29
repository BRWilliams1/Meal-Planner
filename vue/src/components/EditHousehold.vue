<template>
    <div>
      <form v-on:submit.prevent="editHousehold">
        <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Household ID</label>
  <p  class="form-control" id="exampleFormControlInput1">  </p>
</div>
              <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Household Name</label>
  <input type="text" class="form-control" id="exampleFormControlInput1"   v-model="household.householdName"> 
</div>
          <button>Save</button>
      </form>
    </div>
  </template>

  <script>
  import HouseholdsService from '../services/HouseholdsService';

  export default {
      data(){
          return{
            householdId: -1,
            household: {}
          }
      },
      methods: {
          editHousehold(){
              HouseholdsService.editHousehold(this.household).then((response) => {
                  if(response.status == 200) {
                          window.alert("Household updated!");
                          this.$router.push({name: "listOfHousehold"});
                  }
              })
          }
      },
      created() {
        this.householdId = this.$route.params.id;
        HouseholdsService.getHouseholdById(this.householdId).then(
            (response) => {
                this.household = response.data;
            }
        );
    },
  }
  </script>

  <style>

  </style>