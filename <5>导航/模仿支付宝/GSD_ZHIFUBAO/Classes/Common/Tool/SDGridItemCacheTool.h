//
//  SDGridItemCacheTool.h
//  GSD_ZHIFUBAO
//
//  Created by gsd on 15/8/11.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

/*
 
 *********************************************************************************
 *
 * 在您使用此自动布局库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GSD_iOS
 * Email : gsdios@126.com
 * GitHub: https://github.com/gsdios
 *
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>

@interface SDGridItemCacheTool : NSObject

+ (NSArray *)itemsArray;
+ (void)saveItemsArray:(NSArray *)array;

@end
