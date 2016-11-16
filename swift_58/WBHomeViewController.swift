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
        let tableView = UITableView()
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.frame = self.view.frame
        tableView.contentInset = UIEdgeInsetsMake(tableOffsetY, 0, 0, 0)
//        tableView.register(WBHomeTopLineCell(), forCellReuseIdentifier: WBHomeTopLineCellID)
        

        
        self.view.addSubview(tableView)
        self.view.addSubview(self.homeHeadView)
    }
    
    // MARK: TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        }
        return 18
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 175
        }else if indexPath.section == 1{
            return 70
        }
        return 44
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offy:CGFloat = -scrollView.contentOffset.y-tableOffsetY
        print(offy)
        if offy > -40{
            self.homeHeadView.frame.origin.y = -100+offy
        }else{

        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section > 1{
            return 10;
        }
        return 0;
    }
    
    // MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var tableCell = tableView.dequeueReusableCell(withIdentifier: WBHomeMenuCellID)
            if (tableCell == nil){
                tableCell = WBHomeMenuCell()
            }
            return tableCell!
        }else if indexPath.section == 1{
            var tableCell = tableView.dequeueReusableCell(withIdentifier: WBHomeTopLineCellID)
            if (tableCell == nil){
                tableCell = WBHomeTopLineCell()
            }
            tableCell?.imageView?.image = PNG(imageStr: "gleducation")
            tableCell?.textLabel?.text = "test"
            return tableCell!
        }else{
            var tableCell = tableView.dequeueReusableCell(withIdentifier: fcell)
            if (tableCell == nil){
                tableCell = UITableViewCell()
            }
            return tableCell!
        }
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offy:CGFloat = -scrollView.contentOffset.y-tableOffsetY
        if offy > -40 && offy < -20{
            scrollView.setContentOffset(CGPoint(x:0,y:-tableOffsetY+40), animated: true)
        }
        
        if offy >= -20 && offy < 0{
            scrollView.setContentOffset(CGPoint(x:0,y:-tableOffsetY), animated: true)
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    // MARK: Getter
    private lazy var homeHeadView: UIView = {
        let view = UIView.init(frame: CGRect(x:0,y:-100,width:kScreenWidth,height:tableOffsetY+100))
        view.backgroundColor = RGB(r: 255, g: 75, b: 40)
        return view
    }()
    

}
