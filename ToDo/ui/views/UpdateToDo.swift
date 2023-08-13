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
    
    var viewmodel = UpdateToDoViewModel()
    var toDos : ToDos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = toDos{
            tfDetailTitle.text = todo.title
            tvDetail.text = todo.note
        }
    }
    
    @IBAction func pressedUpdate(_ sender: Any) {
        
        let alert = UIAlertController(title: "Update", message: "Are you sure?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        let okeyAction = UIAlertAction(title: "Okey", style: .destructive){_ in
            if let todo_title = self.tfDetailTitle.text, let todo_detail = self.tvDetail.text, let todo = self.toDos{
                self.viewmodel.update(todo_id: todo.id!, toDo_title: todo_title, toDo_detail: todo_detail)
            }
        }
        alert.addAction(okeyAction)
        self.present(alert, animated: true)
        
    }
}
