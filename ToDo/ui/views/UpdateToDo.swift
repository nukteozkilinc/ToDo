//
//  UpdateToDo.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 2.08.2023.
//

import UIKit

class UpdateToDo: UIViewController {

    @IBOutlet weak var tvDetail: UITextView!
    @IBOutlet weak var tfDetailTitle: UITextField!
    
    var toDos : ToDos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = toDos{
            tfDetailTitle.text = todo.title
            tvDetail.text = todo.note
        }
    }
    
    @IBAction func pressedUpdate(_ sender: Any) {
        if let todo_title = tfDetailTitle.text, let todo_detail = tvDetail.text, let todo = toDos{
            update(todo_id: todo.id!, toDo_title: todo_title, toDo_detail: todo_detail)
        }
    }
    
    func update(todo_id:Int, toDo_title:String, toDo_detail:String){
        print("Update To Do : \(todo_id) - \(toDo_title) - \(toDo_detail)")
    }
}
