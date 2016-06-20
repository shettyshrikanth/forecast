package com.excercise.service;

import org.springframework.stereotype.Component;

@Component
public interface ForecastService {
	public String getByCity(String city);
}
