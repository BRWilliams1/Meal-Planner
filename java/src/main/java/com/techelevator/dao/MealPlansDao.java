package com.techelevator.dao;

import com.techelevator.model.MealPlans;
import com.techelevator.model.Meals;

import java.util.List;

public interface MealPlansDao {

    public List<MealPlans> getAllMealPlans();
    public MealPlans getMealPlansById(int id);

    public void deleteMeal(int id);
    public void addMealPlans(MealPlans meal);
    public void editMealPlans(MealPlans meal);




}
