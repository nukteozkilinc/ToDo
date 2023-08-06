//
//  SaveToDo.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 2.08.2023.
//

import UIKit

class SaveToDo: UIViewController {
    @IBOutlet weak var tvToDo: UITextView!
    @IBOutlet weak var tfTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func pressedSave(_ sender: UIButton) {
        if let toDoText = tvToDo.text, let toDoTitle = tfTitle.text{
            save(todo: toDoText, toDoTitle: toDoTitle)
        }
    }
    
    func save(todo : String, toDoTitle:String){
        print("To Do : \(toDoTitle) - \(todo)")
    }
}
