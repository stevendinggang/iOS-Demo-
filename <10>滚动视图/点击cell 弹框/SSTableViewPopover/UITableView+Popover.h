//
//  UITableView+Popover.h
//  SSTableViewPopover
//
//  Created by Mrss on 16/1/26.
//  Copyright © 2016年 expai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopoverItem;

typedef void(^PopoverItemSelectHandler)(PopoverItem *popoverItem);

@interface PopoverItem : NSObject

@property (nonatomic,readonly,  copy) NSString *name;
@property (nonatomic,readonly,strong) UIImage *image;
@property (nonatomic,readonly,  copy) PopoverItemSelectHandler handler;

+ (instancetype)itemWithName:(NSString *)name
                       image:(UIImage *)image
             selectedHandler:(PopoverItemSelectHandler)handler;

@end

@interface UITableView (Popover)


- (void)showPopoverWithItems:(NSArray <PopoverItem *>*)items
                forIndexPath:(NSIndexPath *)indexPath;

@end// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com