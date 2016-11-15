//
//  WBHomeMenuCell.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/14.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

class WBHomeMenuCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for i in 0...9 {
            let view = WBMenuBtnView.init(title: "二手货", imageStr: "glsale")
            view.tag = i
            if i<5 {
                view.frame = CGRect(x: CGFloat(i)*kScreenWidth/5, y: 0, width: kScreenWidth/5, height: 80)
            }else{
                view.frame = CGRect(x: CGFloat(i-5)*kScreenWidth/5, y: 80, width: kScreenWidth/5, height: 80)
            }
            
            let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(menuViewTapped(_:)))
            view.addGestureRecognizer(tapGesture)
            self.contentView.addSubview(view)
        }
    }
    
    func menuViewTapped(_ sender: UITapGestureRecognizer){
        print(sender.view?.tag ?? 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


