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
        
        let alert = UIAlertController(title: "Save", message: "Are you sure?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        let okeyAction = UIAlertAction(title: "Okey", style: .destructive){_ in
            if let toDoText = self.tvToDo.text, let toDoTitle = self.tfTitle.text{
                self.save(todo: toDoText, toDoTitle: toDoTitle)
            }
        }
        alert.addAction(okeyAction)
        self.present(alert, animated: true)
        
    }
    
    func save(todo : String, toDoTitle:String){
        print("To Do : \(toDoTitle) - \(todo)")
    }
}
