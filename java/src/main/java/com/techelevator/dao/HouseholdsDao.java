package com.techelevator.dao;

import com.techelevator.model.Households;
import com.techelevator.model.Meals;

import java.util.List;

public interface HouseholdsDao {

    public List<Households> getAllNames();
    public Households getHouseholdById(int id);
    public void deleteHousehold(int id);

    public void addHousehold(Households households);
    public void editHousehold(Households households);
}
