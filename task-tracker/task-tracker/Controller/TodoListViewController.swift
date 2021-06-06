//
//  ViewController.swift
//  task-tracker
//
//  Created by marchelmon on 2021-06-06.
//

import UIKit

private let cellIdentifier = "TodoItemCell"

class TodoListViewController: UITableViewController {

    var itemArray = ["Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things", "Shopping list", "Work", "Other things"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

    //MARK: - TableViewDelegate
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - Add new items
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
    
        var alertTextField = UITextField()
        
        let alert = UIAlertController(title: "Add task", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            self.itemArray.append(alertTextField.text ?? "")
            self.tableView.reloadData()
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Create new item"
            alertTextField = textField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}



