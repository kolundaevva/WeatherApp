//
//  ViewController+alertController.swift
//  WeatherApp
//
//  Created by Владислав Колундаев on 01.04.2022.
//

import Foundation
import UIKit

extension ViewController {
    func presentedAlert(withTitle title: String?, message: String?, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { tf in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { _ in
            let tf = alert.textFields?.first
            if let city = tf?.text, city != "" {
                print("Searching in \(city)")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(search)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
