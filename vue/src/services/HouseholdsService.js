import axios from 'axios';

export default {

    getAllHouseholdNames(){
        return axios.get("/households");
    },

    getHouseholdById(id){
        return axios.get("/households/" + id);
    },

    addHousehold(household){
        return axios.post("/addHousehold", household);
    },

    editHousehold(household){
        return axios.put("/editHousehold", household);
    },

    deleteHousehold(id){
        return axios.delete("/households/" + id);
    }

}