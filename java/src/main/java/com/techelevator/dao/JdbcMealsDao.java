package com.techelevator.dao;

import com.techelevator.model.Meals;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMealsDao implements MealsDao {

    private JdbcTemplate template;
    public JdbcMealsDao(DataSource dataSource){
        template = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Meals> getAllMeals() {
        String sql = "SELECT * FROM meals_list";
        SqlRowSet results = template.queryForRowSet(sql);
        List<Meals> listOfMeals = new ArrayList<>();
        while(results.next()){
            Meals meals = new Meals();
            meals.setMealsId(results.getInt("meals_id"));
            meals.setMeals(results.getString("meals"));
            meals.setIngredients(results.getString("ingredients"));
            listOfMeals.add(meals);
        }
        return listOfMeals;
    };

    @Override
    public Meals getMealById(int id) {
        String sql = "SELECT * FROM meals_list WHERE meals_id = ?";
        SqlRowSet result = template.queryForRowSet(sql, id);
        Meals meal = new Meals();
        if (result.next()){
            meal.setMealsId(result.getInt("meals_id"));
            meal.setMeals(result.getString("meals"));
            meal.setIngredients(result.getString("ingredients"));
        }
        return meal;
    }

    @Override
    public void deleteMeal(int id) {
        String sql = "DELETE FROM meals_list WHERE meals_id = ?";
        template.update(sql, id);
    }

    @Override
    public void addMeal(Meals meal) {
        String sql = "INSERT INTO meals_list (meals, ingredients) VALUES(?,?);";
        template.update(sql, meal.getMeals(), meal.getIngredients());
    }

    @Override
    public void editMeal(Meals meal) {
        String sql = "UPDATE meals_list SET meals = ?, ingredients = ? WHERE meals_id = ?";
        template.update(sql, meal.getMeals(), meal.getIngredients(), meal.getMealsId());
    }

}
