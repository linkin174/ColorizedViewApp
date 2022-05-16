//
//  SliderView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct SliderView: View {
    
    let sliderColor: Color
    @Binding var sliderValue: Double
    
    var body: some View {
        VStack{
            HStack{
                Text("0")
                    .font(.title2).bold()
                    .frame(width: 40, height: 20, alignment: .trailing)
                Slider(value: $sliderValue)
                    .tint(sliderColor)
                Text("255")
                    .font(.title2).bold()
                    .frame(width: 40, height: 20, alignment: .trailing)
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderColor: .green, sliderValue: .constant(0.5))
    }
}
