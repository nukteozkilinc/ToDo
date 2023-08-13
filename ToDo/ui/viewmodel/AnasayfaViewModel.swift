//
//  AnasayfaViewModel.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 12.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var trepo = ToDoDaoRepo()
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    init() {
        toDoList = trepo.todoList
    }
    
    func ara(aramakelimesi : String){
        trepo.ara(aramakelimesi: aramakelimesi)
    }
    
    func sil(todo_id:Int){
        trepo.sil(todo_id: todo_id)
    }
    
    func writeToDos() {
        trepo.writeToDos()
    }
}
