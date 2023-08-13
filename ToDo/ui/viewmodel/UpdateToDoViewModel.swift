//
//  UpdateToDoViewModel.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 12.08.2023.
//

import Foundation

class UpdateToDoViewModel{
    
    var trepo = ToDoDaoRepo()
    
    func update(todo_id:Int, toDo_title:String, toDo_detail:String){
        trepo.update(todo_id: todo_id, toDo_title: toDo_title, toDo_detail: toDo_detail)
    }
}
