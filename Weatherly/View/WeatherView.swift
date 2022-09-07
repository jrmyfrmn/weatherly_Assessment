//
//  WeatherlyApp.swift
//  Weatherly
//
//  Created by jeremy.fermin on 8/19/22.
//

import SwiftUI

struct WeatherView: View {
    
   // public var listOfCity = cityList
    @AppStorage ("isDarkMode") private var isDark = false
    @State private var isSheet = false
    @State var searchText = ""
    
    var weather: ResponseBody
    
    var body: some View {
        NavigationView {
            
            HStack {
                
                ZStack {
                    LinearGradient(gradient: .init(colors: [.pink, .purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    ZStack(alignment: .center) {
                        
                        VStack {
                            VStack (alignment: .center, spacing: 10) {
                                
                                Text(weather.name)
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                    .fontWeight(.light)
                                    .foregroundColor(Color.white)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            VStack {
                                Spacer()
                                HStack {
                                    VStack(spacing: 10) {
                                        Image(systemName: "cloud.fill")
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
                                    .frame(height:  250)
                                
                                Image("GradientCity")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 500)
                                    .position(x: 192, y: -200)
                                
                            }
                            .frame(maxWidth: .infinity)
                        } // end of first VStack
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        .sheet(isPresented: $isSheet) {
                            Text("Sheet View")
                        }
                        .toolbar{
                            ToolbarItem(placement: ToolbarItemPlacement
                                .navigationBarTrailing){
                                    Button(action:{isDark.toggle()}, label:{
                                        isDark ? Label ("Dark", systemImage: "lightbulb.fill") :
                                        Label ("Dark", systemImage: "lightbulb")
                                    })
                                }
                        }
                        //.environment(\.colorScheme, isDark ? .dark : .light)
                        
                        VStack {
                            
                            Spacer()

                            VStack(alignment: .leading, spacing: 50) {
                                HStack {
                                Text("Today's Weather")
                                    .bold()
                                    .padding(.bottom)
                                    .foregroundColor(Color.white)
                                    
                                    Spacer()
                                    
                                    
                                    NavigationLink(destination: Next5DaysView(), label: {
                                        
                                    Text("Next 5 Days")
                                        .bold()
                                        .padding(.bottom)
                                        .foregroundColor(Color.white)
                                        
                                    })
                                    Image(systemName: "chevron.right.circle")
                                        .padding(.bottom)
                                        .foregroundColor(Color.white)

                                }
                                
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
                        } // end of second VStack
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    
                    
                }
            } // End of first HStack

            .searchable(text: $searchText)
            .navigationTitle("Add Cities")
            .environment(\.colorScheme, isDark ? .dark : .light)
            
            
        }
        // End of Nav View
        
    } // end of someView
    
    
    
//    var cities: [String] {
//        let lcCities = listOfCity.map { $0.lowercased() }
//
//        return searchText == "" ? lcCities : lcCities.filter {
//            $0.contains(searchText.lowercased())
//        }
//    } // end newly added codes
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
