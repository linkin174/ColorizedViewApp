//
//  ContentView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 16.05.2022.
//

import SwiftUI

private enum ColorTextField {
    case redTF
    case greenTF
    case blueTF
}

private enum Direction {
    case up
    case down
}

struct ContentView: View {

    @State private var redValue: Double = Double.random(in: 0...255)
    @State private var greenValue: Double = Double.random(in: 0...255)
    @State private var blueValue: Double = Double.random(in: 0...255)
    
    @State private var redTFtext = ""
    @State private var greenTFtext = ""
    @State private var blueTFtext = ""
    
    @State private var isPresented = false
    
    @FocusState private var focusedField: ColorTextField?

    var body: some View {
        ZStack {
            BackgroundView()
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
                Button(action: { checkInputFor(textFiled: focusedField ?? .redTF) ? focusedField = nil : nil },
                       label: { Text("Done").font(.title3).bold() })
            }
        }
        .alert("ERROR", isPresented: $isPresented, actions: {}, message: {Text("Enter number in range 0 to 255")})
    }

    private func checkInputFor(textFiled: ColorTextField) -> Bool {
        switch textFiled {
        case .redTF:
            guard let number = Double(redTFtext), number <= 255 else {  isPresented.toggle(); redTFtext = ""; return false}
            redValue = number
            return true
        case .greenTF:
            guard let number = Double(greenTFtext), number <= 255 else { isPresented.toggle(); greenTFtext = ""; return false}
            greenValue = number
            return true
        case .blueTF:
            guard let number = Double(blueTFtext), number <= 255 else { isPresented.toggle(); blueTFtext = ""; return false}
            blueValue = number
            return true
    }
}
}

extension ContentView {
    private var width: CGFloat {
        UIScreen.main.bounds.maxX
    }
    
    private var upDownButtons: some View {
        HStack(){
            Button(action: { switchTF(direction: .up)},
                   label: { Image(systemName: "chevron.up") })
            Button(action: { switchTF(direction: .down) },
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
                ColorSliderView(value: $redValue, text: $redTFtext,
                                sliderColor: .red)
                    .focused($focusedField, equals: .redTF)
                ColorSliderView(value: $greenValue, text: $greenTFtext,
                                sliderColor: .green)
                    .focused($focusedField, equals: .greenTF)
                ColorSliderView(value: $blueValue, text: $blueTFtext,
                                sliderColor: .blue)
                    .focused($focusedField, equals: .blueTF)
            }
            .padding()
            .frame(width: width - 32, height: 200)
            .shadow(color: .gray, radius: 10, x: 0, y: 5)
        }
    }

    private func switchTF(direction: Direction) {
        switch focusedField {
        case .redTF:
            if checkInputFor(textFiled: .redTF) {
                direction == .down ? (focusedField = .greenTF) : (focusedField = .blueTF)
            }
        case .greenTF:
            if checkInputFor(textFiled: .greenTF) {
                direction == .down ? (focusedField = .blueTF) : (focusedField = .redTF)
            }
        default:
            if checkInputFor(textFiled: .blueTF) {
                direction == .down ? (focusedField = .redTF) : (focusedField = .greenTF)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
