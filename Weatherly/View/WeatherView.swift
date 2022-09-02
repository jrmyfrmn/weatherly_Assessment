//
//  WeatherlyApp.swift
//  Weatherly
//
//  Created by jeremy.fermin on 8/19/22.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        HStack {
            ZStack {
                LinearGradient(gradient: .init(colors: [.pink, .purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                ZStack(alignment: .center) {
                    VStack {
                        
                        VStack (alignment: .center, spacing: 20) {
                            Text(weather.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            
                            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                            .frame(height: 40)
                        
                        VStack {
                            HStack {
                                VStack(spacing: 10) {
                                    Image(systemName: "cloud")
                                        .font(.system(size: 40))
                                        .foregroundColor(Color.white)
                                    
                                    Text("\(weather.weather[0].main)")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.white)
                                }
                                .frame(width: 100, alignment: .leading)
                                
                                
                                Text(weather.main.temp.roundDouble() + "°")
                                    .font(.system(size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding()
                            }
                            
                            Spacer()
                                .frame(height:  400)
                            
                            Image("GradientCity")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 500)
                                .position(x: 192, y: -259)
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        
                        Spacer()
                            //.frame(height: 400)
                        
                        VStack(alignment: .leading, spacing: 40) {
                            
                            Text("Today's Weather")
                                .bold()
                                .padding(.bottom)
                                .foregroundColor(Color.white)
                               
                            
                            HStack {
                                WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                                
                                
                                Spacer()
                                
                                WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                            }
                            
                            HStack {
                                WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                                
                                Spacer()
                                
                                WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                            }
                        } // End of VStack
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(20)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
