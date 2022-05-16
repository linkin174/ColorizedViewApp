//
//  ContentView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

//class TextFieldText : ObservableObject {
//    @Published var value: Double = 0.5
//}

struct ContentView: View {
    
    @State private var redValue: Double = 128
    @State private var greenValue: Double = 100
    @State private var blueValue: Double = 28

    var body: some View {
        ZStack {
            Color(red: 0.7, green: 0.7, blue: 0.7).ignoresSafeArea()
            VStack(spacing: 48) {
                ColorizedRectangleView(redValue: redValue / 255,
                                       greenValue: greenValue / 255,
                                       blueValue: blueValue / 255)
            rgbSliders
            Spacer()
            }
        }
    }
}

extension ContentView {
    private var bounds: CGRect {
        UIScreen.main.bounds
    }

    private var rgbSliders: some View {
        ZStack {
            Color(red: 0.9, green: 0.9, blue: 0.9)
                .shadow(color: .red, radius: 5, x: 0, y: 0)
            VStack(spacing: 24){
                ColorSliderView(value: $redValue, color: .red)
                ColorSliderView(value: $greenValue, color: .green)
                ColorSliderView(value: $blueValue, color: .blue)
            }.padding()
        }
        .frame(width: bounds.width - 32, height: 200)
//        .shadow(color: .gray, radius: 3, x: 2, y: 4)
        .cornerRadius(12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
