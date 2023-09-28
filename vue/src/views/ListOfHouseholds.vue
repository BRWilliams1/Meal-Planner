<template>
  <div class="home">
    <h1>List Of Households</h1>
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Household ID</th>
      <th scope="col">Household Name </th>
        </tr>
  </thead>
  <tbody>
    <tr v-for="household in households" v-bind:key="household.householdId">
      <td>{{ household.householdId }}</td>
      <td>{{ household.householdName }}</td>
        <button> 
         <router-link
      v-bind:to="{name: 'editHousehold', params:{id : household.householdId} }" 
   
    > Edit Household </router-link>
    </button>
        <button>
         <router-link
      v-bind:to="{name: 'deleteHousehold', params:{id : household.householdId}  }" 
   
    > Delete Household </router-link>
         </button> 

    </tr>
  </tbody>
</table>
 <button>
 <router-link
      v-bind:to="{name: 'addHousehold' }"
   
   > Add Household </router-link> 
</button> 
  </div>
  
</template>


<script>
import HouseholdsService from '../services/HouseholdsService';

export default {
  name: "home",
  data(){
    return {
      households: []
    }
  },
  created(){
    HouseholdsService.getAllHouseholdNames().then((resp) => {
        this.households = resp.data;
      }
    );
  }
};
</script>

<style scoped>

</style>
