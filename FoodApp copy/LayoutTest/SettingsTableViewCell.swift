//
//  SettingsTableViewCell.swift
//  LayoutTest
//
//  Created by CS User on 6/20/17.
//  Copyright © 2017 Princeton University. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var setting: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    //MARK: Actions
    
    @IBAction func switched(_ sender: UISwitch) {
        // Figure out which switch it is
        // Call the correct method based on this
        sender.isOn ? print("ON") : print("OFF")
        
        guard let cell = sender.superview?.superview as? SettingsTableViewCell else {
            fatalError("Could not instantiate cell")
        }
        
        print(cell.setting.text!)
    }
    
}
