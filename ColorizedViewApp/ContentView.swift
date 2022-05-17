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

    @State private var isPresented = false

    @FocusState private var focusedField: ColorTextField?

    var body: some View {
        ZStack {
            BackgroundView()
                .blur(radius: 20)
            VStack(spacing: 48) {
                ColorizedRectangleView(redValue: redValue / 255,
                                       greenValue: greenValue / 255,
                                       blueValue: blueValue / 255)
                rgbSliders
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 32, leading: 0, bottom: 32, trailing: 0))
        .alert("Error",
               isPresented: $isPresented,
               actions: {},
               message: { Text("Enter number in range from 0 to 255") })
        .onTapGesture {
            focusedField = nil
        }
    }
}

extension ContentView {
    private var width: CGFloat {
        UIScreen.main.bounds.maxX
    }

    private var rgbSliders: some View {
        ZStack {
            Color.white
                .frame(width: width - 32, height: 200)
                .blendMode(.softLight)
                .cornerRadius(12)
            VStack(spacing: 24) {
                ColorSliderView(value: $redValue,
                                editingChanged: { _ in checkInput(for: .redTF) },
                                sliderColor: .red)
                    .focused($focusedField, equals: .redTF)
                ColorSliderView(value: $greenValue,
                                editingChanged: { _ in checkInput(for: .greenTF) },
                                sliderColor: .green)
                    .focused($focusedField, equals: .greenTF)
                ColorSliderView(value: $blueValue,
                                editingChanged: { _ in checkInput(for: .blueTF) },
                                sliderColor: .blue)
                    .focused($focusedField, equals: .blueTF)
            }
            .padding(12)
            .frame(width: width - 32, height: 200)
            .shadow(color: .gray, radius: 10, x: 0, y: 5)
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button(action: { previousTFSwitch(for: focusedField ?? .redTF) }, label: { Image(systemName: "chevron.up") })
                Button(action: { nextTFSwitch(for: focusedField ?? .redTF) }, label: { Image(systemName: "chevron.down") })
                Spacer()
                Button(action: { focusedField = nil }, label: { Text("Done").font(.title3).bold() })
            }
        }
    }
    
    
    private func checkInput(for textField: ColorTextField) {
        let randomValue = Double.random(in: 1...255)
        switch textField {
        case .redTF:
            if redValue > 255 {
                isPresented.toggle()
                redValue = randomValue
            }
        case .greenTF:
            if greenValue > 255 {
                isPresented.toggle()
                greenValue = randomValue
            }
        default:
            if blueValue > 255 {
                isPresented.toggle()
                blueValue = randomValue
            }
        }
    }

    private func nextTFSwitch(for field: ColorTextField) {
        switch field {
        case .redTF:
            focusedField = .greenTF
        case .greenTF:
            focusedField = .blueTF
        default:
            focusedField = .redTF
        }
    }

    private func previousTFSwitch(for field: ColorTextField) {
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
