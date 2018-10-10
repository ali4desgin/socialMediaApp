//
//  ProfileHeaderCollectionViewCell.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
import ChameleonFramework


class ProfileHeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var coverOverlay: UIView!
    @IBOutlet weak var followOrEditProfileButton: UIButton!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var accountname: UILabel!
    @IBOutlet weak var website: UILabel!
    
    @IBOutlet weak var bio: UILabel!
    
    @IBOutlet weak var postsCount: UILabel!
    
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    var viewDelagte:ProfileViewController!
    
    
    
    @IBOutlet weak var gridViewButton: UIButton!
    @IBOutlet weak var rowsViewButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        
        coverOverlay.backgroundColor =  UIColor(gradientStyle:UIGradientStyle.topToBottom, withFrame:CGRect(x: 10, y: 300, width: coverOverlay.bounds.width, height: coverOverlay.bounds.height), andColors:[UIColor.clear, UIColor.white])
        
        followOrEditProfileButton.layer.cornerRadius = 5
        followOrEditProfileButton.layer.masksToBounds = true
        
        gridViewButton.addBottomBorder(UIColor.darkGray, height: 1.0)
        gridViewButton.setImage(#imageLiteral(resourceName: "ic_apps_36pt").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        gridViewButton.tintColor = UIColor.darkGray
        rowsViewButton.setImage(#imageLiteral(resourceName: "ic_dehaze_36pt").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        rowsViewButton.tintColor = UIColor.gray
        
        
        followOrEditProfileButton.setImage(#imageLiteral(resourceName: "ic_message_18pt").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        followOrEditProfileButton.setTitle("Chat", for: UIControlState.normal)
        followOrEditProfileButton.backgroundColor = UIColor(hexString: "#5fba7d")
        followOrEditProfileButton.tintColor = UIColor.white
        followOrEditProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    }
    
 
    @IBAction func TestApp(_ sender: Any) {
        print("some")
    }
    
    
    @IBAction func rowsBtnClicked(_ sender: Any, forEvent event: UIEvent) {
        
        
        print("yhtutut")
    }
    
    
    
}

