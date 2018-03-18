//
//  ItemButton.h
//  玻璃易购
//
//  Created by apple on 16/4/9.
//  Copyright © 2016年 艾磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

typedef void(^SelectItem) (id item);
@interface ItemButton : UIView
@property (nonatomic,strong)DataModel *itemModel;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)SelectItem selectItem;
@property (nonatomic,assign)BOOL itemSected;

-(instancetype)initWithFrame:(CGRect)frame item:(DataModel *)model;

@end
