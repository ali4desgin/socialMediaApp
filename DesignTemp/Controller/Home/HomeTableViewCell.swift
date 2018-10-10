//
//  HomeTableViewCell.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var accountName: UIButton!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var postContent: UITextView!
    var userID:String!
    var rowid:String!
    var viewDelagte:HomeViewController!
    
    // buttons
    @IBOutlet weak var replyBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var friendBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var buttomStack: UIStackView!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.shadowColor = UIColor.black.cgColor
        profileImage.layer.shadowRadius = 100
        
        buttomStack.addBottomBorder(UIColor.lightGray, height: 1.0)
        buttomStack.addTopBorder(lightColor, height: 1.0)
        
      
    }
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backgroundColor = UIColor.white
        // Configure the view for the selected state
    }
    
    
    
    
    @IBAction func replyClicked(_ sender: Any) {
        let vc = viewDelagte.storyboard?.instantiateViewController(withIdentifier: "PostViewControllerID") as! PostViewController
        vc.postID = rowid
        viewDelagte.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func favClicked(_ sender: Any) {
        favBtn.setImage(#imageLiteral(resourceName: "ic_favorite_18pt"), for: UIControlState.normal)
    }
    
    
    
    
    @IBAction func friendClicked(_ sender: Any) {
        friendBtn.isHidden = true
        friendBtn.isEnabled = false

    }
    

    @IBAction func shareClicked(_ sender: Any) {
        ShowShareOptionPicker()
    }
    
    
    
    
    func ShowShareOptionPicker(){
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
    
            
        actionSheet.addAction(UIAlertAction(title: "Facebook", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Instagram", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "WhatApp", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = viewDelagte.view
        
        viewDelagte.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    @IBAction func AccountNameClicked(_ sender: Any) {
        let vc = viewDelagte.storyboard?.instantiateViewController(withIdentifier: "ProfileViewControllerID") as! ProfileViewController
        vc.userID = userID
        viewDelagte.navigationController?.pushViewController(vc, animated: true)
    }
    
}
