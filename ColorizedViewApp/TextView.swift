//
//  TextView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct TextView: View {
    
    @Binding var value: Double
    
    var body: some View {
        Text(String(format: "%.f", value))
            .font(.title2.bold())
            .frame(width: 50, height: 40, alignment: .center)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(value: .constant(999))
    }
}