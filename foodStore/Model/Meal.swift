//
//  Meal.swift
//  foodStore
//
//  Created by Estudiante on 12/15/18.
//  Copyright © 2018 ucb. All rights reserved.
//

import Foundation

import UIKit

class Meal{
    
    var name: String
    var photo:UIImage?
    var rating: Int
    
    
    init?(name:String, photo:UIImage?, rating: Int){
        //Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0{
            return nil
        }
        
    }
}
