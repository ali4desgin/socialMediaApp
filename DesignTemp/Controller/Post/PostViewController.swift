//
//  PostViewController.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
import ChameleonFramework

class PostViewController: UIViewController {
    var postID:String!
    
    @IBOutlet weak var contactBtn: UIButton!
    @IBOutlet weak var shadowView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(postID)
        pustDataInNavigationBar()
        setupSubViews()
        shadowView.backgroundColor =  UIColor(gradientStyle:UIGradientStyle.topToBottom, withFrame:CGRect(x: 10, y: 300, width: shadowView.bounds.width, height: shadowView.bounds.height), andColors:[UIColor.clear, UIColor.white])
    }
    
    
    
    fileprivate func setupSubViews(){
        contactBtn.layer.cornerRadius = contactBtn.frame.height  / 8
        contactBtn.layer.masksToBounds = true
        contactBtn.layer.shadowColor = UIColor.black.cgColor
        contactBtn.layer.shadowOpacity = 1
        contactBtn.layer.shadowOffset = CGSize(width: contactBtn.frame.width, height: 200)
        contactBtn.layer.shadowRadius = 10
    }
    fileprivate func pustDataInNavigationBar(){
        
        self.navigationItem.title = postID
    }
    
}
