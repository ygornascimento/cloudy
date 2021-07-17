//
//  SettingsTimeViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 17/07/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsTimeViewModel: SettingsPresentable {
    let timeNotation: TimeNotation
        
    var text: String {
        switch timeNotation {
        case .twelveHour:
            return "12 Hour"
        case .twentyFourHour:
            return "24 Hour"
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.timeNotation == timeNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}
