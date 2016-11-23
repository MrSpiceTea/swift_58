//
//  ZTCycleScrollView.swift
//  swift_58
//
//  Created by Mr.Xie on 2016/11/17.
//  Copyright © 2016年 xzt. All rights reserved.
//

import UIKit

enum ZTpageContolAliment {
    case pageContolAlimentLeft
    case pageContolAlimentRight
    case pageContolAlimentCenter
}

class ZTCycleScrollView: UIView,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    var imageGroup:[String]!{
        didSet{
           self.totalImageCount = imageGroup.count * 100
        }
    }
    var pageContolAliment:ZTpageContolAliment!{
        didSet{
           self.setuppageContorl()
        }
    }
    
    var scrollTimeInterval:TimeInterval = 2
    var totalImageCount:Int = 0
    var timer:Timer!
//    var pageContorll:UIPageControl!
    var mainView:UICollectionView!
    var flowLayout:UICollectionViewFlowLayout!

    
    init(frame:CGRect,placeholderImage:UIImage) {
        super.init(frame: frame)
        self.setupUI()
        self.setupTimer()
    }
    
    func setupUI(){
        self.backgroundColor = UIColor.darkGray
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = self.frame.size
        self.flowLayout = flowLayout
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ZTCollectionViewCell.self, forCellWithReuseIdentifier: ZTCollectionViewCellID)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        self.addSubview(collectionView)
        self.mainView = collectionView
    }
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: scrollTimeInterval, target: self, selector: #selector(self.timeIntervalScrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .commonModes)
        
    }
    
    func currentIndex() -> Int {
        if (self.mainView.frame.width == 0){
            return 0
        }
        
        let index = (self.mainView.contentOffset.x + self.flowLayout.itemSize.width * 0.5)/self.flowLayout.itemSize.width
        return max(0, Int(index))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollToNext(index:Int) {
        self.mainView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func currentCellIndex(index:Int) -> Int{
        return index % self.imageGroup.count
    }
    
    // MARK: - LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        if ((self.pageContolAliment) != nil) {
            let pageWidth:CGFloat = 120,pageHeight:CGFloat = 30
            self.pageContorl.frame = CGRect(x:self.frame.size.width/2 - pageWidth/2,y:self.frame.size.height - pageHeight,width:pageWidth,height:pageHeight);
        }
    }
    
    // MARK: - Timer
    func timeIntervalScrollToNext(){
        if(self.totalImageCount == 0){return}
        var nextIndex = self.currentIndex() + 1
        if(nextIndex >= self.totalImageCount){nextIndex = max(0, Int(Double(self.totalImageCount) * 0.5))}
        self.scrollToNext(index: nextIndex)
    }
    
    func timeInvalidate(){
        self.timer.invalidate()
    }

    
    // MARK: - CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ZTCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ZTCollectionViewCellID, for: indexPath) as! ZTCollectionViewCell
        let cellIndex = self.currentCellIndex(index: indexPath.row)
        cell.imageView.image = PNG(imageStr: imageGroup[cellIndex])
        cell.titleLabel.text = imageGroup[cellIndex]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return totalImageCount
    }
    
    // MARK: - CollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - ScollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.imageGroup.count == 0){return}
        if ((self.pageContolAliment) != nil) {
            let itemIndex = self.currentIndex()
            let cellIndex = self.currentCellIndex(index: itemIndex)
            self.pageContorl.currentPage = cellIndex
        }
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.timeInvalidate()
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.setupTimer()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        print("scrollViewDidEndScrollingAnimation")
    }
    
    // MARK: - Lazy
    func setuppageContorl(){
        self.addSubview(self.pageContorl)
        self.bringSubview(toFront: self.pageContorl)
        self.pageContorl.currentPage = 0
        self.pageContorl.numberOfPages = self.imageGroup.count
        self.pageContorl.currentPageIndicatorTintColor = UIColor.orange
    }
    
    lazy var pageContorl: UIPageControl = {
        var pageContorl = UIPageControl.init()
        return pageContorl
    }()
}
