<template>
  <div>
    <form v-on:submit.prevent="runTwoMethods">
      <div>
        <label>Household Name</label>
        <!-- <p>{{ this.household }}</p> -->
        <textarea v-model="household.householdName"></textarea>
      </div>
      <button>Save</button>
    </form>
  </div>
</template>

  <script>
import HouseholdService from "../services/HouseholdService.js";

export default {
  data() {
    return {
      household:{}
    };
  },
  methods: {
    // addHousehold() {
    //   HouseholdService.addHousehold(this.household)
    //     .then((response) => {
    //       if (response.status == 200) {
    //         const generatedHouseholdId = response.data;
    //         this.household.householdId = generatedHouseholdId;
    //         window.alert("Household Added!");
    //         console.log(this.household);
    //       }
    //     })
    //     .catch((error) => {
    //       if (error.response) {
    //         window.alert("Bad Request");
    //       } else if (error.request) {
    //         window.alert("error");
    //       }
    //     });
    // },
    async addHousehold() {
        try {
        const response = await HouseholdService.addHousehold(this.household);
        if (response.status === 200) {
            const generatedHouseholdId = response.data;
            this.household.householdId = generatedHouseholdId;
            console.log(this.household);
        }
        } catch (error) {
        if (error.response) {
            window.alert("Bad Request");
        } else if (error.request) {
            window.alert("Error");
        }
        }
    },
    linkOwner() {
      HouseholdService.linkHouseholdOwner(this.household)
        .then((response) => {
          if (response.status == 200) {
            window.alert("Household Added!");
          }
        })
        .catch((error) => {
          if (error.response) {
            window.alert("Bad Request");
          } else if (error.request) {
            window.alert("error");
          }
        });
    },
    runTwoMethods() {
      this.addHousehold().then(() => this.linkOwner())
      this.$router.push({name: "myHousehold"});
      window.location.reload();
    },
  },
};
</script>

  <style>
</style>