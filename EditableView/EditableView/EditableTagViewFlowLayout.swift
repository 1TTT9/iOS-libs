//
//  EditableTagViewFlowLayout.swift
//  EditableView
//
//  Created by ggc on 2/6/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit

class EditableTagViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        var attributesForElementsInRect = super.layoutAttributesForElementsInRect(rect)
        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()

        var leftMarginDefault:CGFloat = self.sectionInset.left, leftMargin = leftMarginDefault;
        var currentY:CGFloat = 0;
        for attributes in attributesForElementsInRect! {
            var refAttributes = attributes as! UICollectionViewLayoutAttributes
            
            // calculate new value for current margin
            let newY = refAttributes.frame.origin.y
            if currentY == 0 {
                currentY = newY
            }
            
            if currentY != newY {
                currentY = newY
                leftMargin = leftMarginDefault
            }
            
            var newLeftAlignedFrame = refAttributes.frame
            newLeftAlignedFrame.origin.x = leftMargin
            refAttributes.frame = newLeftAlignedFrame
            
            leftMargin += refAttributes.frame.size.width + self.sectionInset.right
            newAttributesForElementsInRect.append(refAttributes)
        }
        return newAttributesForElementsInRect
    }
    
//    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
//        var attributesForElementsInRect = super.layoutAttributesForElementsInRect(rect)
//        var newAttributesForElementsInRect = [AnyObject]()
//        
//        // use a value to keep track of left margin
//        var leftMargin: CGFloat = 0.0;
//        
//        for attributes in attributesForElementsInRect! {
//            var refAttributes = attributes as! UICollectionViewLayoutAttributes
//            // assign value if next row
//            if (refAttributes.frame.origin.x == self.sectionInset.left) {
//                leftMargin = self.sectionInset.left
//            } else {
//                // set x position of attributes to current margin
//                var newLeftAlignedFrame = refAttributes.frame
//                newLeftAlignedFrame.origin.x = leftMargin
//                refAttributes.frame = newLeftAlignedFrame
//            }
//            // calculate new value for current margin
//            leftMargin += refAttributes.frame.size.width
//            newAttributesForElementsInRect.append(refAttributes)
//        }
//        
//        return newAttributesForElementsInRect
//    }
//    
}
