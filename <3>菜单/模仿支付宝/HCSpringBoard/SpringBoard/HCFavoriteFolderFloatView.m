//
//  HCFavoriteFolderFloatView.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/7.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCFavoriteFolderFloatView.h"
#import "ViewController.h"
#import "HCSpringBoardView.h"
#import "HCFavoriteFolderMenuView.h"

@implementation HCFavoriteFolderFloatView {
    UITextField *folderNameField;
    HCFavoriteFolderMenuView *folderMenuView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:215.0/255.0 green:215.0/255.0 blue:215.0/255.0 alpha:.7];
        
        folderNameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 64, ScreenWidth-40, 40)];
        folderNameField.font = [UIFont systemFontOfSize:30];
        folderNameField.delegate = self;
        folderNameField.clearButtonMode = UITextFieldViewModeAlways;
        folderNameField.textAlignment = NSTextAlignmentCenter;
        folderNameField.returnKeyType = UIReturnKeyDone;
        [self addSubview:folderNameField];
        
        [self addTarget:self action:@selector(hideFloatView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithModel:(HCFavoriteFolderModel *)model {
    self = [self initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.loveFolderModel = model;
    
    folderMenuView = [[HCFavoriteFolderMenuView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(folderNameField.frame)+20, ScreenWidth-20, ScreenWidth+20)
                                                       menuModels:_loveFolderModel.iconModelsFolderArray
                                                        menuIcons:_loveFolderModel.iconViewsFolderArray];
    folderMenuView.folderMenuDelegate = self;
    folderMenuView.backgroundColor = [UIColor whiteColor];
    folderMenuView.layer.cornerRadius = 20;
    folderMenuView.clipsToBounds = YES;
    [self addSubview:folderMenuView];
    
    folderNameField.text = self.loveFolderModel.folderName;
    
    return self;
}

- (void)setMyControllerDelegate:(id )myControllerDelegate {
    _myControllerDelegate = myControllerDelegate;
}

- (void)setMySpringBoardDelegate:(id)mySpringBoardDelegate {
    _mySpringBoardDelegate = mySpringBoardDelegate;
    
    if ([_mySpringBoardDelegate isKindOfClass:[HCSpringBoardView class]]) {
        HCSpringBoardView *springBoard = _mySpringBoardDelegate;
        if (springBoard.isEdit) {
            [folderMenuView showEditButton];
        }
        folderMenuView.outsideFolderGestureDelegate = springBoard;
    }
}

- (void)hideFloatView:(UIControl *)control {
    if ([folderNameField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"文件夹名字不能为空" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        [self.mySpringBoardDelegate archiverIconModelsArray];
        [folderNameField resignFirstResponder];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            if (control) {
                [self removeFromSuperview];
            }
        }];
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.loveFolderModel.folderName = textField.text;
    self.loveFolderView.folderName = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.loveFolderModel.folderName = textField.text;
    self.loveFolderView.folderName = textField.text;
    [textField resignFirstResponder];
    return YES;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com