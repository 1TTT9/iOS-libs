//
//  GGCellAutoMoveTable.swift
//  AutoMoveTable
//
//  Created by ggc on 2/25/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit

class GGCellAutoMoveTable: UITableViewCell {


    @IBOutlet weak var bgView: UIView!

    
    var bgViewColor:UIColor = UIColor.lightGrayColor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


