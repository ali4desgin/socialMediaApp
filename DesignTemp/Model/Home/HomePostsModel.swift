//
//  HomePostsModel.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit


struct HomePostsModel:Decodable {
    var status:Int!
    var message:String!
    var data:[HomePostCell]!
    
}

struct HomePostCell:Decodable {
    var post_id:String!
    var user_id:String!
    var account_name:String!
    var user_name:String!
    var post_time:String!
    var user_profile:String!
    var post_content:String!

}
