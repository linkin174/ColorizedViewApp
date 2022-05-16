//
//  ColorizedRectangleView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct ColorizedRectangleView: View {
    
    let bounds = UIScreen.main.bounds
    let redValue: Double
    let greenValue: Double
    let blueValue: Double
    
    var body: some View {
        let mainColor = Color(red: redValue,
                                    green: greenValue,
                                    blue: blueValue)
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: bounds.width * 0.9, height: bounds.height * 0.3)
            .foregroundColor(mainColor)
            .shadow(color: mainColor, radius: 10, x: 2, y: 5)
    }
}

struct ColorizedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedRectangleView(redValue: 0.2, greenValue: 0.15, blueValue: 0.75)
    }
}
