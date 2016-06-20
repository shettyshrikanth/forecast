package com.excercise.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.stereotype.Component;

@Component
public class ForecastServiceImpl  implements ForecastService {
	
	public String getByCity(String city) {
		StringBuilder result = new StringBuilder();

		try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
			HttpGet httpGet = new HttpGet(
					"http://api.openweathermap.org/data/2.5/weather?appid=f9a40784a1f99df69445dccaed8eab5a&units=imperial&q=" + city);

			HttpResponse response = httpclient.execute(httpGet);
			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

			String line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result.toString();
	}	
}
