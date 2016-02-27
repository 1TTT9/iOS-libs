//
//  GGImageView.swift
//  AutoMoveTable
//
//  Created by ggc on 2/27/16.
//  Copyright © 2016 ggc. All rights reserved.
//

import UIKit

@IBDesignable
class GGImageView: UIImageView {

    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func drawRect(rect: CGRect) {
        
        if isCircleNeeded {
            setCircle()
        }
    }
    
    /* custom-control variables */
    @IBInspectable var isCircleNeeded:Bool = false {
        didSet {
            self.setCircle()
        }
    }
    @IBInspectable var circleRadius: CGFloat = 0 {
        didSet {
            if self.isCircleNeeded {
                
                if circleRadius == 0 {
                    circleRadius = CGRectGetWidth(self.frame) / 2
                }
                layer.cornerRadius = circleRadius
                layer.masksToBounds = circleRadius > 0
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    
    /* custom-control logics, called in XB */
    func setCircle() {        
//        let cal = CALayer()
        
        if circleRadius == 0 {
            circleRadius = CGRectGetWidth(self.frame) / 2
        }
        layer.borderColor = UIColor.clearColor().CGColor
        layer.cornerRadius = circleRadius
        layer.masksToBounds = circleRadius > 0

    }
    
    /* custom-control logics, called in classes */
    func load_image(urlString:String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        let params:NSDictionary = NSMutableDictionary()
//        let params = ["username":"username", "password":"password"] as Dictionary<String, String>
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if error == nil {
                self.image = UIImage(data: data!)
            }
        })
        task.resume()
    }

}
