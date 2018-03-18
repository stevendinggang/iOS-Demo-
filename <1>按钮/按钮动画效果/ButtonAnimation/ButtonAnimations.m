//
//  ButtonAnimations.m
//  ButtonAnimation
//
//  Created by Baojia on 14/11/19.
//  Copyright (c) 2014年 Baojia. All rights reserved.
//

#import "ButtonAnimations.h"

@implementation ButtonAnimations
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBtToCar];
        
        
        
        
    }
    return self;
}
- (void)setNeedsDisplay:(NSArray *)priceArr
{
    [super setNeedsDisplay];
    [self createAnimation:priceArr];
    NSLog(@"%@", priceArr);
}

- (void)createBtToCar
{
    UIFont *font = [UIFont systemFontOfSize:10];
    
    UIButton *toCar = [UIButton buttonWithType:UIButtonTypeCustom];
    [toCar setFrame:CGRectMake(55, 3, 48, 48)];
    [toCar setTag:1];
    [toCar.layer setMasksToBounds:YES];
    [toCar.layer setBorderWidth:0];
    [toCar.layer setCornerRadius:24];
    [toCar setBackgroundImage:[UIImage imageNamed:@"image_ziqu_2.png"] forState:UIControlStateNormal];
    [toCar setTintColor:[UIColor blueColor]];
    
    
    [toCar addTarget:self action:@selector(toCarAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:toCar];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, toCar.frame.size.height +toCar.frame.origin.y, 48, 25)];
    [label setFont:font];
    label.tag = 11;
    [label setTextColor:[UIColor blackColor]];
    [label setText:@"Label1"];
    [self addSubview:label];
    
    UIButton *Cowner_toCar = [UIButton buttonWithType:UIButtonTypeSystem];
    [Cowner_toCar.titleLabel setFont:font];
    [Cowner_toCar setFrame:CGRectMake(215, 3, 48, 48)];
    [Cowner_toCar setTag:100];
    Cowner_toCar.alpha = 1;
    [Cowner_toCar setBackgroundImage:[UIImage imageNamed:@"image_songche_1.png"] forState:UIControlStateNormal];
    //    [Cowner_toCar setTintColor:[UIColor blackColor]];
    [Cowner_toCar.layer setMasksToBounds:YES];
    [Cowner_toCar addTarget:self action:@selector(Cowner_toCarAction:) forControlEvents:UIControlEventTouchUpInside];
    [Cowner_toCar.layer setBorderWidth:0];
    [Cowner_toCar.layer setCornerRadius:24];
    [self addSubview:Cowner_toCar];
    UILabel *labelCowner = [[UILabel alloc] initWithFrame:CGRectMake(220, Cowner_toCar.frame.size.height +Cowner_toCar.frame.origin.y, 48, 25)];
    [labelCowner setFont:font];
    labelCowner.tag = 12;
    [labelCowner setTextColor:[UIColor blackColor]];
    [labelCowner setText:@"Label2"];
    [self addSubview:labelCowner];
    
}


