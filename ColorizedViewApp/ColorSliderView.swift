//
//  RGBSlidersView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct ColorSliderView: View {
   
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        VStack {
            HStack() {
                TextView(value: $value)
                SliderView(sliderValue: $value,
                           sliderColor: color)
                TextFieldView(value: $value)
            }
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(999), color: .red)
    }
}
