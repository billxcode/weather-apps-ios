//
//  ContactTableViewCell.swift
//  TableViewHandsOn
//
//  Created by Bill Tanthowi Jauhari on 04/07/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
