//
//  Task.swift
//  To-DoListApp
//
//  Created by Luthfi Khan on 17/05/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
