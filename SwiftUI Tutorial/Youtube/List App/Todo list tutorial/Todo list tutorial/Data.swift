//
//  Data.swift
//  Todo list tutorial
//
//  Created by David N. Huang on 12/14/20.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id : String
    var toDoItem : String
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
