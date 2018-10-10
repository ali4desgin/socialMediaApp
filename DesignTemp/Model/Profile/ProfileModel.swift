//
//  ProfileModel.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
struct ProfileModel:Decodable {
    var status:Int!
    var message:String!
    var user:UserCell!
    

}


struct UserCell:Decodable {
    var user_id:String!
    var account_name:String!
    var user_bio:String!
    var user_website:String!
    var user_name:String!
    var user_profile:String!
    var user_cover:String!
    var followers:String!
    var following:String!
    var posts:String!
    var posts_list:[ProfilePostCell]!
}



struct ProfilePostCell:Decodable {
    var post_id:String!
    var post_image:String!
    var post_title:String!
    
}
