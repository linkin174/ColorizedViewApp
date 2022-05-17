//
//  RGBSlidersView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double

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
                .frame(width: 70, height: 30, alignment: .leading)
            Slider(value: $value, in: 0 ... 255)
                .animation(.default, value: value)
                .tint(sliderColor)
            TextField("", text: $value.string)
                .frame(width: 50, height: 30)
                .font(.system(size: 14).bold())
                .background(border)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .onChange(of: value) { _ in value > 255 ? value = 255 : nil }
        }
    }
}

extension Double {
    var string: String {
        get { String(format: "%.f", self) }
        set { self = Double(newValue) ?? 0 }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(999), sliderColor: .red)
    }
}
