//
//  HCFavoriteFolderView.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/6.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCFavoriteFolderView.h"
#import "HCFavoriteIconModel.h"
#import "HCAssistant.h"

static const CGFloat iconLabelHeight = 36.0f;
static const CGFloat iconLabelFont = 13.0f;
static const CGFloat littleIconSpace = 3;
@implementation HCFavoriteFolderView{
    UILabel *menuLabel;
    NSMutableArray *littleIconViewArray;
    CALayer *folderLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        littleIconViewArray = [[NSMutableArray alloc]initWithCapacity:4];
        //文件夹四格layer
        CGFloat layerSize = CGRectGetWidth(frame)-60.0/320.0*ScreenWidth;
        folderLayer = [[CALayer alloc]init];
        folderLayer.frame = CGRectMake((CGRectGetWidth(frame)-layerSize)/2.0, 10, layerSize, layerSize);
        folderLayer.borderWidth = .5f;
        folderLayer.borderColor = [UIColor lightGrayColor].CGColor;
        folderLayer.cornerRadius = 5;
        [self.layer addSublayer:folderLayer];
        
        CALayer *horRowLayer = [[CALayer alloc]init];
        horRowLayer.frame = CGRectMake(0, CGRectGetHeight(folderLayer.frame)/2, CGRectGetWidth(folderLayer.frame), .5);
        horRowLayer.borderWidth = .5f;
        horRowLayer.borderColor = [UIColor lightGrayColor].CGColor;
        horRowLayer.opacity = .5f;
        [folderLayer addSublayer:horRowLayer];
        
        CALayer *verRowLayer = [[CALayer alloc]init];
        verRowLayer.frame = CGRectMake(CGRectGetWidth(folderLayer.frame)/2, 0, .5, CGRectGetHeight(folderLayer.frame));
        verRowLayer.borderWidth = .5f;
        verRowLayer.borderColor = [UIColor lightGrayColor].CGColor;
        verRowLayer.opacity = .5f;
        [folderLayer addSublayer:verRowLayer];
        
        //四格图标视图
        CGFloat iconWidthHeight = (CGRectGetWidth(folderLayer.frame)-littleIconSpace*4)/2;
        
        CGRect iconViewFrame01 = CGRectMake(littleIconSpace, littleIconSpace, iconWidthHeight, iconWidthHeight);
        UIImageView *littleIconView01 = [[UIImageView alloc]initWithFrame:iconViewFrame01];
        [folderLayer addSublayer:littleIconView01.layer];
        
        CGRect iconViewFrame02 = CGRectMake(CGRectGetMaxX(verRowLayer.frame)+littleIconSpace, littleIconSpace, iconWidthHeight, iconWidthHeight);
        UIImageView *littleIconView02 = [[UIImageView alloc]initWithFrame:iconViewFrame02];
        [folderLayer addSublayer:littleIconView02.layer];
        
        CGRect iconViewFrame03 = CGRectMake(littleIconSpace, CGRectGetMaxY(horRowLayer.frame)+littleIconSpace, iconWidthHeight, iconWidthHeight);
        UIImageView *littleIconView03 = [[UIImageView alloc]initWithFrame:iconViewFrame03];
        [folderLayer addSublayer:littleIconView03.layer];
        
        CGRect iconViewFrame04 = CGRectMake(CGRectGetMaxX(verRowLayer.frame)+littleIconSpace, CGRectGetMaxY(horRowLayer.frame)+littleIconSpace, iconWidthHeight, iconWidthHeight);
        UIImageView *littleIconView04 = [[UIImageView alloc]initWithFrame:iconViewFrame04];
        [folderLayer addSublayer:littleIconView04.layer];
        
        [littleIconViewArray addObject:littleIconView01];
        [littleIconViewArray addObject:littleIconView02];
        [littleIconViewArray addObject:littleIconView03];
        [littleIconViewArray addObject:littleIconView04];
        
        CGFloat labelWidth = CGRectGetWidth(frame)-10.0/320.0*ScreenWidth;
        menuLabel = [[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-labelWidth)/2, 55.0/320.0*ScreenWidth, labelWidth, iconLabelHeight)];
        menuLabel.numberOfLines = 0;
        menuLabel.textAlignment = NSTextAlignmentCenter;
        menuLabel.font = [UIFont systemFontOfSize:iconLabelFont];
        menuLabel.textColor = [UIColor colorWithRed:0.59f green:0.59f blue:0.59f alpha:1.00f];
        menuLabel.text = @"文件夹";
        [self addSubview:menuLabel];
        
        [self addTarget:self action:@selector(folderAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                                                 action:@selector(longGestureAction:)];
        [self addGestureRecognizer:longGesture];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame model:(HCFavoriteFolderModel *)model {
    self = [self initWithFrame:frame];
    self.loveFolderModel = model;
    return self;
}

- (void)setFolderName:(NSString *)folderName {
    _folderName = folderName;
    menuLabel.text = _folderName;
}

- (void)setLoveFolderModel:(HCFavoriteFolderModel *)loveFolderModel {
    _loveFolderModel = loveFolderModel;
    menuLabel.text = _loveFolderModel.folderName;
    
    [self updateLittleIconImage];
}

- (void)setIsShowScaleFolderLayer:(BOOL)isShowScaleFolderLayer {
    if (_isShowScaleFolderLayer == isShowScaleFolderLayer) {
        return;
    }
    _isShowScaleFolderLayer = isShowScaleFolderLayer;
    //可加动画
    if (_isShowScaleFolderLayer) {
        [UIView animateWithDuration:0.6 animations:^{
            [folderLayer setAffineTransform:CGAffineTransformMakeScale(1.2, 1.2)];
        }];
    }
    else {
        [UIView animateWithDuration:0.6 animations:^{
            [folderLayer setAffineTransform:CGAffineTransformIdentity];
        }];
    }
}

- (void)updateLittleIconImage {
    [littleIconViewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *littleIconImageView = obj;
        littleIconImageView.image = nil;
    }];
    
    int count = 0;
    if (_loveFolderModel.iconModelsFolderArray.count > 4) {
        count = 4;
    }
    else {
        count = (int)_loveFolderModel.iconModelsFolderArray.count;
    }
    
    for (int i = 0; i < count ; i++) {
        UIImageView *littleIconImageView = littleIconViewArray[i];
        HCFavoriteIconModel *loveIconModel = _loveFolderModel.iconModelsFolderArray[i];
        littleIconImageView.image = [UIImage imageNamed:loveIconModel.image];
    }
}

