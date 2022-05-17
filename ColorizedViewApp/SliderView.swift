//
//  SliderView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    let sliderColor: Color

    var body: some View {
        Slider(value: $sliderValue, in: 0...255)
            .animation(.default, value: sliderValue)
            .tint(sliderColor)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(95.5), sliderColor: .green)
    }
}
