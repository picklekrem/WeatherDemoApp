//
//  ContentView.swift
//  WeatherDemoApp
//
//  Created by Ekrem Özkaraca on 7.12.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your cordinates are : \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        
        }.background(Color(hue: 0.665, saturation: 0.646, brightness: 0.968))
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
