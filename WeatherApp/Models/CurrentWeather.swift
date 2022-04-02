//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Владислав Колундаев on 02.04.2022.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        let temp = String(format: "%.0f", temperature)
        if temp == "-0" {
            return "0"
        } else {
            return temp
        }
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        let temp = String(format: "%.0f", feelsLikeTemperature)
        if temp == "-0" {
            return "0"
        } else {
            return temp
        }
    }
    
    let coditionCode: Int
    
    var systemItemNameString: String {
        switch coditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800:       return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default:        return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        coditionCode = currentWeatherData.weather.first!.id
    }
}
