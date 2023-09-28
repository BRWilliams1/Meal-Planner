package com.techelevator.controller;

import com.techelevator.dao.HouseholdsDao;
import com.techelevator.dao.MealsDao;
import com.techelevator.model.Households;
import com.techelevator.model.Meals;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class HouseholdsController {
    @Autowired
    private HouseholdsDao householdsDao;

    @RequestMapping(path = "/households", method = RequestMethod.GET)
    public List<Households> getAllHouseholdNames(){
        return householdsDao.getAllNames();
    }

    @RequestMapping(path = "/households/{id}", method = RequestMethod.GET)
    public Households getHouseholdById(@PathVariable int id){
        Households household = householdsDao.getHouseholdById(id);
        return household;
    }

    @RequestMapping(path = "/addHousehold", method = RequestMethod.POST)
    public void addHousehold(@Valid @RequestBody Households household){
        householdsDao.addHousehold(household);
    }

    @RequestMapping(path = "/editHousehold", method = RequestMethod.PUT) // how it works without id
    public void editHousehold(@Valid @RequestBody Households household){
        householdsDao.editHousehold(household);
    }

    @RequestMapping(path = "/households/{id}", method = RequestMethod.DELETE)
    public void deleteHousehold(@PathVariable int id){
        householdsDao.deleteHousehold(id);
    }
}
