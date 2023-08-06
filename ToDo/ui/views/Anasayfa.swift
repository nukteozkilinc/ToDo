//
//  ViewController.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 2.08.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var toDos = [ToDos]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        self.toDoTableView.backgroundColor = UIColor.clear
       
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let toDos = sender as? ToDos{
                let vc = segue.destination as! UpdateToDo
                vc.toDos = toDos
            }
        }
    }
}

extension Anasayfa : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Notlar ara : \(searchText)")
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoCell
        cell.titleLabel.text = toDo.title
        cell.todoLabel.text = toDo.note
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDos[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){_,_,_ in
            let todo = self.toDos[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let okeyAction = UIAlertAction(title: "Okey", style: .destructive){
                action in
                print("ToDo Sil: \(todo.id!)")
            }
            alert.addAction(okeyAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
