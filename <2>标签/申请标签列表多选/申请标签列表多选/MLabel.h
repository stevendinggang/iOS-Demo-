//
//  MLabel.h
//  申请标签列表多选
//
//  Created by Mr.Luan on 16/1/6.
//  Copyright © 2016年 中邦游. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLabel : NSObject

@property (nonatomic , copy) NSString * sectionStr;

@property (nonatomic, copy) NSArray * items;

@property (nonatomic, assign) BOOL allSelected; // 是否全选
@property (nonatomic, assign) BOOL open; // 是否全选
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com