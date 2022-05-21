//
//  ContentView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

private enum ColorTextField {
    case red
    case green
    case blue
}

struct ContentView: View {
    
    @State private var redValue: Double = Double.random(in: 0...255)
    @State private var greenValue: Double = Double.random(in: 0...255)
    @State private var blueValue: Double = Double.random(in: 0...255)

    @FocusState private var focusedField: ColorTextField?

    private var bounds = UIScreen.main.bounds

    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 24) {
                ColorizedRectangleView(redValue: redValue,
                                       greenValue: greenValue,
                                       blueValue: blueValue)
                ZStack {
                    Color.white
                        .frame(width: bounds.width - 32, height: 170)
                        .blendMode(.softLight)
                        .cornerRadius(12)
                    VStack(spacing: 24) {
                        ColorSliderView(value: $redValue, sliderColor: .red)
                            .focused($focusedField, equals: .red)
                        ColorSliderView(value: $greenValue, sliderColor: .green)
                            .focused($focusedField, equals: .green)
                        ColorSliderView(value: $blueValue, sliderColor: .blue)
                            .focused($focusedField, equals: .blue)
                    }
                    .padding()
                    .frame(width: bounds.width - 32, height: 200)
                    .shadow(color: .gray, radius: 6, x: 0, y: 2)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            ToolbarButtonView(action: toPreviousField, imageName: "chevron.up")
                            ToolbarButtonView(action: toNextField, imageName: "chevron.down")
                            Spacer()
                            ToolbarDoneButtonView { focusedField = nil }
                        }
                    }
                }
                Spacer()
            }
        }
        .padding(.top, 32)
        .padding(.bottom, 32)
        .onTapGesture { focusedField = nil }
    }
    
    private func toNextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        default:
            focusedField = .red
        }
    }

    private func toPreviousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        default:
            focusedField = .green
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
