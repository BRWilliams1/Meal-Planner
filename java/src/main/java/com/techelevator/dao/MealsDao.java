package com.techelevator.dao;

import com.techelevator.model.Meals;

import java.util.List;

public interface MealsDao {

    public List<Meals> getAllMeals();
    public Meals getMealById(int id);
    public void deleteMeal(int id);
    public void addMeal(Meals meal);
    public void editMeal(Meals meal);


}
