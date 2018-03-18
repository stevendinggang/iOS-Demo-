//
//  RBTextFieldCollectionViewCell.m
//  ResourceBooking
//
//  Created by Anbita Siregar on 6/25/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import "PARTextFieldCollectionViewCell.h"
#import "PARBackspaceTextField.h"

@interface PARTextFieldCollectionViewCell ()

@end

@implementation PARTextFieldCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tagTextField.textColor = [UIColor blackColor];
}

- (void)useTextColor:(UIColor *)textColor tintColor:(UIColor *)tintColor {
    if (textColor) {
        self.tagTextField.textColor = textColor;
    }
    
    if (tintColor) {
        self.tagTextField.tintColor = tintColor;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.delegate) {
        return [self.delegate shouldReturnFromTextFieldCollectionViewCell:self];
    } else {
        return YES;
    }
}

- (IBAction)textFieldEditingDidChange:(UITextField *)sender {
    
    [self.delegate editingDidChangeInTextFieldCollectionViewCell:self];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(editingInTextFieldCollectionViewCell:becameActive:)]) {
        [self.delegate editingInTextFieldCollectionViewCell:self becameActive:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(editingInTextFieldCollectionViewCell:becameActive:)]) {
        [self.delegate editingInTextFieldCollectionViewCell:self becameActive:NO];
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com