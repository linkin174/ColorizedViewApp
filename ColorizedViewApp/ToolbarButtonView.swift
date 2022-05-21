//
//  ToolbarButtonView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 18.05.2022.
//

import SwiftUI

struct ToolbarButtonView: View {
    let action: () -> Void
    let imageName: String

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
        }
    }
}

struct ToolbarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButtonView(action: {}, imageName: "chevron.up")
    }
}

