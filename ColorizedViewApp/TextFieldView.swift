//
//  TextFieldView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var value: Double
   
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    
    
    private var border: some View {
        RoundedRectangle(cornerRadius: 8)
            .strokeBorder(.black, lineWidth: 2)
      }
    
    var body: some View {
        TextField("", value: $value, formatter: formatter)
            .frame(width: 60, height: 40, alignment: .center)
            .background(border)
            .font(.title2.bold())
            .multilineTextAlignment(.center)
    }

}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(255))
    }
}
