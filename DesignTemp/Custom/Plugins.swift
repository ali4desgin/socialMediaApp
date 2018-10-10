//
//  Extension.swift
//  Anty
//
//  Created by promatics on 5/22/17.
//  Copyright © 2017 Promatics. All rights reserved.
//

import Foundation
import UIKit

func UIColorFrom
    (rgbValue: UInt) -> UIColor {
    
    return UIColor(
        
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        
        alpha: CGFloat(1.0)
        
    )
}



func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    
    let size = image.size
    
    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        
    } else {
        
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}
extension UILabel
{
    var optimalWidth : CGFloat
    {
        get
        {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width:  CGFloat.greatestFiniteMagnitude, height:  self.frame.height))
            label.numberOfLines = 0
            label.lineBreakMode = self.lineBreakMode
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            
            return label.frame.width
        }
    }
    
    var optimalHieght : CGFloat
    {
        get
        {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width , height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = self.lineBreakMode
            label.font = self.font
            label.text = self.text
            
            label.sizeToFit()
            
            return label.frame.height
        }
    }
    
}

extension UIView {
    func cardView(cornerRadius: CGFloat = 1, shadowOffsetWidth: Int = 0, shadowOffsetHeight: Int = 1,shadowOpacity:Float = 0.5){
        
        
        //  let cornerRadius: CGFloat = 1
        
        //        let shadowOffsetWidth: Int = 0
        //        let shadowOffsetHeight: Int = 3
        let shadowColor: UIColor? = UIColor.black
        // let shadowOpacity: Float = 0.8
        
        self.layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor?.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowPath = shadowPath.cgPath
        
    }
    
}


/*extension UILabel {
 
 func getUnderlineText() -> NSMutableAttributedString{
 
 let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self.text!)
 
 attributeString.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
 
 return attributeString
 
 }
 
 }*/

extension UIView{
    
    var width:      CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            self.frame.size.width = newValue
        }
    }
    
    var height:     CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            self.frame.size.height = newValue
        }
    }
    
    var size:       CGSize  {
        get{
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    var origin:     CGPoint {
        get{
            return self.frame.origin
        }
        set{
            self.frame.origin = newValue
        }
    }
    
    var x:          CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            
            self.frame.origin = CGPoint(x: newValue, y: self.frame.origin.y)
            
        }
    }
    
    var y:   CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin = CGPoint(x: self.frame.origin.x, y: newValue)
        }
    }
    
    var centerX:    CGFloat {
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY:    CGFloat {
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    var minX:       CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
    }
    
    var maxX:      CGFloat {
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set{
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    
    var minY:        CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
    }
    
    var maxY:     CGFloat {
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    convenience init(
        frame_:CGRect = CGRect.zero,
        backgroundColor:UIColor = UIColor.clear
        ){
        self.init(frame:frame_)
        self.backgroundColor=backgroundColor
    }
    
    func allShadow(Outlet : AnyObject) {
        
        Outlet.layer.masksToBounds = false
        
        Outlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        Outlet.layer.shadowRadius = 2
        
        Outlet.layer.shadowOpacity = 0.5
        
        Outlet.layer.shadowColor = UIColor.gray.cgColor
        
    }
}


extension UIView {
    
    func addTopBorder(_ color: UIColor, height: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        border.addConstraint(NSLayoutConstraint(item: border,
                                                attribute: NSLayoutAttribute.height,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: nil,
                                                attribute: NSLayoutAttribute.height,
                                                multiplier: 1, constant: height))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.top,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.top,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.leading,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.leading,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.trailing,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.trailing,
                                              multiplier: 1, constant: 0))
    }
    
    func addBottomBorder(_ color: UIColor, height: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        border.addConstraint(NSLayoutConstraint(item: border,
                                                attribute: NSLayoutAttribute.height,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: nil,
                                                attribute: NSLayoutAttribute.height,
                                                multiplier: 1, constant: height))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.bottom,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.bottom,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.leading,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.leading,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.trailing,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.trailing,
                                              multiplier: 1, constant: 0))
    }
    func addLeftBorder(_ color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        border.addConstraint(NSLayoutConstraint(item: border,
                                                attribute: NSLayoutAttribute.width,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: nil,
                                                attribute: NSLayoutAttribute.width,
                                                multiplier: 1, constant: width))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.leading,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.leading,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.bottom,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.bottom,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.top,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.top,
                                              multiplier: 1, constant: 0))
    }
    func addRightBorder(_ color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        border.addConstraint(NSLayoutConstraint(item: border,
                                                attribute: NSLayoutAttribute.width,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: nil,
                                                attribute: NSLayoutAttribute.width,
                                                multiplier: 1, constant: width))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.trailing,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.trailing,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.bottom,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.bottom,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: NSLayoutAttribute.top,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.top,
                                              multiplier: 1, constant: 0))
    }
}




extension UIButton{
    
    func ButtonCornerRadius() {
        
        self.layer.cornerRadius = 5
        
        self.layer.borderWidth = 1
        
        self.layer.borderColor = blueColor.cgColor
        
    }
}

extension String{
    
    func localized() -> String{
        
        let path = Bundle.main.path(forResource: UserDefaults.standard.bool(forKey: "Arabic") ? "ar" : "en", ofType: "lproj")
        
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "") } }

