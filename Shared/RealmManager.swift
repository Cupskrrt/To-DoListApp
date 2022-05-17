//
//  RealmManager.swift
//  To-DoListApp
//
//  Created by Luthfi Khan on 17/05/22.
//

import Foundation
import RealmSwift

class RealmManager : ObservableObject {
    //Buat ngebuka realmnya
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTask()
    }
    
    func openRealm(){
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration  = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String){
        if let localRealm = localRealm {
            do {
                try localRealm.write{
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    print("Added new task to realm \(newTask)")
                    getTask()
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func getTask(){
        if let localRealm = localRealm {
            let allTask = localRealm.objects(Task.self).sorted(byKeyPath: "Completed")
            tasks = []
            
            allTask.forEach{ task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool){
        if let localRealm = localRealm {
            do{
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: " id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write{
                    taskToUpdate[0].completed = completed
                    getTask()
                    print("Updated task with id \(id) Completed status: \(completed)")
                }
            } catch {
                print("Error updating task \(id) to realm: \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId){
        if let localRealm = localRealm {
            do{
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(taskToDelete)
                    getTask()
                    print("Deleted task id \(id)")
                }
            } catch {
                print ("Error deleting tast \(id) from Realm: \(error)")
            }
        }
    }
    
}
