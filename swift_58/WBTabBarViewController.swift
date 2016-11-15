//
//  WBTabBarViewController.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/11.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

class WBTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initViewController() {
        addViewController(vc: WBHomeViewController(), title: "首页", defaultImage: "home-default", highlightImage: "home-highlight")
        addViewControllerWithNav(vc: WBNegotiationViewController(), title: "发现", defaultImage: "negotiation-default", highlightImage: "negotiation-highlight")
    }
    
    private func addViewController(vc:UIViewController,title:String,defaultImage:String,highlightImage:String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named:defaultImage)
        vc.tabBarItem.selectedImage = UIImage(named:highlightImage)?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(vc)
    }

    private func addViewControllerWithNav(vc:UIViewController,title:String,defaultImage:String,highlightImage:String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named:defaultImage)
        vc.tabBarItem.selectedImage = UIImage(named:highlightImage)?.withRenderingMode(.alwaysOriginal)
        let navVC = WBNaviationViewController.init(rootViewController: vc)
        self.addChildViewController(navVC)
    }

}
