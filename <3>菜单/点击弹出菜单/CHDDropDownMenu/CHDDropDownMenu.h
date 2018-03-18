//
//  CHDDropDownMenu.h
//  CHDDropDownMenu
//
//  Created by CHD on 15/11/16.
//  Copyright © 2015年 CHD. All rights reserved.
//

#import <UIKit/UIKit.h>

//需自定义按钮请修改此类
@interface chdButton : UIButton

@end
//需自定义数据模型请更改此类
@interface chdModel : NSObject
@property (nonatomic,copy) NSString *text;
@property BOOL isSub;
@property BOOL isSelect;
@end
//需自定义下拉cell请更改此类
@interface chdMenuCell : UITableViewCell
@property (nonatomic,retain) UIView *bgView;
@property (nonatomic,retain) UIView *point;
@property (nonatomic,retain) UILabel *textL;
@end

@protocol chdMenuDelegate <NSObject>

- (void)selectColum:(NSInteger)colum Row:(NSInteger)row Model:(chdModel*)model;

@end

@interface CHDDropDownMenu : UIView<UITableViewDataSource,UITableViewDelegate>
- (void)initWithFrame:(CGRect)frame showOnView:(UIView*)view AllDataArr:(NSMutableArray*)arr showArr:(NSMutableArray *)showArr;
//使某列某行被选中,默认均选中第0行。 可调用此方法更改默认。
- (void)selectClum:(NSInteger)colum Row:(NSInteger)row;
@property (nonatomic,retain) NSMutableArray *AllDataArr;
@property (nonatomic,retain) NSMutableArray *showArr;
@property (nonatomic,weak) __weak id<chdMenuDelegate>delegate;
@end
