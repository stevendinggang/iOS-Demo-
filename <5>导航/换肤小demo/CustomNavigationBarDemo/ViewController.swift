//
//  ViewController.swift
//  CustomNavigationBarDemo
//
//  Created by Aiguang.Li@gmail.com on 16/4/22.
//  Copyright © 2016年 mooeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var _colorCollectionView:UICollectionView?
    private var colors:[UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CustomNavigationBarDemo"
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.constructColorsView()
    }
    
    func constructColorsView() {
        
        if(colors.count == 0) {
            colors.append(UIColor.blueColor())
            colors.append(UIColor.redColor())
            colors.append(UIColor.purpleColor())
            colors.append(UIColor.yellowColor())
            colors.append(UIColor.greenColor())
            colors.append(UIColor.darkGrayColor())
            colors.append(UIColor.cyanColor())
            colors.append(UIColor.magentaColor())
        }
        
        let colorLayout = UICollectionViewFlowLayout.init()
        colorLayout.minimumLineSpacing = 1.0
        colorLayout.minimumInteritemSpacing = 20.0
        colorLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        colorLayout.itemSize = CGSize(width:ColorCell.CellWidth, height:ColorCell.CellHeight)
        colorLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        _colorCollectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: colorLayout)
        _colorCollectionView?.delegate = self
        _colorCollectionView?.dataSource = self
        _colorCollectionView?.registerClass(ColorCell.self, forCellWithReuseIdentifier: ColorCell.ColorCellId)
        _colorCollectionView?.scrollEnabled = false
        _colorCollectionView?.backgroundColor = UIColor.whiteColor()
        _colorCollectionView?.frame = CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: ColorCell.CellHeight * 3)
        self.view.addSubview(_colorCollectionView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // CollectionView行数
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return colors.count / 2
    }
    
    // 获取单元格
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
            ColorCell.ColorCellId, forIndexPath: indexPath) as! ColorCell
        
        print("\(indexPath)")
        cell.colorView.backgroundColor = colors[indexPath.section*4 + indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath)")
        let color = colors[indexPath.section*4 + indexPath.row]
        self.navigationController?.navigationBar.setCustomBackgroundColor(color)
    }



}

class ColorCell: UICollectionViewCell {
    static let ColorCellId = "ColorCell"
    static let colorMargin:CGFloat = 5
    static let CellWidth:CGFloat = 60
    static let CellHeight:CGFloat = 60
    private var _colorView:UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.colorView.tag = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var colorView:UIView {
        if(_colorView == nil) {
            _colorView = UIView.init()
            _colorView?.layer.cornerRadius = 6.0
            _colorView?.clipsToBounds = true
            _colorView?.frame = CGRect(x: ColorCell.colorMargin, y: ColorCell.colorMargin,
                                            width: ColorCell.CellWidth - ColorCell.colorMargin*2,
                                            height: ColorCell.CellHeight - ColorCell.colorMargin*2)
            self.contentView.addSubview(_colorView!)
        }
        return _colorView!
    }
    
}

