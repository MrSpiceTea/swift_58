//
//  WBHomeViewController.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/11.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

let fcell = "fcell"
let tableOffsetY:CGFloat = 125

class WBHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    let toolMenuImageStrGroup = ["","","",""]
    let toolMenuTitleGroup = ["","","",""]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layoutUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutUI(){
        let tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.contentInset = UIEdgeInsetsMake(tableOffsetY, 0, 0, 0)
        tableView.register(WBHomeTopLineCell.self, forCellReuseIdentifier: WBHomeTopLineCellID)
        tableView.register(WBHomeMenuCell.self, forCellReuseIdentifier: WBHomeMenuCellID)
        tableView.register(WBHouseCell.self, forCellReuseIdentifier: WBHouseCellID)
        tableView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        self.tableView = tableView
        self.view.addSubview(tableView)
        self.view.addSubview(self.homeHeadView)
    }
    
    // MARK: TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }else if section == 1{
            return 20
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0{
                return 175
            }else{
                return 70
            }
        }else if indexPath.section == 1{
            if indexPath.row == 1{
                return 200
            }
        }
        return 80
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section > 0{
            return 5;
        }
        return CGFloat.leastNormalMagnitude;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let tableCell = tableView.dequeueReusableCell(withIdentifier: WBHomeMenuCellID)
                tableCell?.selectionStyle = .none
                return tableCell!
            }else if indexPath.row == 1{
                let tableCell = tableView.dequeueReusableCell(withIdentifier: WBHomeTopLineCellID)
                tableCell?.imageView?.image = PNG(imageStr: "gleducation")
                tableCell?.textLabel?.text = "test"
                tableCell?.selectionStyle = .none
                return tableCell!
            }else if indexPath.row == 2{
                var tableCell = tableView.dequeueReusableCell(withIdentifier: fcell)
                if (tableCell == nil){
                    tableCell = UITableViewCell()
                    let cycleScrollView = ZTCycleScrollView.init(frame: CGRect(x:10,y:5,width:kScreenWidth - 20,height:70 - 10), placeholderImage: PNG(imageStr: "gl"))
                    let testImages = ["test1","test2","test3"]
                    cycleScrollView.imageGroup = testImages
                    cycleScrollView.pageContolAliment = .pageContolAlimentCenter
                    tableCell?.contentView.addSubview(cycleScrollView)
                    tableCell?.contentView.backgroundColor = UIColor.darkGray
                    tableCell?.selectionStyle = .none
                }
                return tableCell!
            }
        }else{
            if indexPath.row == 0{
                var tableCell = tableView.dequeueReusableCell(withIdentifier: "cell")
                if (tableCell == nil){
                    tableCell = UITableViewCell()
                    tableCell?.textLabel?.text = "便民工具"
                    tableCell?.selectionStyle = .none
                }
                return tableCell!
            }else if indexPath.row == 1{
                let menuCollectionID = "menuCollectionID"
                var tableCell = tableView.dequeueReusableCell(withIdentifier: menuCollectionID)
                if (tableCell == nil){
                    tableCell = UITableViewCell()
                    let menuCollectionView = WBMenuCollectionView.init(frame: CGRect(x:0,y:0,width:kScreenWidth,height:150), imageGroup: self.toolMenuImageStrGroup, titleGroup: toolMenuTitleGroup)
                    tableCell?.contentView.addSubview(menuCollectionView)
                    tableCell?.selectionStyle = .none
                }

                return tableCell!
            }else if indexPath.row == 2{
                var tableCell = tableView.dequeueReusableCell(withIdentifier: "cell")
                if (tableCell == nil){
                    tableCell = UITableViewCell()
                    tableCell?.textLabel?.text = "更新于"
                    tableCell?.selectionStyle = .none
                }
                return tableCell!
            }else if indexPath.row == 3{
                var tableCell = tableView.dequeueReusableCell(withIdentifier: "cell")
                if (tableCell == nil){
                    tableCell = UITableViewCell()
                    tableCell?.textLabel?.text = "猜你喜欢"
                    tableCell?.selectionStyle = .none
                }
                return tableCell!
                
            }else{
                let tableCell = tableView.dequeueReusableCell(withIdentifier: WBHouseCellID) as! WBHouseCell
                tableCell.imageView?.image = PNG(imageStr: "zhuangxiujc_publish_icon")
                return tableCell
            }

        }
        return UITableViewCell()
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offy:CGFloat = -scrollView.contentOffset.y - tableOffsetY
        if offy > -64{
            self.homeHeadView.frame.origin.y = -100+offy
        }else{
            
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let offy:CGFloat = -scrollView.contentOffset.y-tableOffsetY
//        if offy > -40 && offy < -20{
//            scrollView.setContentOffset(CGPoint(x:0,y:-tableOffsetY+40), animated: true)
//        }
//        
//        if offy >= -20 && offy < 0{
//            scrollView.setContentOffset(CGPoint(x:0,y:-tableOffsetY), animated: true)
//        }
//        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    // MARK:KVO
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        let offsetY =  -self.tableView.contentOffset.y - tableOffsetY
//        if offsetY > -40 {
//             self.homeHeadView.frame.origin.y = -100+offsetY
//        }
        
    }
    
    // MARK: Getter
    private lazy var homeHeadView: UIView = {
        let view = UIView.init(frame: CGRect(x:0,y:-100,width:kScreenWidth,height:tableOffsetY+100))
        view.backgroundColor = RGB(r: 255, g: 75, b: 40)
        return view
    }()
    

}
