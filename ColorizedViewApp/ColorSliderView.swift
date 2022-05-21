//
//  RGBSlidersView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State var text: String = ""
    @State private var isPresent = false

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

    var body: some View {
        HStack(spacing: 8) {
            Text("\(sliderLabel): \(lround(value))")
                .font(.system(size: 14).bold())
                .foregroundColor(Color.black)
                .frame(width: 67, height: 30, alignment: .leading)

            Slider(value: $value, in: 0 ... 255)
                .animation(.default, value: value)
                .tint(sliderColor)
                .onChange(of: value) { newValue in
                    text = "\(lround(newValue))"
                }

            TextField("", text: $text, onEditingChanged: { _ in
                checkInput()
            })
            .frame(width: 50, height: 30)
            .font(.system(size: 14).bold())
            .foregroundColor(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.blue, lineWidth: 2))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onAppear {
                text = "\(lround(value))"
            }
            .alert("Wrong input", isPresented: $isPresent, actions: {}) {
                Text("Enter number in range from 0 to 255")
            }
        }
    }

    private func checkInput() {
        guard let number = Int(text), (0 ... 255).contains(number) else {
            isPresent.toggle()
            value = Double.random(in: 0 ... 255)
            text = String(value)
            return
        }
        value = Double(number)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(999), sliderColor: .red)
    }
}
