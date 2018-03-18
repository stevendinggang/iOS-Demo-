//
//  MyCollectionViewCell.h
//  collection
//
//  Created by 徐茂怀 on 16/2/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
typedef enum : NSInteger
{
    cellStyleDefault = 0,
    cellStyleSelected = 1,
    cellStyleAdd = 2,
}CollectionViewCellStyle;

@property(nonatomic, assign)CollectionViewCellStyle cellStyle;
@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)UIImageView *imageView;
@property(nonatomic, strong)NSArray *array;
@property(nonatomic, strong)NSMutableArray *dataArray;
-(void)layoutSubviews;
@end
