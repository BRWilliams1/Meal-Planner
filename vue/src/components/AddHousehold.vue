<template>
  <div>
    <form v-on:submit.prevent="addHousehold">
            <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Household ID</label>
  <input type="text" class="form-control" id="exampleFormControlInput1"   v-model="household.householdId"> 
</div> 
 
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Household Name</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="household.name"></textarea>
</div>
        <button>Save</button>
    </form>

  </div>
</template>

<script>
import HouseholdsService from '../services/HouseholdsService.js';

export default {
    data(){
        return{
            household: {}
        }
    },
    methods: {
        addHousehold(){
            HouseholdsService.addHousehold(this.household).then((response) => {
                if(response.status == 200) {
                        window.alert("Household Added!");
                        this.household = {};
                        this.$router.push({name: "home"});
                }
            })
            .catch((error) => {
                if (error.response){
                    window.alert("Bad Request");
                }
                else if (error.request){
                    window.alert("error");
                }
            })
        }
    }
}
</script>

<style>

</style>