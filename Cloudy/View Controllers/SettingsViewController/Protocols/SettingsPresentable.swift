//
//  SettingsPresentable.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 17/07/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import UIKit

protocol SettingsPresentable {
    var text: String { get }
    var accessoryType: UITableViewCell.AccessoryType { get }
}
