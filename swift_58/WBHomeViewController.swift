//
//  WBHomeViewController.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/11.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

let fcell = "fcell"


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
//        tableView.register(WBHomeClassTableViewCell().self, forCellReuseIdentifier: fcell)
        self.view.addSubview(tableView)
    }
    
    // MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    // MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableCell = tableView.dequeueReusableCell(withIdentifier: fcell)
        if (tableCell == nil){
            tableCell = UITableViewCell()
        }
        tableCell?.textLabel?.text = "hello world"
        return tableCell!
    }

}
