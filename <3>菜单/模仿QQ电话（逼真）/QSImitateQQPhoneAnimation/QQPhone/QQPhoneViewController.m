//
//  QQPhoneViewController.m
//  QSImitateQQPhoneAnimation
//
//  Created by JosQiao on 16/5/19.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#import "QQPhoneViewController.h"
#import "QQPhoneOnLineViewController.h"

@interface QQPhoneViewController ()

/** 电话按钮 */
@property(nonatomic,strong)UIButton *btnPhone;

@end

@implementation QQPhoneViewController

- (void)dealloc
{
    NSLog(@"xiaohui");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _firstCenter = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, 180);
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"back.jpg"].CGImage;
    
    [self.view addSubview:self.btnPhone];
}

#pragma mark - Life cycle

#pragma mark - UITableViewDelegate

#pragma mark - CustomDelegate

#pragma mark - Event response

- (void)btnPhonePressed:(UIButton *)btn
{
    QQPhoneOnLineViewController *qqOnlineVC = [[QQPhoneOnLineViewController alloc] init];
    
    if ([[UIApplication sharedApplication].keyWindow viewWithTag:PHONE_VIEW_TAG]) {
        
        qqOnlineVC.pressentType = QQPhoneTransitionPressentTypeMask;
        
    }else {
        
        qqOnlineVC.pressentType = QQPhoneTransitionPressentTypeNormal;
    }
    
    [self presentViewController:qqOnlineVC animated:YES completion:nil];
}


- (void)btnOnLinePhonePressed:(UIButton *)btn
{
    QQPhoneOnLineViewController *qqOnlineVC = [[QQPhoneOnLineViewController alloc] init];
     qqOnlineVC.pressentType = QQPhoneTransitionPressentTypeMask;
    [self presentViewController:qqOnlineVC animated:YES completion:nil];
}


- (void)pan:(UIPanGestureRecognizer *)pan
{
    
}



#pragma mark - Getter/Setter
- (UIButton *)btnPhone
{
    if (!_btnPhone) {
        
        _btnPhone = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _btnPhone.frame = CGRectMake(0, 0, 100, 40);
        _btnPhone.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0);
//        [_btnPhone setBackgroundImage:[UIImage imageNamed:@"phone1.jpg"] forState:UIControlStateNormal];
//        [_btnPhone setBackgroundImage:[UIImage imageNamed:@"phone1.jpg"] forState:UIControlStateHighlighted];
       
        [_btnPhone setTitle:@"QQ电话" forState:UIControlStateNormal];
        [_btnPhone setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _btnPhone.backgroundColor  = [UIColor cyanColor];
        
//        _btnPhone.layer.cornerRadius = 50;
//        _btnPhone.layer.masksToBounds = YES;
        
        [_btnPhone addTarget:self action:@selector(btnPhonePressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnPhone;
}

- (UIButton *)btnOnLinePhone
{
    if (!_btnOnLinePhone) {
        _btnOnLinePhone = [[UIButton alloc] init];
        
        _btnOnLinePhone.frame = CGRectMake(0, 0, 50, 50);
        _btnOnLinePhone.center = CGPointMake([UIScreen mainScreen].bounds.size.width - 50, [UIScreen mainScreen].bounds.size.height - 90);
        
        _btnOnLinePhone.backgroundColor = [UIColor cyanColor];
        [_btnOnLinePhone setBackgroundImage:[UIImage imageNamed:@"phone1.jpg"] forState:UIControlStateNormal];
        [_btnOnLinePhone setBackgroundImage:[UIImage imageNamed:@"phone1.jpg"] forState:UIControlStateHighlighted];
        _btnOnLinePhone.layer.cornerRadius = 25;
        _btnOnLinePhone.layer.masksToBounds = YES;
        
        [_btnOnLinePhone addTarget:self action:@selector(btnOnLinePhonePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [_btnOnLinePhone addGestureRecognizer:pan];
        
    }
    return _btnOnLinePhone;
}

@end