//label1点击事件
- (void)toCarAction:(id)sender
{
    
    
    
    self.sendPrice = @"0";
    self.sendType = @"0";
    
    if (self.SendCarPriceBlock) {
        self.SendCarPriceBlock(self.sendType,self.sendPrice);
    }
    
    
    //点击label1 的同时 收起label2 的动画
    if (self.expanded == YES) {
        
        for (int i = 0; i < 3; i++) {
            UIButton *button = [self.arrbt objectAtIndex:i];
            
            [UIView animateWithDuration:0.2
                             animations:^{
                                 if (i != 3) {
                                     button.alpha = 0;
                                 }
                                 
                                 
                                 switch (i) {
                                     case 0:
                                         button.frame = CGRectMake(220, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     case 1:
                                         button.frame = CGRectMake(220, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     case 2:
                                         button.frame = CGRectMake(220,3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     default:
                                         break;
                                 }
                                 UIButton *toCar = (UIButton *)sender;
                                 [toCar setBackgroundImage:[UIImage imageNamed:@"image_ziqu_2.png"] forState:UIControlStateNormal];
                                 [toCar setFrame:CGRectMake(55, 3, 48, 48)];
                                 UIButton *cowner_car = (UIButton *)[self viewWithTag:100];
                                 cowner_car.alpha = 1;
                                 
                                 //                                 UIButton *toCar = (UIButton *)[self viewWithTag:1];
                                 //                                 [toCar setFrame:CGRectMake(55, 3, 48, 48)];
                                 
                                 UILabel *label = (UILabel *)[self viewWithTag:11];
                                 [label setFrame:CGRectMake(60, toCar.frame.size.height +toCar.frame.origin.y, 48, 25)];
                                 UILabel *labelCowner = (UILabel *)[self viewWithTag:12];
                                 //                                 labelCowner.alpha = 1;
                                 [labelCowner  setFrame:CGRectMake(220, toCar.frame.size.height +toCar.frame.origin.y, 48, 25)];
                                 
                                 //                                 UIButton *touchBt = (UIButton *)sender;
                                 //                                 touchBt.alpha = 1;
                                 //                                 [touchBt setBackgroundImage:[UIImage imageNamed:@"songche_3.png"] forState:UIControlStateNormal];
                                 
                                 
                             }];
            _expanded = NO;
        }
        
    }else{
        UIButton *toCar = (UIButton *)sender;
        [toCar setBackgroundImage:[UIImage imageNamed:@"image_ziqu_2.png"] forState:UIControlStateNormal];
        
        UIButton *cowner_car = (UIButton *)[self viewWithTag:100];
        cowner_car.alpha = 1;
        for (int i = 0; i < 3; i++) {
            UIButton *button = [self.arrbt objectAtIndex:i];
            button.alpha = 0;
        }
    }
    
}

- (void)createAnimation:(NSArray *)pricesArr
{
    UIFont *font = [UIFont systemFontOfSize:12];
    
    UIButton *twYuan = [UIButton buttonWithType:UIButtonTypeSystem];
    [twYuan.titleLabel setFont:font];
    [twYuan setFrame:CGRectMake(220, 3, 48, 48)];
    [twYuan setTag:97];
    [twYuan addTarget:self action:@selector(Cowner_toCarAction:) forControlEvents:UIControlEventTouchUpInside];
    twYuan.alpha = 0;
    NSString *twTitle = [pricesArr objectAtIndex:0];
    [twYuan setTitle:twTitle forState:UIControlStateNormal];
    [twYuan setTitleEdgeInsets:UIEdgeInsetsMake(-3, 0, 0, 0)];
    [twYuan setBackgroundImage:[UIImage imageNamed:@"songche_4.png"] forState:UIControlStateNormal];
    [self addSubview:twYuan];
    [twYuan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *fifYuan = [UIButton buttonWithType:UIButtonTypeSystem];
    NSString *fifTitle = [pricesArr objectAtIndex:1];
    [fifYuan setTitle:fifTitle forState:UIControlStateNormal];
    [fifYuan setTag:98];
    [fifYuan setFrame:CGRectMake(220, 3, 48, 48)];
    fifYuan.alpha = 0;
    [fifYuan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fifYuan addTarget:self action:@selector(Cowner_toCarAction:) forControlEvents:UIControlEventTouchUpInside];
    [fifYuan setBackgroundImage:[UIImage imageNamed:@"songche_4.png"] forState:UIControlStateNormal];
    [fifYuan.titleLabel setFont:font];
    [self addSubview:fifYuan];
    
    
    UIButton *yibaiYuan = [UIButton buttonWithType:UIButtonTypeSystem];
    [yibaiYuan setTitle:[pricesArr objectAtIndex:2] forState:UIControlStateNormal];
    [yibaiYuan setTag:99];
    [yibaiYuan setFrame:CGRectMake(220, 3, 48, 48)];
    yibaiYuan.alpha = 0;
    [yibaiYuan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [yibaiYuan addTarget:self action:@selector(Cowner_toCarAction:) forControlEvents:UIControlEventTouchUpInside];
    [yibaiYuan setBackgroundImage:[UIImage imageNamed:@"songche_4.png"] forState:UIControlStateNormal];
    [yibaiYuan.titleLabel setFont:font];
    [self addSubview:yibaiYuan];
    
    
    
    
    self.arrbt = [NSArray arrayWithObjects:twYuan, fifYuan, yibaiYuan, nil];
    
    
    
    
}

//label2点击事件
- (void)Cowner_toCarAction:(UIButton *)sender
{
    UIButton *toCar = (UIButton *)[self viewWithTag:1];
    [toCar setBackgroundImage:[UIImage imageNamed:@"image_ziqu_1.png"] forState:UIControlStateNormal];
    
    //展开动画
    if (!self.expanded) {
        for (int i = 0; i < 3; i++) {
            
            UIButton *button = [self.arrbt objectAtIndex:i];
            if (button != (UIButton *)sender) {
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageNamed:@"songche_4.png"] forState:UIControlStateNormal];
            }
            
            
            
            [UIView animateWithDuration:0.2
                             animations:^{
                                 if (i != 3) {
                                     button.alpha = 1;
                                 }
                                 
                                 
                                 switch (i) {
                                     case 0:
                                         button.frame = CGRectMake(i * 48+100, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     case 1:
                                         button.frame = CGRectMake(i * 48 + 25 + 100, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     case 2:
                                         button.frame = CGRectMake(i * 48 + 50 + 100, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     default:
                                         break;
                                 }
                                 UIButton *cowner_car = (UIButton *)[self viewWithTag:100];
                                 cowner_car.alpha = 0;
                                 UIButton *toCar = (UIButton *)[self viewWithTag:1];
                                 [toCar setFrame:CGRectMake(30, 3, 48, 48)];
                                 
                                 UILabel *label = (UILabel *)[self viewWithTag:11];
                                 [label setFrame:CGRectMake(34, toCar.frame.size.height +toCar.frame.origin.y, 48, 25)];
                                 
                                 UILabel *labelCowner = (UILabel *)[self viewWithTag:12];
                                 //                         labelCowner.alpha = 0;
                                 labelCowner.frame = CGRectMake(2 * 48 + 50 + 103, toCar.frame.size.height +toCar.frame.origin.y, 48, 25);
                                 
                             } completion:^(BOOL finished) {
                                 
                             }];
            _expanded = YES;
        }
    }else {
        //收起动画
        for (int i = 0; i < 3; i++) {
            UIButton *button = [self.arrbt objectAtIndex:i];
            
            [UIView animateWithDuration:0.2
                             animations:^{
                                 if (i != 3) {
                                     button.alpha = 0;
                                 }
                                 
                                 
                                 switch (i) {
                                     case 0:
                                         button.frame = CGRectMake(215, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     case 1:
                                         button.frame = CGRectMake(215, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     case 2:
                                         button.frame = CGRectMake(215, 3, 48, 48);
                                         NSLog(@"%f", button.frame.origin.x);
                                         break;
                                     default:
                                         break;
                                 }
                                 
                                 
                                 UIButton *toCar = (UIButton *)[self viewWithTag:1];
                                 [toCar setFrame:CGRectMake(55, 3, 48, 48)];
                                 
                                 UILabel *label = (UILabel *)[self viewWithTag:11];
                                 [label setFrame:CGRectMake(60, toCar.frame.size.height +toCar.frame.origin.y, 48, 25)];
                                 
                                 UIButton *touchBt = (UIButton *)sender;
                                 touchBt.alpha = 1;
                                 [touchBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                                 [touchBt setBackgroundImage:[UIImage imageNamed:@"songche_3.png"] forState:UIControlStateNormal];
                                 
                                 UILabel *labelCowner = (UILabel *)[self viewWithTag:12];
                                 
                                 [labelCowner  setFrame:CGRectMake(220, toCar.frame.size.height +toCar.frame.origin.y, 48, 25)];
                             }];
            _expanded = NO;
        }
        UIButton *touchBt = (UIButton *)sender;
        self.sendType = @"1";
        self.sendPrice = [NSString stringWithFormat:@"%@", touchBt.titleLabel.text];
        NSLog(@"%@", touchBt.titleLabel.text);
        
        if (self.SendCarPriceBlock) {

            self.SendCarPriceBlock(self.sendType,self.sendPrice);
        }
        
        
    }
    
    
    
}

//Block回调
- (void)sendCar:(void (^)(NSString *sendType, NSString *sendPrice))block
{
    self.SendCarPriceBlock = block;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
