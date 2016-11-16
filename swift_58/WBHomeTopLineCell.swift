//
//  WBHomeTopLineCell.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/16.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit
let WBHomeTopLineCellID = "WBHomeTopLineCell"
class WBHomeTopLineCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame.size = CGSize(width:40,height:40)
        
    }

}
