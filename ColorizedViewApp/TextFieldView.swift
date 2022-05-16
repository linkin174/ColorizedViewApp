//
//  TextFieldView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: Double
    @State private var isPresented = false
    
    var body: some View {
        TextField("", value: $value,
                  formatter: formatter, onEditingChanged: { _ in checkInput() })
            .frame(width: 60, height: 40, alignment: .center)
            .background(border)
            .font(.title2.bold())
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .alert("OOPS",
                   isPresented: $isPresented,
                   actions: { alertAction },
                   message: { alertMessage })
    }
}

extension TextFieldView {
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.maximumFractionDigits = 0
        return formatter
    }
    
    private var border: some View {
        RoundedRectangle(cornerRadius: 8)
            .strokeBorder(.blue, lineWidth: 2)
    }
    
    private var alertAction: some View {
        Button("OK", action: { self.value = Double.random(in: 0...255) })
    }
    
    private var alertMessage: some View {
        Text("Enter number in range from 0 to 255")
    }
    
    private func checkInput() {
        if value > 255 {
            isPresented.toggle()
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(255))
    }
}
