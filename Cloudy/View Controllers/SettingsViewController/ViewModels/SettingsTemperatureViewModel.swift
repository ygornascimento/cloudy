//
//  SettingsTemperatureViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 17/07/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsTemperatureViewModel: SettingsPresentable {
    let temperatureNotation: TemperatureNotation
    
    var text: String {
        switch temperatureNotation {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.temperatureNotation == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}
