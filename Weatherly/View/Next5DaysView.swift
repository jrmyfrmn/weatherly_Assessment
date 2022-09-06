//
//  Next5DaysView.swift
//  Weatherly
//
//  Created by jeremy.fermin on 9/6/22.
//

import SwiftUI

struct Next5DaysView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView {
            
            navigationBar
            
            HStack {

                Image(systemName: "calendar")
                    .foregroundColor(Color.white)
                
                Text("5-DAY FORECAST")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            
            VStack (spacing: 16) {
                HStack {
                    Text("September 6")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("31°")
                        Text("26°")
                        
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("September 7")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("32°")
                        Text("26°")
                        
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("September 8")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("33°")
                        Text("26°")
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("September 9")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("32°")
                        Text("26°")
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("September 10")
                    Spacer()
                    Image(systemName: "cloud.bolt.rain.fill")
                    VStack {
                        Text("31°")
                        Text("26°")
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
            }
            .padding(10)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 40, style: .continuous))
            
            
            Spacer()
            
    }
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.9), .blue.opacity(0.6), .pink]), startPoint: .top, endPoint: .bottom)).zIndex(10)
}
    
    private var navigationBar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left.circle")
                    Text("Back")
                }
        }
            .foregroundColor(Color.white)
            
            Spacer()
        
    }
        .padding()
    }
}
struct Next5DaysView_Previews: PreviewProvider {
    static var previews: some View {
        Next5DaysView()
    }
}

