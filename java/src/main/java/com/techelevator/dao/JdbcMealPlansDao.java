package com.techelevator.dao;

import com.techelevator.model.MealPlans;
import com.techelevator.model.Meals;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcMealPlansDao implements MealPlansDao {
    private JdbcTemplate template;
    public JdbcMealPlansDao(DataSource dataSource){
        template = new JdbcTemplate(dataSource);
    }

    @Override
    public List<MealPlans> getAllMealPlans() { //made some changes in the meal_plan database


//        String sql = "SELECT meal_plan.meal_plan_id, household_id, meal_plan_data.planner_date, " +
//                "meal_plan_data.meal_id, meals.meal_name FROM meal_plan " +
//                "JOIN meal_plan_data ON meal_plan.meal_plan_id = meal_plan_data.meal_plan_id " +
//                "JOIN meals ON meal_plan_data.meal_id = meals.meal_id;";
//        SqlRowSet results = template.queryForRowSet(sql);
//        List<MealPlans> listOfMealPlans = new ArrayList<>();
//        while(results.next()){
//            MealPlans mealPlan = new MealPlans();
//            mealPlan.setMealPlanId(results.getInt("meal_plan_id"));
//            mealPlan.setHouseholdId(results.getInt("household_id"));
//            mealPlan.setPlannerDate(results.getString("planner_date"));
//            mealPlan.setMealId(results.getInt("meal_id"));
//            mealPlan.setMealName(results.getString("meal_name"));
//            listOfMealPlans.add(mealPlan);
//        }
//        return listOfMealPlans;

        String sql = "SELECT * FROM meal_plan;";
        SqlRowSet results = template.queryForRowSet(sql);
        List <MealPlans> listOfMealPlans = new ArrayList<>();
        while(results.next()){
            MealPlans mealplan = new MealPlans();
            mealplan.setMealName(results.getString("meal_name"));
            mealplan.setMealDetails(results.getString("meal_plan_details"));
            mealplan.setPlannerDate(results.getString("planner_date"));
            mealplan.setHouseholdId(results.getInt("household_id"));
            mealplan.setMealPlanId(results.getInt("meal_plan_id"));
            listOfMealPlans.add(mealplan);
        }
        return listOfMealPlans;
    }

    @Override
    public MealPlans getMealPlansById(int id) {
//        String sql = "SELECT meal_plan_id, planner_date, meals_list.meals, household_id " +
//                "FROM meal_plan JOIN meals_list ON meals_plan.meals_id = meals_list.meals_id" +
//                " WHERE meal_plan_id = ?";

//        String sql = "SELECT * FROM meal_plan WHERE meal_plan_id = ?";
//        SqlRowSet results = template.queryForRowSet(sql, id);
//        MealPlans mealPlans = new MealPlans();
//        if(results.next()){
//            mealPlans.setMealPlanId(results.getInt("meal_plan_id"));
//            mealPlans.setPlannerDate(results.getString("planner_date"));
//            mealPlans.setMealName(results.getString("meals_name"));
//            mealPlans.setHouseholdId(results.getInt("household_id"));
//        }
//        return mealPlans;
        String sql = "select * from meal_plan WHERE meal_plan_id = ?;";
        SqlRowSet results = template.queryForRowSet(sql, id);
        MealPlans mealplan = new MealPlans();
        if (results.next()){
            mealplan.setMealName(results.getString("meal_name"));
            mealplan.setMealDetails(results.getString("meal_plan_details"));
            mealplan.setPlannerDate(results.getString("planner_date"));
            mealplan.setHouseholdId(results.getInt("household_id"));
            mealplan.setMealPlanId(results.getInt("meal_plan_id"));

        }
        return mealplan;
    }

    @Override
    public void deleteMeal(int id) {
//        String sql = "DELETE FROM households_meals WHERE household_id = ?";
//        template.update(sql, id);
//        sql = "DELETE FROM households WHERE household_id = ?";
//        template.update(sql, id);
//        sql = "DELETE FROM meal_plan WHERE household_id = ?";
//        template.update(sql, id);

         String sql1 = "DELETE from households WHERE household_id = ? JOIN meal_plan ON meal_plan.household_id = households.household_id ;";
         String sql = "Delete from meal_plan WHERE meal_plan_id = ?;";
        template.update(sql, id);

    }

    @Override
    public void addMealPlans(MealPlans meal) {
//        String sql = "INSERT INTO meal_plan_list (meal_plan_id, date, meals_id) VALUES (?,?,?) ;" +
//                "JOIN meal_list ON meal_list.meals_id = meal_plan_list.meals_id" +
//                "JOIN households_meals ON households_meals.meal_plan_id = meal_plan_list.meal_plan_id";
////        template.update(sql, meal.getDate(), meal.
      //  String sql = "INSERT INTO meal_plan (planner_date, meals_name, household_id) VALUES(?,?,?);";
//        String sql1 = "INSERT INTO meal_plan (household_id) VALUES (?);";
//        String sql2 = "INSERT INTO meal_plan_data (planner_date, meal_id) VALUES (?,?);";
//        String sql3 = "INSERT INTO meals (meal_name, description, ingredients, instructions);";
//        template.update(sql1, meal.getHouseholdId());
//        template.update(sql2, meal.getPlannerDate(), meal.getMealId());
//        template.update(sql3, meal.getMealName(), meals.getDescription(),meals.getIngredients(), meals.getInstructions());

        String sql = "INSERT INTO meal_plan (household_id, meal_name, planner_date, meal_plan_details) VALUES(?,?,?,?);";
        template.update(sql, meal.getHouseholdId(), meal.getMealName(), meal.getPlannerDate(), meal.getMealDetails());
    }

    @Override
    public void editMealPlans(MealPlans meal) {
        String sql = "UPDATE meal_plan SET planner_date = ?, meal_name = ?, planner_date = ?, meal_plan_details = ? WHERE meal_plan_id = ?";
        template.update(sql, meal.getHouseholdId(),meal.getMealName(), meal.getPlannerDate(), meal.getMealDetails(), meal.getMealPlanId());

    }
}
