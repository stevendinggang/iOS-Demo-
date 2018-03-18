//
//  customTableViewCell.h
//  ContextMenu
//
//  Created by 邓梓暄 on 15/9/26.
//  Copyright © 2015年 Dzx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YALContextMenuCell.h>

@interface customTableViewCell : UITableViewCell<YALContextMenuCell>

@property (strong, nonatomic) IBOutlet UILabel *labelContent;

@property (strong, nonatomic) IBOutlet UIImageView *imageContent;

@end
