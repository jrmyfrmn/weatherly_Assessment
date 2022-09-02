//
//  SplashScreenView.swift
//  Weather Forecast
//
//  Created by jeremy.fermin on 8/17/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8 // Animation
    @State private var opacity = 0.8 // Opacity
    
    var body: some View {
        
        if isActive {
            
            ContentView()
            
        } else {
            
            VStack {
                VStack {
                    
                    Image("lsicon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .cornerRadius(10)
                    Text("Weatherly")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.gray.opacity(0.95))
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation { // to avoid abrupt showing of ContentView
                        self.isActive = true
                    }
                    
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
