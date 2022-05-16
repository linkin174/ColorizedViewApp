//
//  ContentView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...1.0)
    @State private var greenValue = Double.random(in: 0...1.0)
    @State private var blueValue = Double.random(in: 0...1.0)
    
    var body: some View {

        VStack(spacing: 48) {
            ColorizedRectangleView(redValue: redValue, greenValue: greenValue, blueValue: blueValue)
            sliders
        }
    }
    
    
}

extension ContentView {
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    private var sliders: some View {
        VStack(spacing: 20) {
            SliderView(sliderColor: .red, sliderValue: $redValue)
            SliderView(sliderColor: .green, sliderValue: $greenValue)
            SliderView(sliderColor: .blue, sliderValue: $blueValue)
        }
        .padding(8)
        .frame(width: bounds.width * 0.9, height: bounds.height * 0.3)
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        .cornerRadius(16)
        .shadow(color: .black, radius: 10, x: 2, y: 5)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
