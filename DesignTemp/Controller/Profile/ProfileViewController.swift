//
//  ProfileViewController.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
import Alamofire
import ChameleonFramework


class ProfileViewController:UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    let loadinProgress = LoadingProgress()
    var page_refresher:UIRefreshControl!
    @IBOutlet weak var collection: UICollectionView!
    var userID:String!
    var user:UserCell!
    var user_posts:[ProfilePostCell] = []
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        setupRefresher()
//        loadinProgress.showOnWindow()
        navigationDetails()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationDetails()
         loadData()
    }
    func navigationDetails()  {
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_more_vert_36pt"), style: UIBarButtonItemStyle.plain, target: self    , action: #selector(rightBarButtonOptions))
    }
    
    
    
    func updateTitle()  {
        if user != nil {
            navigationItem.title = user.account_name
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if user_posts.count > 0 {
            return user_posts.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProfilePostCollectionViewCell
        
        cell.postImage.dowloadFromUrl(url: user_posts[indexPath.row].post_image)
        cell.postTitle.text = user_posts[indexPath.row].post_title
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 - 1 , height: collectionView.frame.width / 2.2 - 1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderCell", for: indexPath) as! ProfileHeaderCollectionViewCell
        header.viewDelagte = self
        
        if user != nil  {
            header.profileImage.dowloadFromUrl(url: user.user_profile)
            header.coverImage.dowloadFromUrl(url: user.user_cover)
            header.accountname.text = user.account_name
            header.bio.text = user.user_bio
            header.website.text = user.user_website
            header.postsCount.text = getCount(number:user.posts)
            header.followersCount.text = getCount(number:user.followers)
            header.followingCount.text = getCount(number:user.following)
        }
        
        
        
        // puts target
        header.followOrEditProfileButton.action = {
            print("yeah we catch it!")
        }

        
        header.gridViewButton.action = {
            print("yeah we catch it!")
        }
        
        return header
    }
    
    
    func getCount(number:String) -> String {
        
        let counInt = Int(number)
        if counInt! > 1000000000000 {
            
            let mnumber = Int(counInt!/1000000000000)
            return String("\(mnumber)T")
            
        }else
        if counInt! > 1000000000 {
            
            let mnumber = Int(counInt!/1000000000)
            return String("\(mnumber)B")
            
        }else
        if counInt! > 1000000 {
            
            let mnumber = Int(counInt!/1000000)
            return String("\(mnumber)M")
            
        }else
        if counInt! > 1000 {
            
            let knumber = Int(counInt!/1000)
            return String("\(knumber)K")
            
        }
        
        
        return number
        
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostViewControllerID") as! PostViewController
        vc.postID = "\(indexPath.row)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    @objc func rightBarButtonOptions(){
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        actionSheet.addAction(UIAlertAction(title: "Favorate", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Report", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Block", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = self.view
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    
    
    
    @objc fileprivate func loadData(){
        
        Alamofire.request(baseURL + "users/"+userID+".json", method: HTTPMethod.get ).responseJSON { (response) in
            
            if response.error != nil {
                print(response.error)
            }else{
                
                do {
                    
                    let json = try JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    self.user = json.user
                    if  let posts = json.user.posts_list  {
                        self.user_posts = posts
                    }
                    print(json.user.posts_list)
                    self.collection.reloadData()
                    self.updateTitle()
                    self.page_refresher.endRefreshing()
//                    self.loadinProgress.hideLoadingHubFromKeyWindow()

                }catch{
                    print("error in convert response to json")
                }
                
            }
        }
        
    }
  
    func setupRefresher()
    {
        self.page_refresher = UIRefreshControl()
        //        self.page_refresher.tintColor =
        self.page_refresher.addTarget(self, action: #selector(loadData), for:   .valueChanged)
        self.collection.addSubview(page_refresher)
        // self.collection.addSubview(refresher)
        
    }
    
    
    
    
    
    
}
