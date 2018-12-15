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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Aplication Loadded")
        

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
    
    
    
}
