//
//  ZWYPopKeyWordsView.h
//  ZWYPopKeyWords
//
//  Created by 赵纬宇 on 14-6-16.
//  Copyright (c) 2014年 ZWY. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZWYSearchShowViewDelegate <NSObject>

@optional

- (void)searchHotTaglibWithKeyWord:(NSString *)keyWords;

@end


@interface ZWYPopKeyWordsView : UIView
@property (nonatomic, retain) UIButton *changeBtn;
@property (nonatomic, retain) NSMutableArray *keyWordArray;
@property (nonatomic, retain) id<ZWYSearchShowViewDelegate>delegate;
@property (nonatomic, assign) BOOL isFirst;
- (void)changeSearchKeyWord;
//- (void)changeAnother:(UIButton *)sender;
@end
