//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Владислав Колундаев on 02.04.2022.
//

import Foundation

struct NetworkWeatherManager {
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                self.parseJSON(with: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(with data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
