//
//  WBMenuBtnView.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/14.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit
import SnapKit

class WBMenuBtnView: UIView {
 
    let titleLabel = UILabel.init()
    let imageView = UIImageView.init()
    let imageHeight = 40
   
    init(title:String,imageStr:String) {
        super.init(frame: CGRect.zero)
        titleLabel.text = title
        titleLabel.textColor = RGB(r: 51, g: 51, b: 51)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        imageView.image = UIImage.init(named: imageStr)
        self.addSubview(titleLabel)
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: imageHeight, height: imageHeight))
            make.top.equalTo(self.snp.top).offset(15)
            make.centerX.equalTo(self)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalTo(self)
        }
    }
    
}
