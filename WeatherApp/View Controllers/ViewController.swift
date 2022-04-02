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
    
    let networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.fetchCurrentWeather(forCity: "London")
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        presentedAlert(withTitle: "Enter city name", message: nil, style: .alert)
    }
    
}

