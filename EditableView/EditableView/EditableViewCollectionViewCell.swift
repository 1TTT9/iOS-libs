//
//  EditableViewCollectionViewCell.swift
//  EditableView
//
//  Created by ggc on 2/6/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit

class EditableViewCollectionViewCell: UICollectionViewCell {

    var indexOfTest:NSIndexPath?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameLabelMaxWidthConstraint: NSLayoutConstraint!

    @IBAction func onTapRemoveCell(sender: UIButton) {
        self.actionToRemove?(xIndex: self.indexOfTest!)
    }

    var actionToRemove:((xIndex:NSIndexPath)->Void)?
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        self.nameLabel.textColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        self.layer.cornerRadius = 4
        
        self.nameLabelMaxWidthConstraint.constant = UIScreen.mainScreen().bounds.width - 8 * 2 - 8 * 2 - 40
    }
}
