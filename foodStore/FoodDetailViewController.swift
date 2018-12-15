//
//  FoodDetailViewController.swift
//  foodStore
//
//  Created by Estudiante on 12/13/18.
//  Copyright © 2018 ucb. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal:Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Aplication Loadded")
        
        nameTextField.delegate = self
        if let meal = meal{
            self.navigationItem.title = meal.name
            self.nameTextField.text = meal.name
            self.photoImageView.image = meal.photo
            self.ratingControl.rating = meal.rating
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        print("tap reconized")
    }
    
    @IBAction func test001(_ sender: UIPinchGestureRecognizer) {
        print("tap reconized 123")
    }
    
    @IBAction func test2(_ sender: UITapGestureRecognizer) {
    print("test!!!!")
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController,animated: true,completion: nil)

    }
    
    
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let selectedimage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedimage
        dismiss(animated:true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for:segue, sender:sender)
        if let button = sender as? UIBarButtonItem, button === saveButton{
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let raiting = ratingControl.rating
            meal = Meal(name: name, photo: photo, rating: raiting)
            print("Send new meal")
        }else{
            print("cancel button pressed")
        }
    }
    
    
}
