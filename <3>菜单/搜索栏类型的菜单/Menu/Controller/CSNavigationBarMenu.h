//
//  CSNavigationBarMenu.h
//  test
//
//  Created by sangcixiang on 16/2/20.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CSNavgationBarMenuItem.h"
@interface CSNavigationBarMenu : UIView
/** 菜单数据  */
@property(nonatomic,strong)NSArray * items;
/** 三角型 */
@property(nonatomic,assign)CGRect  triangleFrame;
/**  分割线颜色 */
@property(nonatomic,strong)UIColor * separatroColor;
/**  行高 */
@property(nonatomic,assign)CGFloat  rowHeight;
/**  点击的条目数 */
@property(nonatomic,copy)void(^didSelectMenuItem)(CSNavigationBarMenu *menu,CSNavgationBarMenuItem *menuItem);
/**  菜单的大小及出现的位置 */
-(instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width;
-(void)show;
-(void)dismiss;

@end
