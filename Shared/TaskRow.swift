//
//  TaskRow.swift
//  To-DoListApp
//
//  Created by Luthfi Khan on 17/05/22.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: completed ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 20, height: 20, alignment: .leading)
            
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Manasin Motor", completed: true)
    }
}
