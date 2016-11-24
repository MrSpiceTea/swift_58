//
//  WBHouseCell.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/24.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

let WBHouseCellID = "WBHouseCell"


class WBHouseCell: UITableViewCell {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.separatorInset = UIEdgeInsets(top:0,left:15,bottom:0,right:0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x:200,y:0,width:50,height:50)
        
        
    }

}
