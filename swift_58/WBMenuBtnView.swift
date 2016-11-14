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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
    }
    
    func initWithTitleAndImage(title:String,imageStr:String) {
        titleLabel.text? = title
        imageView.image = UIImage.init(named: imageStr)
        self.addSubview(titleLabel)
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
    
}
