//
//  DataManager.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

final class DataManager {

    // MARK: - Type Aliases
    
    typealias WeatherDataResult = (Result<WeatherData, WeatherDataError>) -> ()

    // MARK: - Requesting Data

    func weatherDataForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherDataResult) {
        // Create URL
        let url = WeatherServiceRequest(latitude: latitude, longitude: longitude).url
        
        // Create Data Task
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
            }
        }.resume()
    }

    // MARK: - Helper Methods

    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: WeatherDataResult) {
        if let error = error {
            completion(.failure(.failedRequest))
            print("Unable to Fetch Weather Data, \(error)")

        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()
                    
                    // Configure JSON Decoder
                    decoder.dateDecodingStrategy = .secondsSince1970
                    
                    // Decode JSON
                    let weatherData = try decoder.decode(WeatherData.self, from: data)

                    // Invoke Completion Handler
                    completion(.success(weatherData))

                } catch {
                    completion(.failure(.invalidResponse))
                    print("Unable to Decode Response, \(error)")
                }

            } else {
                completion(.failure(.failedRequest))
            }

        } else {
            completion(.failure(.unknown))
        }
    }

}
