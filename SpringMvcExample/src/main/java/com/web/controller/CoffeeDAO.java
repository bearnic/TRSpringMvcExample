package com.web.controller;

import java.util.ArrayList;

public interface CoffeeDAO
{
	public void insertCoffee(Coffee coffee);
	public ArrayList<Coffee> getAllCoffee();
	public Coffee getCoffeeByID(int Coffee_ID);
	public ArrayList<Coffee> getCoffeeByName(String Name);
	public ArrayList<Coffee> getCoffeeByQuanlity(int Quanlity);
	public ArrayList<Coffee> getCoffeeByNameAndQuanlity(String Name, int Quanlity);
	public void updateCoffee(int Coffee_ID, Coffee coffee);
	public void deleteCoffeeByID(int Coffee_ID);
	public void deleteCoffeeByNameAndQuanlity(String Name, int Quanlity);
	public void addCoffeeQuanlity(Coffee coffee);
	public void subtractCoffeeQuanlity(Coffee coffee);
}