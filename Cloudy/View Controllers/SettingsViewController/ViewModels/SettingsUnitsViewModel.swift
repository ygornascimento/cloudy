//
//  SettingsUnitsViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 17/07/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsUnitsViewModel: SettingsPresentable {
    let unitsNotation: UnitsNotation
    
    var text: String {
        switch unitsNotation {
        case .imperial:
            return "Imperial"
        case .metric:
            return "Metric"
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.unitsNotation == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}
