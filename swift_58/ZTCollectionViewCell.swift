//
//  ZTCollectionViewCell.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/17.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit
let ZTCollectionViewCellID = "ZTCollectionViewCell"
class ZTCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView
    
    override init(frame: CGRect) {
        imageView = UIImageView.init();
        super.init(frame: frame)
        self.contentView.addSubview(imageView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = self.bounds
    }
    
    
    lazy var titleLabel: UILabel = {
        return UILabel.init()
    }()
    
    
}
