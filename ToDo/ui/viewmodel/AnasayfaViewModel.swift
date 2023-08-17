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
        uploadData()
        toDoList = trepo.todoList
    }
    
    func ara(aramakelimesi : String){
        trepo.ara(aramakelimesi: aramakelimesi)
    }
    
    func sil(todo_id:Int){
        trepo.sil(todo_id: todo_id)
        writeToDos()
    }
    
    func writeToDos() {
        trepo.writeToDos()
    }
    
    func uploadData()  {
        let bundleYolu = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("todo.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path()){
            print("Database already occurs.")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
