//
//  RGBSlidersView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

private func stringFrom(double: Double) -> String {
    String(format: "%.f", double)
}

struct ColorSliderView: View {

    @Binding var value: Double
    @Binding var text: String

    let sliderColor: Color

    private var sliderLabel: String {
        var output = ""
        switch sliderColor {
        case .red:
            output = "RED"
        case .green:
            output = "GRN"
        case .blue:
            output = "BLU"
        default:
            output = "N/A"
        }
        return output
    }

    private var border: some View {
        RoundedRectangle(cornerRadius: 8)
            .strokeBorder(.blue, lineWidth: 2)
    }

    var body: some View {
        HStack(spacing: 8) {
            Text("\(sliderLabel): \(String(format: "%.f", value))")
                .font(.system(size: 14).bold())
                .foregroundColor(Color.black)
                .frame(width: 67, height: 30, alignment: .leading)
            
            Slider(value: $value, in: 0 ... 255)
                .animation(.default, value: value)
                .tint(sliderColor)
                .onChange(of: value) { newValue in
                    text = stringFrom(double: newValue)
                }
                .onAppear {
                    text = stringFrom(double: value)
                }
            
            TextField("", text: $text)
                .frame(width: 50, height: 30)
                .font(.system(size: 14).bold())
                .foregroundColor(Color.black)
                .background(border)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(999), text: .constant("999"), sliderColor: .red)
    }
}
