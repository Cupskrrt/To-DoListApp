//
//  AddTaskView.swift
//  To-DoListApp
//
//  Created by Luthfi Khan on 17/05/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button{
                if title != ""{
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 1.0, saturation: 0.503, brightness: 0.776))
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal)
        .background(Color(hue: 1.0, saturation: 0.226, brightness: 0.953))
        .ignoresSafeArea()
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
