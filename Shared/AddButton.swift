//
//  AddButton.swift
//  To-DoListApp
//
//  Created by Luthfi Khan on 17/05/22.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hue: 1.0, saturation: 0.503, brightness: 0.776))
            
            Image(systemName: "plus")
                .foregroundColor(.white)
        }
        .frame(height:  50)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
