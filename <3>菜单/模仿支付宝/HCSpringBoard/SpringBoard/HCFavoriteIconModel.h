//
//  HCFavoriteIconModel.h
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/4.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCFavoriteIconModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *imageSeleted;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL display;
@property (nonatomic, assign) BOOL isEditing;
@property (nonatomic, assign) BOOL isReadOnly;

@property (nonatomic, copy) NSString *menuListImage;
@property (nonatomic, copy) NSString *navigationPointing;
@property (nonatomic, assign) BOOL isNeedLogin;
@property (nonatomic, copy) NSString *nodeIndex;
@property (nonatomic, assign) NSInteger sortNum;

@property (nonatomic, copy) NSString *targetController;

@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) NSArray *itemList;


@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com