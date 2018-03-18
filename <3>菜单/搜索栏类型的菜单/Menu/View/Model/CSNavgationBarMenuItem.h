//
//  CSNavgationBarMenuItem.h
//  test
//
//  Created by sangcixiang on 16/2/20.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CSNavgationBarMenuItem : NSObject
/**  图标 */
@property(nonatomic,strong)UIImage * image;
/**  标题 */
@property(nonatomic,copy)NSString  * title;
/**  标题颜色 */
@property(nonatomic,strong)UIColor * titleColor;
/**  标题大小 */
@property(nonatomic,strong)UIFont  * titleFont;
/**  初始化内容 */
+(instancetype)navigationBarMenuItemWithImage:(UIImage *)image andTitle:(NSString *)title;

@end
