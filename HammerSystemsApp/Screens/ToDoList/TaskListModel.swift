//
//  TaskListModel.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 24.01.2022.
//

import Foundation
import RealmSwift

class TaskListModel: Object {
    
    @objc dynamic var taskName: String = ""
    @objc dynamic var taskCompleted: Bool = false
    
    convenience init(_ taskName: String, _ taskCompleted: Bool) {
        self.init()
        self.taskName = taskName
        self.taskCompleted = taskCompleted
    }
}
