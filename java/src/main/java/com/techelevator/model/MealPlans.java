package com.techelevator.model;

import java.time.LocalDate;

public class MealPlans {

    private String date;

    private String mealsName;

    private int mealsPlansId;

    private int householdId;

    public int getHouseholdId() {
        return householdId;
    }

    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setMealsPlansId(int mealsPlansId) {
        this.mealsPlansId = mealsPlansId;
    }


    public int getMealsPlansId() {
        return mealsPlansId;
    }

    public String getMealsName() {
        return mealsName;
    }

    public void setMealsName(String mealsName) {
        this.mealsName = mealsName;
    }

    public String getDate() {
        return date;
    }











}
