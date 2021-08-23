//
//  DayViewModelTest.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 20/08/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewModelTest: XCTestCase {
    
    var viewModel: DayViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = loadStub(name: "weather", extension: "json")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let weatherData = try decoder.decode(WeatherData.self, from: data)
        
        viewModel = DayViewModel(weatherData: weatherData)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDate() {
        XCTAssertEqual(viewModel.date, "Mon, June 22")
    }
    
    func testTime_TwelveHour() {
        let timeNotatation = TimeNotation.twelveHour
        UserDefaults.standard.set(timeNotatation.rawValue, forKey: "timeNotation")
        
        XCTAssertEqual(viewModel.time, "11:53 AM")
    }
    
    func testTime_TwentyFourHour() {
        let timeNotatation = TimeNotation.twentyFourHour
        UserDefaults.standard.set(timeNotatation.rawValue, forKey: "timeNotation")
        
        XCTAssertEqual(viewModel.time, "11:53")
    }
    
    func testSummary() {
        XCTAssertEqual(viewModel.summary, "Overcast")
    }
    
    func testTemperature_Fahrenheit() {
        let temperatureNotation = TemperatureNotation.fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        XCTAssertEqual(viewModel.temperature, "68.7 °F")
    }
    
    func testTemperature_Celsius() {
        let temperatureNotation = TemperatureNotation.celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        XCTAssertEqual(viewModel.temperature, "20.4 °C")
    }
    
    func testWindSpeed_Imperial() {
        let unitsNotation = UnitsNotation.imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        XCTAssertEqual(viewModel.windSpeed, "6 MPH")
    }
    
    func testWindSpeed_Metric() {
        let unitsNotation = UnitsNotation.metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        XCTAssertEqual(viewModel.windSpeed, "10 KPH")
    }
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage.pngData()!
        let imageDataReference = UIImage(named: "cloudy")!.pngData()!
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage.size.width, 236.0)
        XCTAssertEqual(viewModelImage.size.height, 172.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }
}
