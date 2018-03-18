//
//  MSKCarTableviewHeaderView.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "MSKCarTableviewHeaderView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MSKCarModel.h"
#import <ReactiveCocoa.h>
@interface MSKCarTableviewHeaderView(){
    __weak IBOutlet UIButton *upOrDownBtn;
    __weak IBOutlet UILabel *businessName;
    __weak IBOutlet UIImageView *businessImg;
    __weak IBOutlet UIButton *selectOrCancelBtn;
                    NSArray *currentDataSource;
    MSKCarHeaderViewModel *currentCarHeaderViewModel;
}
@end

@implementation MSKCarTableviewHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];

    [[selectOrCancelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
        selectOrCancelBtn.selected = !selectOrCancelBtn.selected;
        [self resetModelSelected:selectOrCancelBtn.selected];
    }];
    [[upOrDownBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];
}

-(void)setCarHeaderViewModel:(MSKCarHeaderViewModel *)carHeaderViewModel{
    currentCarHeaderViewModel = carHeaderViewModel;
    currentDataSource = currentCarHeaderViewModel.dataSource;
    businessName.text = carHeaderViewModel.businessName;
    [businessImg  sd_setImageWithURL:[NSURL URLWithString:carHeaderViewModel.businessImg] placeholderImage:[UIImage imageNamed:@"addOther"]];
    BOOL isSelectedAll = currentCarHeaderViewModel.receiveIsSelectedSelectedAll;
    selectOrCancelBtn.selected = isSelectedAll;
    currentCarHeaderViewModel.isSelectedAll = isSelectedAll;
}

/**
 *  组全选/取消全选
 *
 *  @param selected 是否全选
 */
-(void)resetModelSelected:(BOOL)selected{
    [currentCarHeaderViewModel resetModelSelected:selected];
    if (self.selectedOrCancel) {
        self.selectedOrCancel();
    }
}
/**
 *  设置全选按钮状态
 */
-(void)restAllSelectedState{
    selectOrCancelBtn.selected = currentCarHeaderViewModel.receiveIsSelectedSelectedAll;
}

@end
