//
//  Ingredient.swift
//  LayoutTest
//
//  Created by Abby Breitfeld on 6/19/17.
//  Copyright © 2017 Princeton University. All rights reserved.
//

import UIKit
import os.log

class Ingredient: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var exp: Date
    var selected: Bool
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let exp = "exp"
        static let selected = "selected"
    }
    
    //MARK: Initialization
    
    init?(name: String, exp: Date) {
        // Initialize stored properties.
        self.name = name
        self.exp = exp
        self.selected = false
    }
    
    init?(name: String, exp: Date, selected: Bool) {
        // Initialize stored properties.
        self.name = name
        self.exp = exp
        self.selected = selected
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(exp, forKey: PropertyKey.exp)
        aCoder.encode(selected, forKey: PropertyKey.selected)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let exp = aDecoder.decodeObject(forKey: PropertyKey.exp) as! Date
        let selected = aDecoder.decodeBool(forKey: PropertyKey.selected)
        // Must call designated initializer.
        self.init(name: name, exp: exp, selected: selected)
    }

}
