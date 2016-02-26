//
//  GGTimer.swift
//  AutoMoveTable
//
//  Created by ggc on 2/26/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit


class GGTimer:NSObject {
    
    /**
     about timer 
        http://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861
        http://stackoverflow.com/questions/24415662/object-x-of-class-y-does-not-implement-methodsignatureforselector-in-swift
     

    **/
    private var isPaused:Bool = false
    private var timer:NSTimer = NSTimer()

    
    override init() {
        super.init()
    }
    
    func isRunning()->Bool {
        return !self.isPaused
    }
    
    func __actionToCallback() {
        self.actionToCallback?()
    }
    
    private var sec:Double = 1,
    isRepeated:Bool = false,
    actionToCallback:(()->Void)?
    func setUp(sec:Double = 5, isRepeated:Bool = false, callback:(()->Void)?) {
        self.sec = sec
        self.isRepeated = isRepeated
        self.actionToCallback = callback
    }
    
    func run() {
        if !self.isPaused {
            self.timer.invalidate()
        }
        self.isPaused = false
        self.timer = NSTimer.scheduledTimerWithTimeInterval(sec, target: self, selector: "__actionToCallback", userInfo: nil, repeats: isRepeated)
        print("=== timer[\(unsafeAddressOf(self))] started ===")
    }
    
    func stop() {
        self.timer.invalidate()
        self.isPaused = true
        print("=== timer[\(unsafeAddressOf(self))] stopped ===")
    }
}