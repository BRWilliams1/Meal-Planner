package com.techelevator.dao;

import com.techelevator.model.Households;
import com.techelevator.model.Meals;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcHouseholdsDao implements HouseholdsDao{
    private JdbcTemplate template;
    public JdbcHouseholdsDao(DataSource dataSource){
        template = new JdbcTemplate(dataSource);
    }
    @Override
    public List<Households> getAllNames() {
        String sql = "SELECT * FROM households";
        SqlRowSet results = template.queryForRowSet(sql);
        List<Households> listOfNames = new ArrayList<>();
        while(results.next()){
            Households households = new Households();
            households.setHouseholdId(results.getInt("household_id"));
            households.setHouseholdName(results.getString("household_name"));

            listOfNames.add(households);
        }
        return listOfNames;
    }
    @Override
    public Households getHouseholdById(int id) {
        String sql = "SELECT * FROM households WHERE household_id = ?";
        SqlRowSet result = template.queryForRowSet(sql, id);
        Households household = new Households();
        if (result.next()){
            household.setHouseholdId(result.getInt("household_id"));
            household.setHouseholdName(result.getString("household_name"));

        }
        return household;
    }
    @Override
    public void deleteHousehold(int id) {
        String sql = "DELETE FROM households_meals WHERE household_id = ?";
        template.update(sql, id);
        sql = "DELETE FROM user_households WHERE household_id = ?";
        template.update(sql, id);
        sql = "DELETE FROM households WHERE household_id = ?";
        template.update(sql, id);

    }
    @Override
    public void addHousehold(Households households) {
        String sql = "INSERT INTO households (household_name) VALUES(?);";
        template.update(sql, households.getHouseholdName());
    }
    @Override
    public void editHousehold(Households households){
        String sql = "UPDATE households SET household_name = ? WHERE household_id = ?";
        template.update(sql,households.getHouseholdName(), households.getHouseholdId() );
    }
}
