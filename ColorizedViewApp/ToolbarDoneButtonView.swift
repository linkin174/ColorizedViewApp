//
//  ToolbarDoneButtonView.swift
//  ColorizedViewApp
//
//  Created by Aleksandr Kretov on 21.05.2022.
//

import SwiftUI

struct ToolbarDoneButtonView: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Done").font(.title3).bold()
            
        }
    }
}

struct ToolbarDoneButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarDoneButtonView(action: {})
    }
}
