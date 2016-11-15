//
//  WBHomeViewController.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/11.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

let fcell = "fcell"
let tableOffsetY:CGFloat = 115



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
        
//        tableView.register(WBHomeClassTableViewCell().self, forCellReuseIdentifier: fcell)
        self.view.addSubview(tableView)
        self.view.addSubview(self.homeHeadView)
    }
    
    // MARK: TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 18
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 165
        }
        return 44
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if -scrollView.contentOffset.y > 64{
            print(scrollView.contentOffset.y+tableOffsetY)
        }else{

        }
    }
    
    // MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var tableCell = tableView.dequeueReusableCell(withIdentifier: fcell)
            if (tableCell == nil){
                tableCell = WBHomeMenuCell()
            }
            return tableCell!
        }else{
            var tableCell = tableView.dequeueReusableCell(withIdentifier: fcell)
            if (tableCell == nil){
                tableCell = UITableViewCell()
            }
            return tableCell!

        }
    }
    
    // MARK: Getter
    private lazy var homeHeadView: UIView = {
        let view = UIView.init(frame: CGRect(x:0,y:-100,width:kScreenWidth,height:tableOffsetY+100))
        view.backgroundColor = RGB(r: 255, g: 75, b: 40)
        print("viewinit")
        return view
    }()
    

}
