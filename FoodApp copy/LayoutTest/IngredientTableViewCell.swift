//
//  IngredientTableViewCell.swift
//  LayoutTest
//
//  Created by Abby Breitfeld on 6/19/17.
//  Copyright © 2017 Princeton University. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var exp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
