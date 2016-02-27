//
//  GGUtils.swift
//  AutoMoveTable
//
//  Created by ggc on 2/27/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit


func delayBySecond(sec:Double, callback:(()->Void)){
    let delay = sec * Double(NSEC_PER_SEC)
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
    dispatch_after(time, dispatch_get_main_queue()) {
        callback()
    }
}