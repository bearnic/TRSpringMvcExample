package com.web.controller;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
 
@XmlRootElement(name = "coffeeBag")
public class CoffeeBag 
{
	
	ArrayList<Coffee> CoffeeBag;
	
	public CoffeeBag(ArrayList<Coffee> CoffeeBag)
	{
		this.CoffeeBag = CoffeeBag;
	}
 
	public CoffeeBag()
	{
	}
	
	@XmlElement
	public void setCoffee(ArrayList<Coffee> CoffeeBag)
	{
		this.CoffeeBag = CoffeeBag;
	}
	
	public ArrayList<Coffee> getCoffee()
	{
		return CoffeeBag;
	}
}