//
//  WeatherDayPresentable.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 18/07/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import UIKit

protocol WeatherDayPresentable {
    var day: String { get }
    var date: String { get }
    var image: UIImage? { get }
    var windSpeed: String { get }
    var temperature: String { get }
}
