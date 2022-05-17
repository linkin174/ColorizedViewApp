//
//  BackgroundView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//
//JUST FOR FUN 😃

import SwiftUI

struct BackgroundView: View {
    
    private let frameSize = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Color(red: 0.8, green: 0.9, blue: 0.9).ignoresSafeArea()
            Circle()
                .foregroundColor(.cyan.opacity(0.75))
                .opacity(0.5)
                .frame(width: frameSize * 0.7)
                .offset(x: 200, y: 300)
            Circle()
                .foregroundColor(.purple.opacity(0.6))
                .opacity(0.5)
                .frame(width: frameSize * 0.3)
                .offset(x: 50, y: -300)
            Circle()
                .foregroundColor(.blue.opacity(0.9))
                .frame(width: frameSize * 0.5)
                .offset(x: -150, y: -50)
        }.preferredColorScheme(.light)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
