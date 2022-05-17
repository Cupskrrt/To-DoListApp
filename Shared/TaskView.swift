//
//  TaskView.swift
//  To-DoListApp
//
//  Created by Luthfi Khan on 17/05/22.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack{
            Text("Task")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            List{
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    TaskRow(task: task.title, completed: task.completed)
                }
            }
            .onAppear{
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 1.0, saturation: 0.226, brightness: 0.953))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
