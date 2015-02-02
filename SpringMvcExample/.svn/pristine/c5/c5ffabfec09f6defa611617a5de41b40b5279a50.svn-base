package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.web.controller.Coffee;
import com.web.controller.CoffeeBag;
import com.web.controller.CoffeeDAO;

@Controller
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getdata() {

		List<String> list = getList();

		ModelAndView model = new ModelAndView("index");
		model.addObject("lists", list);

		return model;

	}

	private List<String> getList() {

		List<String> list = new ArrayList<String>();
		list.add("List A");
		list.add("List B");
		list.add("List C");
		list.add("List D");
		list.add("List 1");
		list.add("List 2");
		list.add("List 3");

		return list;

	}
	
	@RequestMapping(value = "hello", method = RequestMethod.GET)
	public ModelAndView getHello() 
	{
		ModelAndView mv = new ModelAndView("hello");
		return mv;
	}
	
	@RequestMapping(value = "helloCSSJquery", method = RequestMethod.GET)
	public ModelAndView getHelloCSSJquery() 
	{
		ModelAndView mv = new ModelAndView("helloCSSJquery");
		return mv;
	}
	
	@RequestMapping(value = "CoffeeAjax", method = RequestMethod.GET)
	public ModelAndView getCoffeeAjax() 
	{
		ModelAndView mv = new ModelAndView("CoffeeAjax");
		return mv;
	}
	
	@RequestMapping(value="cof/{name}", method = RequestMethod.GET)
	public @ResponseBody Coffee getCoffeeInXML(
			@PathVariable String name)
	{
		Coffee coffee = new Coffee(name, 100);
		return coffee;
	}
	
	//The below mapping will display the coffee value based on the query string passed in the path. It will also display value based on the query string
	@RequestMapping(value="coftwo", method = RequestMethod.GET)
	public @ResponseBody Coffee getCoffeeInXMLtwo(
			@RequestParam(value="name", defaultValue="World") String name,
			@RequestParam(value="amount", defaultValue="777") int amount
			)
	{
		Coffee coffee = new Coffee(name, amount);	
		return coffee;
	}
		
	//The following mapping will display a list of coffees, but the list is in json.
	@RequestMapping(value="cofthree", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Coffee> getCoffeeList(){
		ArrayList<Coffee> list = getBag();
		return  list;
	}
	
	private ArrayList<Coffee> getBag()
	{
		ArrayList<Coffee> CoffeeBagTest = new ArrayList<Coffee>();
		
		Coffee coffee1 = new Coffee("CostaRica",1);
		Coffee coffee2 = new Coffee("Columbia",2);
		Coffee coffee3 = new Coffee("Venuzeula",3);
		
		CoffeeBagTest.add(coffee1);
		CoffeeBagTest.add(coffee2);
		CoffeeBagTest.add(coffee3);
		
		return CoffeeBagTest;
	}
	
	//This next mapping will display the above list as an xml
	
	@RequestMapping(value="coffour", method = RequestMethod.GET)
	public @ResponseBody CoffeeBag getCoffeeInXMLfour()
	{
		ArrayList<Coffee> CoffeeBagTest = getBag();
		CoffeeBag coffeeBag = new CoffeeBag(CoffeeBagTest);
		return coffeeBag;
	}
	
	
	//This @request mapping will let the user pass a query string to set the values of the list
	@RequestMapping(value="coffive", method = RequestMethod.GET)
	public @ResponseBody CoffeeBag getCoffeeInXMLfive(
			@RequestParam(value="name1", defaultValue="Costa") String name1,
			@RequestParam(value="amount1", defaultValue="1") int amount1,
			@RequestParam(value="name2", defaultValue="Columbia") String name2,
			@RequestParam(value="amount2", defaultValue="2") int amount2,
			@RequestParam(value="name3", defaultValue="Venuzeula") String name3,
			@RequestParam(value="amount3", defaultValue="3") int amount3
			)
	{
		ArrayList<Coffee> CoffeeBagTesting = new ArrayList<Coffee>();
		
		Coffee coffee11 = new Coffee(name1,amount1);
		Coffee coffee22 = new Coffee(name2,amount2);
		Coffee coffee33 = new Coffee(name3,amount3);
		
		CoffeeBagTesting.add(coffee11);
		CoffeeBagTesting.add(coffee22);
		CoffeeBagTesting.add(coffee33);
		
		CoffeeBag coffeeBag = new CoffeeBag(CoffeeBagTesting);
		
		return coffeeBag;
	}
	
	//The following method returns all of the coffees in the database
	@RequestMapping(value="cofsix", method = RequestMethod.GET)
	public @ResponseBody CoffeeBag getCoffeeInXMLsix()
	{
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("Spring-Module.xml");
		
		CoffeeDAO coffeeDAO = (CoffeeDAO) context.getBean("CoffeeDAO");
		ArrayList<Coffee> CoffeeBagTest = new ArrayList<Coffee>();
		CoffeeBagTest = coffeeDAO.getAllCoffee();
		CoffeeBag coffeeBag = new CoffeeBag(CoffeeBagTest);
		
		return coffeeBag;
	}
	
	//The following method just returns the coffee based on the name and quanlity values
	@RequestMapping(value="cofseven", method = RequestMethod.GET)
	public @ResponseBody CoffeeBag getCoffeeInXMLseven(
			@RequestParam(value="Name", defaultValue="test") String Name,
			@RequestParam(value="Quanlity", defaultValue="1") int Quanlity)
	{
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("Spring-Module.xml");
		
		CoffeeDAO coffeeDAO = (CoffeeDAO) context.getBean("CoffeeDAO");
		ArrayList<Coffee> CoffeeBagTest = new ArrayList<Coffee>();
		CoffeeBagTest = coffeeDAO.getCoffeeByNameAndQuanlity(Name,Quanlity);
		CoffeeBag coffeeBag = new CoffeeBag(CoffeeBagTest);
		
		return coffeeBag;
	}
	
	//The below method searches for the following coffee in the database and adds it if it doesn't exist.
	@RequestMapping(value="cofeight", method = RequestMethod.GET)
	public @ResponseBody CoffeeBag getCoffeeInXMLeight(
			@RequestParam(value="Name", defaultValue="test") String Name,
			@RequestParam(value="Quanlity", defaultValue="1") int Quanlity)
	{
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("Spring-Module.xml");
		
		CoffeeDAO coffeeDAO = (CoffeeDAO) context.getBean("CoffeeDAO");
		ArrayList<Coffee> CoffeeBagTest = new ArrayList<Coffee>();
		CoffeeBagTest = coffeeDAO.getCoffeeByNameAndQuanlity(Name,Quanlity);
		CoffeeBag coffeeBag;
		
		if(CoffeeBagTest.isEmpty())
		{
			Coffee coffee = new Coffee(Name,Quanlity);
			coffeeDAO.insertCoffee(coffee);
			CoffeeBagTest.add(coffee);
			coffeeBag = new CoffeeBag(CoffeeBagTest);
		}
		else
		{
			coffeeBag = new CoffeeBag(CoffeeBagTest);
		}
		
		return coffeeBag;
	}
	//The below method implements the delete from the database
	@RequestMapping(value="cofnine", method = RequestMethod.GET)
	public @ResponseBody void getDeleteCoffee(
			@RequestParam(value="Name") String Name,
			@RequestParam(value="Quanlity") int Quanlity)
	{
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("Spring-Module.xml");
		
		CoffeeDAO coffeeDAO = (CoffeeDAO) context.getBean("CoffeeDAO");
		coffeeDAO.deleteCoffeeByNameAndQuanlity(Name,Quanlity);
	}
	
	//The below method will add quanlity to an existing coffee or add it to the database if it doesn't exist
	@RequestMapping(value="cofadd", method = RequestMethod.GET)
	public @ResponseBody CoffeeBag getCoffeeInXMLadd(
			@RequestParam(value="Name") String Name,
			@RequestParam(value="Quanlity") int Quanlity) 
	{
 
		ApplicationContext context = 
	    		new ClassPathXmlApplicationContext("Spring-Module.xml");
		
		CoffeeDAO coffeeDAO = (CoffeeDAO) context.getBean("CoffeeDAO");
		ArrayList<Coffee> CoffeeBagTest = new ArrayList<Coffee>();
		CoffeeBagTest = coffeeDAO.getCoffeeByName(Name);
		CoffeeBag coffeeBag;
		Coffee coffee = new Coffee(Name,Quanlity);
		if(CoffeeBagTest.isEmpty())
		{
			coffeeDAO.insertCoffee(coffee);
			CoffeeBagTest.add(coffee);
			coffeeBag = new CoffeeBag(CoffeeBagTest);
		}
		else
		{
			coffeeDAO.addCoffeeQuanlity(coffee);
			CoffeeBagTest.add(coffee);
			coffeeBag = new CoffeeBag(CoffeeBagTest);
		}
		return coffeeBag;
	}
	
	// the below method will subtract from the specified coffee.
	@RequestMapping(value="cofsubtract", method = RequestMethod.GET)
	public @ResponseBody CoffeeBag getCoffeeInXMLsubtract(
			@RequestParam(value="Name") String Name,
			@RequestParam(value="Quanlity") int Quanlity)
	{
		ApplicationContext context = 
	    		new ClassPathXmlApplicationContext("Spring-Module.xml");
		
		CoffeeDAO coffeeDAO = (CoffeeDAO) context.getBean("CoffeeDAO");
		
		Coffee coffee = new Coffee(Name,Quanlity);
		coffeeDAO.subtractCoffeeQuanlity(coffee);
		ArrayList<Coffee> CoffeeBagTest = new ArrayList<Coffee>();
		CoffeeBagTest.add(coffee);
		CoffeeBag coffeeBag = new CoffeeBag(CoffeeBagTest);
		return coffeeBag;
	}
	
	//The below method is a post to the server
	@RequestMapping(value="cofPost", method=RequestMethod.POST, headers="Accept=application/xml")
	public @ResponseBody CoffeeBag postCoffee(
			@RequestBody CoffeeBag coffeeBagPost) 
	{
		CoffeeBag coffeeBag = coffeeBagPost;
		ArrayList<Coffee> coffeeBagList = coffeeBag.getCoffee();
		Coffee coffee;
		for(int i = 0; i < coffeeBagList.size(); i++)
		{
			coffee = coffeeBagList.get(i);
			getCoffeeInXMLadd(coffee.getName(),coffee.getQuanlity());
		}
		
		return coffeeBag;
	}
	
}