//
//  WLCellFrameModel.m
//  DynamicCell
//
//  Created by chiyu on 16/2/16.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import "WLCellFrameModel.h"
#import "WLCellModel.h"

#import "UIImageView+WebCache.h"

#define WLNameFont [UIFont systemFontOfSize:14]
#define WLTextFont [UIFont systemFontOfSize:15]

@implementation WLCellFrameModel


-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs=@{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


-(void)setCellModel:(WLCellModel *)cellModel
{
    _cellModel=cellModel;
    CGFloat padding=10;
    
    /**
     *  icon
     */
    CGFloat iconX=padding;
    CGFloat iconY=padding;
    CGFloat iconW=30;
    CGFloat iconH=30;
    _iconF=CGRectMake(iconX, iconY, iconW, iconH);
    
    /**
     *  name
     */
    CGSize nameSize=[self sizeWithText:self.cellModel.name font:WLNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameX=CGRectGetMaxX(_iconF)+padding;
    CGFloat nameY=iconY+(iconH -nameSize.height)*0.5;
    _nameF=CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    
    /**
     *  text
     */
    CGFloat textX=iconX;
    CGFloat textY=CGRectGetMaxY(_iconF)+padding;
    CGSize textSize=[self sizeWithText:self.cellModel.text font:WLTextFont maxSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*textX, MAXFLOAT)];
    _textF=CGRectMake(textX, textY, textSize.width, textSize.height);
    
    /**
     *  picture
     */
    if (self.cellModel.picture) {
        CGFloat pictureX=textX;
        CGFloat pictureY=CGRectGetMaxY(_textF)+padding;
        CGFloat pictureW=[self.cellModel.picW floatValue];
        CGFloat pictureH=[self.cellModel.picH floatValue];
        _pictureF=CGRectMake(pictureX, pictureY, pictureW, pictureH);        
        _cellHeight=CGRectGetMaxY(_pictureF)+padding;
    }
    else
    {
        _cellHeight=CGRectGetMaxY(_textF)+padding;
    }
    
}

@end
