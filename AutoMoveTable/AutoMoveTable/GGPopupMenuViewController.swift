//
//  GGPopupMenuViewController.swift
//  AutoMoveTable
//
//  Created by ggc on 2/27/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit

class GGPopupMenuViewController: UIViewController {
    
    var actionTapToClose:(()->Void)?
    
    @IBAction func onTapClose(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.actionTapToClose?()
    }
        
    func setNewFrame(originNew:CGPoint = CGPointZero, sizeNew:CGSize = CGSizeZero) {
        self.originNew = originNew
        self.sizeNew = sizeNew
    }
    
    private var originNew:CGPoint?, sizeNew:CGSize?
    
    
    private func initFrame() {
        if sizeNew == CGSizeZero {
            sizeNew = self.view.frame.size
        }
        self.view.frame = CGRect(origin: originNew!, size: sizeNew!)
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
//        self.initFrame()
    }
    
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(netHex: 0x2E2E2E, alpha: 0.5)
    }

}
