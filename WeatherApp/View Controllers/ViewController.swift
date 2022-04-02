//
//  ViewController.swift
//  WeatherApp
//
//  Created by Владислав Колундаев on 01.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onComlition = { currentWeather in
            self.updateInterface(by: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "London")
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        presentedAlert(withTitle: "Enter city name", message: nil, style: .alert) { cityName in
            self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
        }
    }
    
    func updateInterface(by weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImage.image = UIImage(systemName: weather.systemItemNameString)
        }
    }
}

