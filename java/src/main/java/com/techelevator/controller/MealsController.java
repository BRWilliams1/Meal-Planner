package com.techelevator.controller;

import com.techelevator.dao.MealsDao;
import com.techelevator.model.Meals;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class MealsController {
    @Autowired private MealsDao mealsDao;
    @RequestMapping(path = "/meals", method = RequestMethod.GET)
    public List<Meals> getAllMeals(){
        return mealsDao.getAllMeals();
    }

    @RequestMapping(path = "/meals/{id}", method = RequestMethod.GET)
    public Meals getMealById(@PathVariable int id){
        Meals meal = mealsDao.getMealById(id);
        return meal;
    }

}
