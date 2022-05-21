//
//  ColorizedRectangleView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct ColorizedRectangleView: View {
    
    let redValue: Double
    let greenValue: Double
    let blueValue: Double

    private let bounds = UIScreen.main.bounds
    
    var body: some View {
        let mainColor = Color(red: redValue / 255,
                              green: greenValue / 255,
                              blue: blueValue / 255)
        RoundedRectangle(cornerRadius: 10)
            .frame(width: bounds.width - 32, height: bounds.height * 0.2)
            .foregroundColor(mainColor)
            .shadow(color: mainColor, radius: 10, x: 2, y: 5)
    }
}

struct ColorizedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedRectangleView(redValue: 128, greenValue: 100, blueValue: 99)
    }
}
