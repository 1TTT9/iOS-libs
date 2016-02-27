//
//  ViewController.swift
//  AutoMoveTable
//
//  Created by ggc on 2/25/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit

class GGAutoMoveTable: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var tb0: UITableView!
    @IBOutlet weak var tb1: UITableView!
    @IBOutlet weak var tb2: UITableView!


    var tables:[UITableView] = [UITableView]()
    var numOfItems:[Int] = [5,4,3]
    var timers:[GGTimer] = [GGTimer]()
    var eclipseTimes:[Double] = [2, 1.5, 3.3]
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        let cellXib = UINib(nibName: "GGCellAutoMoveTable", bundle: nil)
//        tb0.registerNib(cellXib, forCellReuseIdentifier: "ggCellAutoMoveTable")
//        tb1.registerNib(cellXib, forCellReuseIdentifier: "ggCellAutoMoveTable")

        tables.append(tb0)
        tables.append(tb1)
        tables.append(tb2)
        for (var i=0;i<tables.count;i++) {
            
            let tbl = tables[i]
            tbl.registerNib(cellXib, forCellReuseIdentifier: "ggCellAutoMoveTable")
            timers.append(GGTimer())
            if i == 0 {
                let j = i
                timers[j].setUp(eclipseTimes[j], isRepeated: true, callback: { () -> Void in
                    self.numOfItems[j] -= 1
                    self.tables[j].deleteRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
                    self.numOfItems[j] += 1
                    self.tables[j].insertRowsAtIndexPaths([NSIndexPath(forRow: self.numOfItems[j]-1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
                })
            } else if i == 1 {
                let j = i
                timers[j].setUp(eclipseTimes[j], isRepeated: true, callback: { () -> Void in
                    self.numOfItems[j] -= 1
                    self.tables[j].deleteRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
                    self.numOfItems[j] += 1
                    self.tables[j].insertRowsAtIndexPaths([NSIndexPath(forRow: self.numOfItems[j]-1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
                })
            } else if i == 2 {
                let j = i
                timers[j].setUp(eclipseTimes[j], isRepeated: true, callback: { () -> Void in
                    self.numOfItems[j] -= 1
                    self.tables[j].deleteRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
                    self.numOfItems[j] += 1
                    self.tables[j].insertRowsAtIndexPaths([NSIndexPath(forRow: self.numOfItems[j]-1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
                })
            }
            timers[i].run()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTableAuto(timer:NSTimer) {
        print("can you see me?")
    }
    
    
    func popupMenu(callback:(()->Void)?) {
        //pop-over menu
        let menuVC:GGPopupMenuViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GGPopupMenuViewController") as! GGPopupMenuViewController
        menuVC.modalPresentationStyle = .OverCurrentContext
        menuVC.modalTransitionStyle = .CrossDissolve
        menuVC.transitioningDelegate = self
        menuVC.actionTapToClose = callback
        self.presentViewController(menuVC, animated: true, completion: nil)
    }
}



extension GGAutoMoveTable: UITableViewDataSource {
    
    func getRandomColor(alpha:CGFloat = 1.0) -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48()),
        randomGreen:CGFloat = CGFloat(drand48()),
        randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: alpha)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let tag = tableView.tag
        return self.numOfItems[tag]
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier:String = "ggCellAutoMoveTable"
        let cell:GGCellAutoMoveTable = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GGCellAutoMoveTable
    
        let tag = tableView.tag, ggtimer = timers[tag]
        cell.bgView.backgroundColor = getRandomColor()
        cell.selectionStyle = .None
        return cell
    }
}

extension GGAutoMoveTable: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tag = tableView.tag, heightOfView:CGFloat = CGRectGetHeight(self.view.frame)
        let height:CGFloat = heightOfView/CGFloat(self.numOfItems[tag])
        return height
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tag = tableView.tag, ggtimer = timers[tag]
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! GGCellAutoMoveTable
        ggtimer.stop()
        cell.alpha = 0.3
        self.popupMenu({()->Void in
            ggtimer.run()
            cell.alpha = 1.0
        })
    }
}