package com.techelevator.dao;

import com.techelevator.model.MealPlans;
import com.techelevator.model.Meals;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

public class JdbcMealPlansDao implements MealPlansDao {
    private JdbcTemplate template;
    public JdbcMealPlansDao(DataSource dataSource){
        template = new JdbcTemplate(dataSource);
    }

    @Override
    public List<MealPlans> getAllMealsPlans() {
        String sql = "SELECT meal_plan_id, planner_date, meals_list.meals, household_id " +
                "FROM meal_plan JOIN meals_list ON meals_plan.meals_id = meals_list.meals_id";
        SqlRowSet results = template.queryForRowSet(sql);
        List<MealPlans> listOfMealPlans = new ArrayList<>();
        while(results.next()){
            MealPlans mealPlans = new MealPlans();
            mealPlans.setMealsPlansId(results.getInt("meal_plan_id"));
            mealPlans.setDate(results.getString("planner_date"));
            mealPlans.setMealsName(results.getString("meals"));
            mealPlans.setHouseholdId(results.getInt("household_id"));
            listOfMealPlans.add(mealPlans);
        }
        return listOfMealPlans;
    }

    @Override
    public MealPlans getMealPlansById(int id) {
        String sql = "SELECT meal_plan_id, planner_date, meals_list.meals, household_id " +
                "FROM meal_plan JOIN meals_list ON meals_plan.meals_id = meals_list.meals_id" +
                " WHERE meal_plan_id = ?";
        SqlRowSet results = template.queryForRowSet(sql, id);
        MealPlans mealPlans = new MealPlans();
        if(results.next()){
            mealPlans.setMealsPlansId(results.getInt("meal_plan_id"));
            mealPlans.setDate(results.getString("planner_date"));
            mealPlans.setMealsName(results.getString("meals"));
            mealPlans.setHouseholdId(results.getInt("household_id"));
        }
        return mealPlans;
    }

    @Override
    public void addMealPlans(MealPlans meal) {
        String sql = "INSERT INTO meal_plan_list (meal_plan_id, date, meals_id) VALUES (?,?,?) ;" +
                "JOIN meal_list ON meal_list.meals_id = meal_plan_list.meals_id" +
                "JOIN households_meals ON households_meals.meal_plan_id = meal_plan_list.meal_plan_id";
//        template.update(sql, meal.getDate(), meal.
        

    }

    @Override
    public void editMealPlans(MealPlans meal) {
        String sql = "UPDATE meal_plan SET planner_date = ?, meals_name = ?";
        template.update(sql,meal.getDate(),meal.getMealsName());

    }
}
