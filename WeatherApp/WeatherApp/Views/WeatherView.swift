//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Falokun Daniel on 11/8/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                VStack {
                    HStack{
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.fill")
                                .font((.system(size: 40)))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading )
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble()+"°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                        
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://1000logos.net/wp-content/uploads/2017/04/London-Underground-Logo.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                            .opacity(0.87)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
                Text("The humidity is \(weather.main.humidity.roundDouble())"+"°").font(.system(size: 20))
                    .fontWeight(.bold)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
          
                
            
            
//            VStack {
//                Spacer()
//
//                VStack(alignment: .leading, spacing: 20){
//
//                }.frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
//                    .padding(.bottom, 20)
//                foregroundColor(Color(hue: 0.526, saturation: 0.943, brightness: 0.917))
//                    .background(.white)
//                    .cornerRadius(20, corners: [.topLeft, .topRight])
//            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.526, saturation: 0.943, brightness: 0.917))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
