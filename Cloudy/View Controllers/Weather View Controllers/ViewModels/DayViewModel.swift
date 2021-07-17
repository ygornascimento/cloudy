//
//  DayViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 17/07/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import UIKit

struct DayViewModel {
    
    let weatherData: WeatherData
    private let dateFormatter = DateFormatter()
    
    var date: String {
        dateFormatter.dateFormat = "EEE, MMMM d"
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var time: String {
        dateFormatter.dateFormat = UserDefaults.timeNotation.timeFormat
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var summary: String {
        weatherData.summary
    }
    
    var temperature: String {
        let temperature = weatherData.temperature
        
        switch UserDefaults.temperatureNotation {
        case .fahrenheit:
            return String(format: "%.1f °F", temperature)
        case .celsius:
            return String(format: "%.1f °C", temperature.toCelcius)
        }
    }
    
    var windSpeed: String {
        let windSpeed = weatherData.windSpeed
        
        switch UserDefaults.unitsNotation {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH)
        }
    }
    
    var image: UIImage {
        UIImage.imageForIcon(with: weatherData.icon)!
    }
}
