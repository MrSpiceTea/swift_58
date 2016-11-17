//
//  ZTCycleScrollView.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/17.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

class ZTCycleScrollView: UIView,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var imageGroup = [String]()
    var scrollTimeInterval:CGFloat = 2.0
    
    

    init(frame:CGRect,placeholderImage:UIImage) {
        super.init(frame: frame)
        self.setupUI()
    }
    

    func setupUI(){
        self.backgroundColor = UIColor.darkGray
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ZTCollectionViewCell.self, forCellWithReuseIdentifier: ZTCollectionViewCellID)
        self.addSubview(collectionView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(imageGroup.count)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZTCollectionViewCellID, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // MARK: - CollectionViewDataSource
    
    
    
}
