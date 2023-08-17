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
    
    let db:FMDatabase?
    
    init(){
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func save(todo : String, toDoTitle:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO tododatabase (todo_title,todo_note) VALUES (?,?)", values: [toDoTitle,todo])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func update(todo_id:Int, toDo_title:String, toDo_detail:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE tododatabase SET todo_title = ?, todo_note = ? WHERE todo_id = ?", values: [toDo_title,toDo_detail,todo_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramakelimesi : String){
        db?.open()
        var list = [ToDos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM tododatabase WHERE todo_title like '%\(aramakelimesi)%'", values: nil)
            
            while result.next() {
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_title = result.string(forColumn: "todo_title")!
                let todo_note = result.string(forColumn: "todo_note")!
                
                let todo = ToDos(toDo_id: todo_id, toDo_title: todo_title, toDo_note: todo_note)
                list.append(todo)
            }
            
            todoList.onNext(list)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func sil(todo_id:Int){
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM tododatabase WHERE todo_id = ?", values: [todo_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func writeToDos() {
        
        db?.open()
        var toDos = [ToDos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM tododatabase", values: nil)
            while result.next() {
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_title = result.string(forColumn: "todo_title")!
                let todo_note = result.string(forColumn: "todo_note")!
                
                let todo = ToDos(toDo_id: todo_id, toDo_title: todo_title, toDo_note: todo_note)
                toDos.append(todo)
            }
            
            todoList.onNext(toDos)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
