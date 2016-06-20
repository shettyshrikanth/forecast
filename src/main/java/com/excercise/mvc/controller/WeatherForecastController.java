package com.excercise.mvc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.excercise.service.ForecastService;

@Controller
public class WeatherForecastController {
	
	@Autowired
	private ForecastService forecastService;

	@RequestMapping(value="/home")
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("home");
	}
	
	@RequestMapping(value="/getByCity")
	public @ResponseBody String getByCity(HttpServletResponse response, @RequestParam("city") String city) throws IOException{		
		return  forecastService.getByCity(city); 
	}	
}
