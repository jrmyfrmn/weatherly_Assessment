//
//  WeatherlyApp.swift
//  Weatherly
//
//  Created by jeremy.fermin on 8/19/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to Weatherly!")
                    .bold()
                    .font(.title)
                
                Text("Tap the share current location to know the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom, 20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
