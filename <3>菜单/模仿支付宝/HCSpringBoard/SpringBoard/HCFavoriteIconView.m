//
//  HCFavoriteIconView.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/6.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCFavoriteIconView.h"
#import "HCAssistant.h"

static const CGFloat iconButtonWitdh = 30.0f;
static const CGFloat iconDeleteButtonWitdh = 20.0f;
static const CGFloat iconNewFlagViewWith = 40.0f;
static const CGFloat iconLabelHeight = 36.0f;
static const CGFloat iconLabelFont = 13.0f;
@implementation HCFavoriteIconView {
    UIButton *menuButton;
    UILabel *menuLabel;
    UIButton *delButton;
    UIImageView *newFlagView;
    CALayer *folderLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        
        menuButton = [[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-iconButtonWitdh)/2, 20.0/320.0*ScreenWidth, iconButtonWitdh, iconButtonWitdh)];
        [menuButton addTarget:self action:@selector(menuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
        
        menuLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(menuButton.frame)+5.0/320.0*ScreenWidth, CGRectGetWidth(frame)-10, iconLabelHeight)];
        menuLabel.numberOfLines = 0;
        menuLabel.textAlignment = NSTextAlignmentCenter;
        menuLabel.font = [UIFont systemFontOfSize:iconLabelFont];
        menuLabel.textColor = [UIColor colorWithRed:0.59f green:0.59f blue:0.59f alpha:1.00f];
        [self addSubview:menuLabel];
        
        delButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(frame)-22.5, 2.5, iconDeleteButtonWitdh, iconDeleteButtonWitdh)];
        delButton.backgroundColor = [UIColor blackColor];
        [delButton setImage:[UIImage imageNamed:@"del"] forState:UIControlStateNormal];
        delButton.alpha = 0.9;
        delButton.layer.cornerRadius = iconDeleteButtonWitdh/2;
        [delButton addTarget:self action:@selector(delButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:delButton];
        
        newFlagView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(frame)-iconNewFlagViewWith, 1, iconNewFlagViewWith, iconNewFlagViewWith)];
        newFlagView.clipsToBounds = YES;
        newFlagView.image = [UIImage imageNamed:@"M_NEW"];
        [self addSubview:newFlagView];
        
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                                                 action:@selector(longGestureAction:)];
        [self addGestureRecognizer:longGesture];
        
        [self addTarget:self action:@selector(menuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        delButton.hidden = YES;
        newFlagView.hidden = YES;
        
        //文件夹layer
        CGFloat layerSize = CGRectGetWidth(frame)-60.0/320.0*ScreenWidth;
        folderLayer = [[CALayer alloc]init];
        folderLayer.frame = CGRectMake((frame.size.width-layerSize)/2, 10.0/320.0*ScreenWidth, layerSize, layerSize);
        folderLayer.borderWidth = .5f;
        folderLayer.borderColor = [UIColor lightGrayColor].CGColor;
        folderLayer.opacity = .5f;
        folderLayer.cornerRadius = 5;
        [self.layer addSublayer:folderLayer];
        folderLayer.hidden = YES;
        
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
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame model:(HCFavoriteIconModel *)model {
    self = [self initWithFrame:frame];
    
    self.loveIconModel = model;
    
    return self;
}

- (void)setIsEditing:(BOOL)isEditing {
    _isEditing = isEditing;
    delButton.hidden = !_isEditing;
}

- (void)setIsShowFolderFlag:(BOOL)isShowFolderFlag {
    if (_isShowFolderFlag == isShowFolderFlag) {
        return;
    }
    _isShowFolderFlag = isShowFolderFlag;
    //可加动画
    if (_isShowFolderFlag) {
        folderLayer.hidden = NO;
        [UIView animateWithDuration:0.6 animations:^{
            [folderLayer setAffineTransform:CGAffineTransformMakeScale(1.2, 1.2)];
        }];
    }
    else {
        [UIView animateWithDuration:0.6 animations:^{
            [folderLayer setAffineTransform:CGAffineTransformIdentity];
        } completion:^(BOOL finished) {
            folderLayer.hidden = YES;
        }];
    }
}

- (void)setLoveIconModel:(HCFavoriteIconModel *)loveIconModel {
    _loveIconModel = loveIconModel;
    
    [menuButton setImage:[UIImage imageNamed:_loveIconModel.image] forState:UIControlStateNormal];
    [menuButton setImage:[UIImage imageNamed:_loveIconModel.imageSeleted] forState:UIControlStateHighlighted];
    menuLabel.text = _loveIconModel.name;
    
    newFlagView.hidden = !([_loveIconModel.name isEqualToString:@"添加"]);
}

- (void)menuButtonAction:(UITapGestureRecognizer *)gesture {
    if ([_loveIconModel.name isEqualToString:@"添加"]) {
        if (_favoriteIconDelegate && [_favoriteIconDelegate respondsToSelector:@selector(addIconOfLoveIconView:)]) {
            [_favoriteIconDelegate addIconOfLoveIconView:self];
        }
    }
    else {
        if (_favoriteIconDelegate && [_favoriteIconDelegate respondsToSelector:@selector(pushPageOfLoveIconView:)]) {
            [_favoriteIconDelegate pushPageOfLoveIconView:self];
        }
    }
}

- (void)delButtonAction:(UIButton *)button {
    if (_favoriteIconDelegate && [_favoriteIconDelegate respondsToSelector:@selector(deleteIconOfLoveIconView:)]) {
        [_favoriteIconDelegate deleteIconOfLoveIconView:self];
    }
}

- (void)longGestureAction:(UILongPressGestureRecognizer *)gesture {
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (![_loveIconModel.name isEqualToString:@"添加"]) {
                if (_favoriteIconDelegate && [_favoriteIconDelegate respondsToSelector:@selector(intoEditingModeOfLoveIconView:)]) {
                    [_favoriteIconDelegate intoEditingModeOfLoveIconView:self];
                }
                if (_favoriteIconLongGestureDelegate && [_favoriteIconLongGestureDelegate respondsToSelector:@selector(longGestureStateBegin:forLoveView:)]) {
                    [_favoriteIconLongGestureDelegate longGestureStateBegin:gesture forLoveView:self];
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if (_favoriteIconLongGestureDelegate && [_favoriteIconLongGestureDelegate respondsToSelector:@selector(longGestureStateMove:forLoveView:)]) {
                [_favoriteIconLongGestureDelegate longGestureStateMove:gesture forLoveView:self];
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (_favoriteIconLongGestureDelegate && [_favoriteIconLongGestureDelegate respondsToSelector:@selector(longGestureStateEnd:forLoveView:)]) {
                [_favoriteIconLongGestureDelegate longGestureStateEnd:gesture forLoveView:self];
            }
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            if (_favoriteIconLongGestureDelegate && [_favoriteIconLongGestureDelegate respondsToSelector:@selector(longGestureStateCancel:forLoveView:)]) {
                [_favoriteIconLongGestureDelegate longGestureStateCancel:gesture forLoveView:self];
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