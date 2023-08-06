//
//  ToDoCell.swift
//  ToDo
//
//  Created by Nukte Ozkilinc on 6.08.2023.
//

import UIKit

class ToDoCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
