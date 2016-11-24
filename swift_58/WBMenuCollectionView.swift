//
//  WBMenuCollectionView.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/24.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

class WBMenuCollectionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect,imageGroup:[String],titleGroup:[String]!) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize(width:kScreenWidth/5,height:self.bounds.height/2 )
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WBMenuCCell.self, forCellWithReuseIdentifier: WBMenuCCellID)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        self.addSubview(collectionView)
    }
    
    // MARK: - CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WBMenuCCell = collectionView.dequeueReusableCell(withReuseIdentifier: WBMenuCCellID, for: indexPath) as! WBMenuCCell
        cell.imageView.image = PNG(imageStr: "upload-highlight")
        cell.titleLabel.text = "工具"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    // MARK: - CollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }

}
