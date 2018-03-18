//
//  MSKBuyCarCell.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/27.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "MSKBuyCarCell.h"
#import <ReactiveCocoa.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MSKCellScrollView.h"
#define ORIGENX 60
@interface MSKBuyCarCell()<UITextFieldDelegate>{
    
    __weak IBOutlet UILabel *priceLabel;
    __weak IBOutlet UIButton *addGoodNumBtn;
    __weak IBOutlet UITextField *buyNumField;
    __weak IBOutlet UIButton *minusBtn;
    __weak IBOutlet UILabel *goodName;
    __weak IBOutlet UIButton *selectedBtn;
    __weak IBOutlet UIImageView *goodImg;
    __weak IBOutlet UIScrollView *backScrollView;
    UIButton *deleteBtn;
    //蒙板
    UIButton *maskBtn;
    MSKCellScrollView *mskCellScrollView;
}
@property (nonatomic,strong) MSKCarViewModel *currentModel;
@end

@implementation MSKBuyCarCell

- (void)awakeFromNib {
    buyNumField.delegate = self;
    RAC(minusBtn,enabled) = [RACObserve(buyNumField , text) map:^NSNumber *(NSString *text) {
        return  text.intValue > 1 ? @(YES):@(NO);
    }];
    
    RACSignal *keySign = [self rac_signalForSelector:@selector(textFieldDidEndEditing:) fromProtocol:@protocol(UITextFieldDelegate)];
    
    [keySign subscribeNext:^(id x) {
        RACTuple *tuple = (RACTuple*)x;
        UITextField *field = [tuple first];
        if (!field.text || field.text.length == 0) {
            field.text = @"1";
        }
        buyNumField.text = field.text;
        NSLog(@"%@",field.text);
        [self resetCalculation:buyNumField.text];
    }];
    
    //选中/取消选中
    [[selectedBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *button) {
        selectedBtn.selected = !selectedBtn.selected;
        self.currentModel.goodSeleted = selectedBtn.selected;
        [self calculation];
    }];
    
    //加
    [[addGoodNumBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        buyNumField.text = [NSString stringWithFormat:@"%d",buyNumField.text.intValue + 1];
        [self resetCalculation:buyNumField.text];
    }];
    
    //减
    [[minusBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        buyNumField.text = [NSString stringWithFormat:@"%d",buyNumField.text.intValue - 1];
        [self resetCalculation:buyNumField.text];
    }];
    
    //初始化
    @weakify(self)
    RACSignal *modelSing = RACObserve(self, currentModel);
    [modelSing subscribeNext:^(id x) {
        @strongify(self)
        [self restCarViewModel:self.currentModel];
    }];
  
    //用户滑动
    RACSignal *styleSignal = RACObserve(self, editingStyle);
    [styleSignal subscribeNext:^(NSNumber *styleType) {
        if (styleType.intValue == UITableViewCellEditingStyleDelete) {
            deleteBtn.hidden = YES;
        }
    }];
}

-(void)setCarViewModel:(MSKCarViewModel *)carViewModel{
    if (!deleteBtn) {
        backScrollView.frame = CGRectMake(0, 0, self.bounds.size.width + ORIGENX, 148);
        deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        deleteBtn.frame = CGRectMake(self.bounds.size.width+0, 0, ORIGENX, self.bounds.size.height);
        [deleteBtn setBackgroundColor:[UIColor redColor]];
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        deleteBtn.hidden = YES;
        [backScrollView addSubview:deleteBtn];
        [[deleteBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            if (self.deleteCarGood) {
                self.isDelete = YES;
                self.deleteCarGood();
            }
        }];
    }
    
    if (!maskBtn) {
        maskBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        maskBtn.frame = CGRectMake(0, 0, backScrollView.bounds.size.width - ORIGENX, 148);
        maskBtn.hidden = YES;
        [backScrollView addSubview:maskBtn];
        [[maskBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            if(self.currentModel.isShowCanDelete && !deleteBtn.hidden){
                __block CGRect  rect = backScrollView.frame;
                rect.origin.x = 0;
                [UIView animateWithDuration:0.3f animations:^{
                    backScrollView.frame = rect;
                } completion:^(BOOL finished) {
                    self.currentModel.isShowCanDelete = NO;
                    deleteBtn.hidden = YES;
                    maskBtn.hidden = YES;
                }];
            }
        }];
    }
    self.currentModel = carViewModel;
 }

-(void)restCarViewModel:(MSKCarViewModel *)carViewModel{
    priceLabel.text = self.currentModel.goodPrice;
    goodName.text = self.currentModel.goodName;
    buyNumField.text = self.currentModel.buyNumber;
    selectedBtn.selected = self.currentModel.goodSeleted;
    goodImg.hidden = NO;
    mskCellScrollView.hidden = YES;
    if (carViewModel.carModel.groupGoods && carViewModel.carModel.groupGoods.count > 0) {
        goodImg.hidden = YES;
        mskCellScrollView.hidden = NO;
        if (!mskCellScrollView) {
            mskCellScrollView = [[MSKCellScrollView alloc] initWithFrame:CGRectMake(goodImg.frame.origin.x  + 5, 0, self.bounds.size.width - selectedBtn.frame.size.width - selectedBtn.frame.origin.x - 5, 74)];
            mskCellScrollView.center = CGPointMake(mskCellScrollView.center.x, self.bounds.size.height / 2.0f);
            
            [backScrollView addSubview:mskCellScrollView];
        }
        [mskCellScrollView initsubmodels:carViewModel.carModel.groupGoods];
    }else{
        [goodImg sd_setImageWithURL:[NSURL URLWithString:carViewModel.carModel.goodImg] placeholderImage:[UIImage imageNamed:@"defaulterProduct"]];
    }
    [backScrollView bringSubviewToFront:maskBtn];
    [backScrollView bringSubviewToFront:deleteBtn];
    maskBtn.hidden = !self.currentModel.isShowCanDelete;
    if (self.currentModel.isShowCanDelete) {
        deleteBtn.hidden = NO;
        __block CGRect  rect = backScrollView.frame;
        if (rect.origin.x != -ORIGENX) {
            rect.origin.x = -ORIGENX;
            [UIView animateWithDuration:0.3f animations:^{
                backScrollView.frame = rect;
            } completion:^(BOOL finished) {
                
            }];
        }
    }else if(!self.currentModel.isShowCanDelete && !deleteBtn.hidden){
        __block CGRect  rect = backScrollView.frame;
        if (rect.origin.x != 0) {
            rect.origin.x = 0;
            [UIView animateWithDuration:0.3f animations:^{
                backScrollView.frame = rect;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}

/**
 *  加、减
 *
 *  @param text 文本
 */
-(void)resetCalculation:(NSString *)text{
    if (!selectedBtn.selected) {
        selectedBtn.selected = !selectedBtn.selected;
        self.currentModel.goodSeleted = selectedBtn.selected;
    }
    self.currentModel.buyNumber = text;
    [self calculation];
}

/**
 *  计算
 *
 *  @param number 勾选或取消
 */
-(void)calculation{
    if (self.calculationBlock) {
        self.calculationBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
