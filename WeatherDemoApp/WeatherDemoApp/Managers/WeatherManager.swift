//
//  WeatherManager.swift
//  WeatherDemoApp
//
//  Created by Ekrem Özkaraca on 7.12.2021.
//

import Foundation
import CoreLocation

// api key = 409ed5b30e5f82603258c22874d9e136

class WeatherManager {
    let apiKey = "409ed5b30e5f82603258c22874d9e136"
    
    func getCurrentWeather (lat : CLLocationDegrees, lon : CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        let (data, response) =  try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
}

