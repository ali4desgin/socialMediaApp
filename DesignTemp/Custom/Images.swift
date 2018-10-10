//
//  Images.swift
//  DesignTemp
//
//  Created by MAC on 10/9/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    
    
    
    func dowloadFromUrl(url:String)  {
        
        let loadingProgress = LoadingProgress()
        loadingProgress.showLoadingHub(view:self)
        if let url = URL(string: url) {
            
            
            Alamofire.request(url).responseData { (response) in
                
                if let data = response.data {
                    self.image = UIImage(data: data)
                    loadingProgress.hideLoadingHub(view: self)
                }else{
                    loadingProgress.hideLoadingHub(view: self)
                }
                
               
            }
            
        }else {
            loadingProgress.hideLoadingHub(view: self)
        }
        
        
       // loadingProgress.hideLoadingHub(view: self)
    }
    
}
