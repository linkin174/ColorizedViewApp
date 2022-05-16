//
//  ContentView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ColorizedRectangleView(redValue: 100, greenValue: 20, blueValue: 222)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