- (void)folderAction:(id)sender{
    //进入文件夹页面
    if (_loveFolderDelegate && [_loveFolderDelegate respondsToSelector:@selector(openLoveFolderOfLoveFolderView:)]) {
        [_loveFolderDelegate openLoveFolderOfLoveFolderView:self];
    }
}

- (void)longGestureAction:(UILongPressGestureRecognizer *)gesture {
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (_loveFolderDelegate && [_loveFolderDelegate respondsToSelector:@selector(intoEditingModeOfLoveFolderView:)]) {
                [_loveFolderDelegate intoEditingModeOfLoveFolderView:self];
            }
            if (_loveFolderLongGestureDelegate && [_loveFolderLongGestureDelegate respondsToSelector:@selector(longGestureStateBegin:forLoveFolderView:)]) {
                [_loveFolderLongGestureDelegate longGestureStateBegin:gesture forLoveFolderView:self];
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if (_loveFolderLongGestureDelegate && [_loveFolderLongGestureDelegate respondsToSelector:@selector(longGestureStateMove:forLoveFolderView:)]) {
                [_loveFolderLongGestureDelegate longGestureStateMove:gesture forLoveFolderView:self];
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (_loveFolderLongGestureDelegate && [_loveFolderLongGestureDelegate respondsToSelector:@selector(longGestureStateEnd:forLoveFolderView:)]) {
                [_loveFolderLongGestureDelegate longGestureStateEnd:gesture forLoveFolderView:self];
            }
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            if (_loveFolderLongGestureDelegate && [_loveFolderLongGestureDelegate respondsToSelector:@selector(longGestureStateCancel:forLoveFolderView:)]) {
                [_loveFolderLongGestureDelegate longGestureStateCancel:gesture forLoveFolderView:self];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com