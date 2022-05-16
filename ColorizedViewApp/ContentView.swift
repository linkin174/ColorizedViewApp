//
//  ContentView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

// class TextFieldText : ObservableObject {
//    @Published var value: Double = 0.5
// }

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)

    var body: some View {
        ZStack {
            BackgroundView()
                .blur(radius: 20)
            VStack(spacing: 48) {
                ColorizedRectangleView(redValue: redValue / 255,
                                       greenValue: greenValue / 255,
                                       blueValue: blueValue / 255)
                rgbSliders
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 32, leading: 0, bottom: 32, trailing: 0))
    }
}

extension ContentView {
    private var width: CGFloat {
        UIScreen.main.bounds.maxX
    }

    private var rgbSliders: some View {
        ZStack {
            Color.white
                .frame(width: width - 32, height: 200)
                .blendMode(.softLight)
                .cornerRadius(12)
            VStack(spacing: 24) {
                ColorSliderView(value: $redValue, color: .red)
                ColorSliderView(value: $greenValue, color: .green)
                ColorSliderView(value: $blueValue, color: .blue)
            }
            .padding(12)
            .frame(width: width - 32, height: 200)
            .shadow(color: .gray, radius: 10, x: 0, y: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
