//
//  customTableViewCell.m
//  ContextMenu
//
//  Created by 邓梓暄 on 15/9/26.
//  Copyright © 2015年 Dzx. All rights reserved.
//

#import "customTableViewCell.h"

@implementation customTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.layer.masksToBounds = YES;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowColor = [[UIColor colorWithRed:181.0/255.0 green:181.0/255.0 blue:181.0/255.0 alpha:1] CGColor];
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - YALContextMenuCell

- (UIView*)animatedIcon {
    return self.imageContent;
}

- (UIView *)animatedContent {
    return self.labelContent;
}
@end
