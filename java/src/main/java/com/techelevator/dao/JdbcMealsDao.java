package com.techelevator.dao;

import com.techelevator.model.Meals;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

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
            meals.setListOfItems(results.getString("list_of_items"));
            meals.setListOfIngredients(results.getString("list_of_ingredients"));
            listOfMeals.add(meals);
        }
        return listOfMeals;
    }

    @Override
    public Meals getMealById(int id) {
        String sql = "SELECT * FROM meals_list WHERE meals_id = ?";
        SqlRowSet result = template.queryForRowSet(sql, id);
        Meals meal = new Meals();
        if (result.next()){
            meal.setMealsId(result.getInt("meals_id"));
            meal.setListOfItems(result.getString("list_of_items"));
            meal.setListOfIngredients(result.getString("list_of_ingredients"));
        }
        return meal;
    }

}
