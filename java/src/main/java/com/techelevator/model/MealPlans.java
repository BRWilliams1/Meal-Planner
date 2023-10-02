package com.techelevator.model;

import java.time.LocalDate;

public class MealPlans {

    private int mealPlanId;
    private int householdId;
    private String plannerDate;
    private int mealId;
    private String mealName;


    public int getMealPlanId() {
        return mealPlanId;
    }

    public void setMealPlanId(int mealPlanId) {
        this.mealPlanId = mealPlanId;
    }

    public int getHouseholdId() {
        return householdId;
    }

    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
    }

    public String getPlannerDate() {
        return plannerDate;
    }

    public void setPlannerDate(String plannerDate) {
        this.plannerDate = plannerDate;
    }

    public int getMealId() {
        return mealId;
    }

    public void setMealId(int mealId) {
        this.mealId = mealId;
    }

    public String getMealName() {
        return mealName;
    }

    public void setMealName(String mealName) {
        this.mealName = mealName;
    }



}
