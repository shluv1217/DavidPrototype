//
//  TableViewController.swift
//  DavidPrototype
//
//  Created by David Shin on 2020/09/23.
//  Copyright © 2020 David Shin. All rights reserved.
//

import UIKit
//import Firebase
import CoreData

class CategoryViewController: UITableViewController{
    
    var itemArray = ["item1","item2","item3"]
    var categories = [Category]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCategories()
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.rowHeight = 80.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text = itemArray[indexPath.row]
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
//        let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//            navigationController?.popToRootViewController(animated: true)
//        } catch let signOutError as NSError {
//            print ("Error signing out: %@", signOutError)
//        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    //MARK: - Adding New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var vartextField = UITextField()
        
        
        let alert = UIAlertController(title: "New Items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            print("Success!")
            let newCategory = Category(context: self.context)
            newCategory.name = vartextField.text
            self.saveCategories()
        }
        
        
        alert.addAction(action)
        alert.addTextField { (textField) in
            textField.placeholder = "Create new category"
            vartextField = textField
        }
        
        
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Data Manipulation
    //Fetching Data
    func fetchCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){
        do{
            categories = try context.fetch(request)
        }catch{
            print("Loading Request Error\(error)")
        }
        //Reload tableview
        tableView.reloadData()
        
    }
    
    
    //Save Data
    func saveCategories(){
        //Save categories via context
        do{
            try context.save()
        }catch{
            print("Error saving data\(error)")
        }
        //Reload tableview
        tableView.reloadData()
    }
    
    
}
