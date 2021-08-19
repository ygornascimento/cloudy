//
//  SettingsUnitsViewModelTests.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 19/08/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsUnitsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        UserDefaults.standard.removeObject(forKey: "unitsNotation")
    }
    
    func testText_Imperial() {
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        XCTAssertEqual(viewModel.text, "Imperial")
    }
    
    func testText_Metric() {
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        XCTAssertEqual(viewModel.text, "Metric")
    }
    
    func testAccesoryType_Imperial_Imperial() {
        let unitNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitNotation.rawValue, forKey: "unitsNotation")
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }
    
    func testAccesoryType_Imperial_Metric() {
        let unitNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitNotation.rawValue, forKey: "unitsNotation")
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
        
    }
    
    func testAccesoryType_Metric_Metric() {
        let unitNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitNotation.rawValue, forKey: "unitsNotation")
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
        
    }
    
    func testAccesoryType_Metric_Imperial() {
        let unitNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitNotation.rawValue, forKey: "unitsNotation")
        
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
        
    }
}
