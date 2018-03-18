//
//  RBBackspaceTextField.h
//  ResourceBooking
//
//  Created by Anbita Siregar on 6/26/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PARBackspaceTextFieldDelegate <NSObject>
- (void)textFieldDidBackspace:(UITextField *)textField;
@end

@interface PARBackspaceTextField : UITextField
- (void)deleteBackward;
@property (strong, nonatomic) id<PARBackspaceTextFieldDelegate> backspaceDelegate;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com