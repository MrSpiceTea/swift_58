//
//  WBGlobal.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/15.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kNavBarHeight:CGFloat = 44

func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
}

func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
     return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: a)
}

func PNG(imageStr:String)->UIImage{
    return UIImage.init(named: imageStr)!
}
