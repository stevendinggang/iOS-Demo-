//
//  ViewController.h
//  OrderDemo
//
//  Created by king on 16/2/25.
//  Copyright © 2016年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "TableViewCell.h"
@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,numberDelegate>{
    NSArray *dataArray;
    UILabel         *_shopNumber;
    
    int             _selectIndex;
    UITableView *_table;
}


@end

