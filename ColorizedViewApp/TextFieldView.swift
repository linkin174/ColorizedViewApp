//
//  TextFieldView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var value: Double
    let editingChanged: (Bool) -> Void

    private var border: some View {
        RoundedRectangle(cornerRadius: 8)
            .strokeBorder(.blue, lineWidth: 2)
    }
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.maximumFractionDigits = 0
        return formatter
    }
    
    var body: some View {
        TextField("", value: $value,
                  formatter: formatter,
                  onEditingChanged: editingChanged)
            .frame(width: 60, height: 40, alignment: .center)
            .background(border)
            .font(.system(size: 14).bold())
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            
    }

}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(255), editingChanged: { _ in })
    }
}
