//
//  WBMenuBtnView.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/14.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

class WBMenuBtnView: UIView {
 
    let titleLabel = UILabel.init()
    let imageView = UIImageView.init()
    let imageHeight = 46
    
    func initWithTitleAndImage(title:String,imageStr:String) -> UIView{
        titleLabel.text? = title
        imageView.image = UIImage.init(named: imageStr)
        self.addSubview(titleLabel)
        self.addSubview(imageView)
        return self
    }
    
    func sayHello(personName: String) -> String {
        return "Hello again, " + personName + "!"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame.size = CGSize(width: imageHeight, height: imageHeight)
        imageView.center = CGPoint(x:self.frame.width/2,y:self.frame.height/2)
        
    }
    
}
