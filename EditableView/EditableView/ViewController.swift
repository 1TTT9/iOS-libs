//
//  ViewController.swift
//  EditableView
//
//  Created by ggc on 2/6/16.
//  Copyright © 2016 ggc. All rights reserved.
//

/*
   REF: http://codentrick.com/create-a-tag-flow-layout-with-uicollectionview/
*/

import UIKit

class ViewController: UIViewController {

    var TAGS = ["Tech", "Design", "Humor", "Travel", "Music", "Writing", "Social Media", "Life", "Education", "Edtech", "Education Reform", "Photography", "Startup", "Poetry", "Women In Tech", "Female Founders", "Business", "Fiction", "Love", "Food", "Sports"]
    
    
    let PLACEHOLDER = ""
    var sizingCell:EditableViewCollectionViewCell?
    

    @IBOutlet weak var inputTagView: UITextView!
    @IBOutlet weak var collectView: UICollectionView!
    @IBOutlet weak var flowLayout: EditableTagViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNIB = UINib(nibName: "EditableViewCollectionViewCell", bundle: nil)
        
        self.collectView.registerNib(cellNIB, forCellWithReuseIdentifier: "tagCell")
        
        self.collectView.backgroundColor = UIColor.lightGrayColor()
        
        self.flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                
        sizingCell = (cellNIB.instantiateWithOwner(nil, options: nil) as! NSArray).firstObject as! EditableViewCollectionViewCell
        
        self.inputTagView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.TAGS.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("tagCell", forIndexPath: indexPath)
        
        self.configureCell(cell as! EditableViewCollectionViewCell, forIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: EditableViewCollectionViewCell, forIndexPath index:NSIndexPath) {
    
        cell.nameLabel.text = self.TAGS[index.row]
        
        cell.actionToRemove = { (xIndex) -> Void in
            self.TAGS.removeAtIndex((self.collectView.indexPathForCell(cell)?.row)!)
            self.collectView.deleteItemsAtIndexPaths([self.collectView.indexPathForCell(cell)!])
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        self.sizingCell!.nameLabel.text = self.TAGS[indexPath.row]
        return self.sizingCell!.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(textView: UITextView) {
        
        if textView.text.characters.count > 0 {
            if textView.text.characters.last == "\n" {
                let textToAppend = textView.text.substringToIndex(textView.text.startIndex.advancedBy(textView.text.characters.count-1))
                self.TAGS.append(textToAppend)
                self.collectView.insertItemsAtIndexPaths([NSIndexPath(forItem: self.TAGS.count-1, inSection: 0)])
                textView.text = PLACEHOLDER
            }
        } else {
            textView.text = PLACEHOLDER
        }
    }    
}

