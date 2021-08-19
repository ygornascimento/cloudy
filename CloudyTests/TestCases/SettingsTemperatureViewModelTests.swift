//
//  SettingsTemperatureViewModelTests.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 19/08/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsTemperatureViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        UserDefaults.standard.removeObject(forKey: "temperatureNotation")
    }
    
    func testText_Celsius() {
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        XCTAssertEqual(viewModel.text, "Celsius")
    }
    
    func testText_Fahrenheit() {
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        XCTAssertEqual(viewModel.text, "Fahrenheit")
    }
    
    func testAccesoryType_Celsius_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }
    
    func testAccesoryType_Celsius_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
        
    }
    
    func testAccesoryType_Fahrenheit_Celsius() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
        
    }
    
    func testAccesoryType_Fahreiheit_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }

}
