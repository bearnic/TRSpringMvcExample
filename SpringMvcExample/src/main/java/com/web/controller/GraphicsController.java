package com.web.controller;

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

@Controller
public class GraphicsController {

	@RequestMapping(value = "svgExample", method = RequestMethod.GET)
	public ModelAndView getsvgExample() 
	{
		ModelAndView mv = new ModelAndView("svgExample");
		return mv;
	}
	
	@RequestMapping(value = "3Dtest", method = RequestMethod.GET)
	public ModelAndView get3Dtest() 
	{
		ModelAndView mv = new ModelAndView("3Dtest");
		return mv;
	}
	
	@RequestMapping(value = "3DInteractive", method = RequestMethod.GET)
	public ModelAndView get3DInteractive() 
	{
		ModelAndView mv = new ModelAndView("3DInteractive");
		return mv;
	}
	
	@RequestMapping(value = "3Dtexture", method = RequestMethod.GET)
	public ModelAndView get3Dtexture() 
	{
		ModelAndView mv = new ModelAndView("3Dtexture");
		return mv;
	}
	
	@RequestMapping(value = "3DRoom", method = RequestMethod.GET)
	public ModelAndView get3DRoom() 
	{
		ModelAndView mv = new ModelAndView("3DRoom");
		return mv;
	}
}
