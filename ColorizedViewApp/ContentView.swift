//
//  ContentView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

private enum ColorTextField {
    case redTF, greenTF, blueTF
}

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    @FocusState private var focusedField: ColorTextField?

    var body: some View {
        ZStack {
            BackgroundView()
                .blur(radius: 20)
            VStack(spacing: 24) {
                ColorizedRectangleView(redValue: redValue / 255,
                                       greenValue: greenValue / 255,
                                       blueValue: blueValue / 255)
                rgbSliders
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 32, leading: 0, bottom: 32, trailing: 0))
        .onTapGesture { focusedField = nil }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                upDownButtons
                Spacer()
                Button(action: { focusedField = nil },
                       label: { Text("Done").font(.title3).bold() })
            }
        }
    }
}

extension ContentView {
    private var width: CGFloat {
        UIScreen.main.bounds.maxX
    }
    
    private var upDownButtons: some View {
        HStack(){
            Button(action: { previousTF(from: focusedField ?? .redTF) },
                   label: { Image(systemName: "chevron.up") })
            Button(action: { nextTF(from: focusedField ?? .redTF) },
                   label: { Image(systemName: "chevron.down") })
        }
    }

    private var rgbSliders: some View {
        ZStack {
            Color.white
                .frame(width: width - 32, height: 170)
                .blendMode(.softLight)
                .cornerRadius(12)
            VStack(spacing: 24) {
                ColorSliderView(value: $redValue,
                                sliderColor: .red)
                    .focused($focusedField, equals: .redTF)
                ColorSliderView(value: $greenValue,
                                sliderColor: .green)
                    .focused($focusedField, equals: .greenTF)
                ColorSliderView(value: $blueValue,
                                sliderColor: .blue)
                    .focused($focusedField, equals: .blueTF)
            }
            .padding()
            .frame(width: width - 32, height: 200)
            .shadow(color: .gray, radius: 10, x: 0, y: 5)
        }
    }

    private func nextTF(from field: ColorTextField) {
        switch field {
        case .redTF:
            focusedField = .greenTF
        case .greenTF:
            focusedField = .blueTF
        default:
            focusedField = .redTF
        }
    }

    private func previousTF(from field: ColorTextField) {
        switch field {
        case .redTF:
            focusedField = .blueTF
        case .greenTF:
            focusedField = .redTF
        default:
            focusedField = .greenTF
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
