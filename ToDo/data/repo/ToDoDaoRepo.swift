//
//  ToDoDaoRepo.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 12.08.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepo{
    
    var todoList = BehaviorSubject<[ToDos]>(value:[ToDos]())
    
    func save(todo : String, toDoTitle:String){
        print("To Do : \(toDoTitle) - \(todo)")
    }
    
    func update(todo_id:Int, toDo_title:String, toDo_detail:String){
        print("Update To Do : \(todo_id) - \(toDo_title) - \(toDo_detail)")
    }
    
    func ara(aramakelimesi : String){
        print("Aranan ToDo: \(aramakelimesi)")
    }
    
    func sil(todo_id:Int){
        print("To Do Sil: \(todo_id)")
    }
    
    func writeToDos() {
        
        var toDos = [ToDos]()

        let l1 = ToDos(toDo_id: 1, toDo_title: "Grocery", toDo_note: "Buy a banana and an apple.")
        let l2 = ToDos(toDo_id: 2, toDo_title: "Phone call", toDo_note: "Call your mom!")
        let l3 = ToDos(toDo_id: 3, toDo_title: "Homework", toDo_note: "Do your homework and research about tableview.")
        let l4 = ToDos(toDo_id: 4, toDo_title: "Meeting", toDo_note: "You have meeting at 8.00am tomorrow.")
        let l5 = ToDos(toDo_id: 5, toDo_title: "Shopping", toDo_note: "Buy a dress for yourself.")
        
        toDos.append(l1)
        toDos.append(l2)
        toDos.append(l3)
        toDos.append(l4)
        toDos.append(l5)
        
        todoList.onNext(toDos)
    }
}
