//
//  FoodTableViewController.swift
//  foodStore
//
//  Created by Estudiante on 12/15/18.
//  Copyright © 2018 ucb. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController, UITextFieldDelegate {
    

    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    var meals = [Meal]()

    var meal : Meal?
    
    
    override func viewDidLoad() {
        print("Text!!")
        super.viewDidLoad()
        //let meal1 = Meal(name: "Silpancho", photo: UIImage(named: "silpancho"), rating: 0)!
        //let meal2 = Meal(name: "Pique", photo: UIImage(named: "pique"), rating: 0)!
        //meals += [meal1, meal2]
        
        navigationItem.leftBarButtonItem = editButtonItem
        
       // nameTextField.delegate = self
        if let meal = meal{
            self.navigationItem.title = meal.name
            self.nameTextField.text = meal.name
            self.photoImageView.image = meal.photo
            self.ratingControl.rating = meal.rating
            
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Iterating")
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)as!
        FoodTableViewCell
        
        let meal = meals[indexPath.row]
        cell.foodImage.image = meal.photo
        cell.foodLabel.text = meal.name
        cell.rating.rating = 0

        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToMealList(send: UIStoryboardSegue){
        print("unwip!!!!")
        
        if let sourceViewController = send.source as? FoodDetailViewController, let meal = sourceViewController.meal{
            print("The new meal es --> \(meal.name)")
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
                let newIndexPath = IndexPath(row: meals.count, section:0)
                meals.append(meal)
                print("The meal name is \(meal.name)")
                //
                tableView.insertRows(at:[newIndexPath], with: .automatic)
            }
            
            meals.append(meal)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCellEditingStyle, forRowAt indexPath:IndexPath){
        if editingStyle == .delete{
            meals.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            print("add Item")
            //os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            print("Show Detal")
            
            guard let mealDetailViewController = segue.destination as? FoodDetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? FoodTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedMeal = meals[indexPath.row]
            
            mealDetailViewController.meal = selectedMeal
            
        default:
            print("Default")
            //fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    
    // Cancel Button in ViewCOntroller

    @IBAction func cancelButtonClick(_ sender: Any) {
        print("click!!dismiss")
        dismiss(animated: true, completion: nil)
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    


}
