//
//  ViewController.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let loadinProgress = LoadingProgress()
    var page_refresher:UIRefreshControl!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBarBtn: UIBarButtonItem!
    @IBOutlet weak var menuBarBtn: UIBarButtonItem!
    var posts:[HomePostCell] = []

    var isSearching = false
    
    let floatButton:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ic_add_18pt").withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        button.tintColor = UIColor.white
        button.backgroundColor = blueColor
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(floatButton)
        setupAutoLayout()
        loadData()
        setupRefresher()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // loadinProgress.showOnWindow()
        loadData()
    }
    
    fileprivate func setupAutoLayout() {
        floatButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
                floatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
                floatButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                floatButton.widthAnchor.constraint(equalToConstant: 50),
                floatButton.heightAnchor.constraint(equalToConstant: 50),
        ].forEach({$0.isActive=true})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if posts.count > 0  {
            return posts.count
        }
        
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.postContent.text = posts[indexPath.row].post_content
        cell.accountName.setTitle("@"+posts[indexPath.row].account_name, for: UIControlState.normal)
        cell.username.text = posts[indexPath.row].user_name
        
        //2018-08-29 12:05:15
        
        
        loadinProgress.showLoadingHub(view: cell.profileImage)
        Alamofire.request(posts[indexPath.row].user_profile).responseData { (response) in
            cell.profileImage.image = UIImage(data: response.data!)
            self.loadinProgress.hideLoadingHub(view:cell.profileImage)
        }
        
        cell.userID = posts[indexPath.row].user_id
        cell.viewDelagte = self
        cell.rowid = String(indexPath.row)
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
    
    
    @IBAction func searchBarButtonClick(_ sender: Any){
        
        
        if !isSearching {
    
            
            let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30  ))
            searchBar.translatesAutoresizingMaskIntoConstraints  = false
            searchBar.frame.size.height = 30
            searchBar.placeholder = "Search what your want ..."
            searchBar.searchBarStyle = UISearchBarStyle.default
           
            self.navigationController?.navigationBar.barTintColor = UIColor.black
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationItem.titleView = searchBar
        }else{
            self.navigationItem.titleView = nil
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            self.navigationController?.navigationBar.tintColor = UIColor.black
        }
        
        isSearching = !isSearching
        
        
    }
    @objc static func toProfileViewController(){
        
        print("clicked")
    }
    
    @IBAction func menuBarButtonClick(_ sender: Any) {
    }
    

    
    
    
    
    @objc fileprivate func loadData(){
    
        Alamofire.request(baseURL + "home.json", method: HTTPMethod.get ).responseJSON { (response) in
            
            if response.error != nil {
                print(response.error)
            }else{
                
                print(response)
                do {
                    
                    let json = try JSONDecoder().decode(HomePostsModel.self, from: response.data!)
                    self.posts = json.data
                    self.table.reloadData()
                    self.page_refresher.endRefreshing()
                  //  self.loadinProgress.hideLoadingHubFromKeyWindow()
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
        self.table.addSubview(page_refresher)
        // self.collection.addSubview(refresher)
        
    }
    
    

}

