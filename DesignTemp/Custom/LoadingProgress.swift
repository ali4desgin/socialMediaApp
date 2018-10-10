//
//  LoadingProgress.swift
//  Store
//
//  Created by MAC on 7/31/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
import RSLoadingView

class LoadingProgress {
    
    
    
    func showLoadingHub(view:UIView) {
        let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.show(on: view)
    }
    
    func showOnViewTwins(view:UIView) {
        let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.show(on: view)
    }
    
    func hideLoadingHub(view:UIView) {
        RSLoadingView.hide(from: view)
    }
    
    func showOnWindow() {
        let loadingView = RSLoadingView()
        loadingView.showOnKeyWindow()
    }
    
    func hideLoadingHubFromKeyWindow() {
        RSLoadingView.hideFromKeyWindow()
    }
}


