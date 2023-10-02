package com.techelevator.controller;
import com.techelevator.dao.MealPlansDao;
import com.techelevator.model.MealPlans;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class MealPlansController {
    @Autowired
    private MealPlansDao mealPlansDao;

    @RequestMapping(path = "/mealPlans", method = RequestMethod.GET)
    public List<MealPlans> getAllMealPlans(){
        return mealPlansDao.getAllMealPlans();
    }

    @RequestMapping(path = "/mealplan/{id}", method = RequestMethod.GET)
    public MealPlans getMealPlanById(@PathVariable int id){
        MealPlans mealplan = mealPlansDao.getMealPlansById(id);
        return mealplan;
    }

    @RequestMapping(path = "/addMealPlan", method = RequestMethod.POST)
    public void addMealPlan(@Valid @RequestBody MealPlans mealplans){
        mealPlansDao.addMealPlans(mealplans);
    }

    @RequestMapping(path = "/editMealPlan", method = RequestMethod.PUT) // how it works without id
    public void editMealPlan(@Valid @RequestBody MealPlans mealPlans){
        mealPlansDao.editMealPlans(mealPlans);
    }

    @RequestMapping(path = "/mealplan/{id}", method = RequestMethod.DELETE)
    public void deleteHousehold(@PathVariable int id){
        mealPlansDao.deleteMeal(id);
    }
}
