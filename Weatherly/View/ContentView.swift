//
//  WeatherlyApp.swift
//  Weatherly
//
//  Created by jeremy.fermin on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    // new
    enum Assets {
        static let modes = Image("modes")
    }
    
    var body: some View {
        HStack {
            
            ZStack (alignment: .center){
                Assets
                    .modes
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                
                VStack {
                    if let location = locationManager.location {
                        if let weather = weather {
                            WeatherView(weather: weather)
                        } else {
                            LoadingView()
                                .task {
                                    do {
                                        weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                    } catch {
                                        print("Error getting weather: \(error)")
                                    }
                                }
                        }
                    } else {
                        if locationManager.isLoading {
                            LoadingView()
                        } else {
                            WelcomeView()
                                .environmentObject(locationManager)
                        }
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("LightMode")
                .preferredColorScheme(.light)
            ContentView()
                .previewDisplayName("DarkMode")
                .preferredColorScheme(.dark)
        }
    }
}

