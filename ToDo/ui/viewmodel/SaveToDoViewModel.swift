//
//  SaveToDoViewModel.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 12.08.2023.
//

import Foundation

class SaveToDoViewModel{
    
    var trepo = ToDoDaoRepo()
    
    func save(todo : String, toDoTitle:String){
        trepo.save(todo: todo, toDoTitle: toDoTitle)
    }
}
