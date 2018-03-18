//
//  MSKCellScrollView.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/29.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "MSKCellScrollView.h"
#import "MSKCarCellSubModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation MSKCellScrollView

-(void)initsubmodels:(NSArray *)subModels{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [scrollView setContentSize:CGSizeMake(subModels.count * 144, 74)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    for (int i = 0;i < subModels.count;i++) {
        MSKCarCellSubModel *model = subModels[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 144, 0, 104, 74)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.goodImg] placeholderImage:[UIImage imageNamed:@"defaulterProduct"]];
        
        if (i < subModels.count - 1) {
            UIImageView *defImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width + 5, imageView.frame.origin.y, 30, 30)];
            [defImageView setImage:[UIImage imageNamed:@"redAddImg"]];
            defImageView.center = CGPointMake(defImageView.center.x, imageView.frame.size.height / 2.0f);
            [scrollView addSubview:defImageView];
        }
        [scrollView addSubview:imageView];
    }
    [self addSubview:scrollView];
}


@end
