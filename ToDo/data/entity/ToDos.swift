//
//  ToDos.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 2.08.2023.
//

import Foundation

class ToDos {
    var id:Int?
    var title:String?
    var note:String?
    
    init() {
        
    }
    
    init(toDo_id:Int, toDo_title:String, toDo_note:String){
        self.id = toDo_id
        self.title = toDo_title
        self.note = toDo_note
    }
}
