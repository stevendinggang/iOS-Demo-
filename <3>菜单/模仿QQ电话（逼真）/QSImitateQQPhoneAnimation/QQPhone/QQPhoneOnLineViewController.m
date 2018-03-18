//
//  QQPhoneOnLineViewController.m
//  QSImitateQQPhoneAnimation
//
//  Created by JosQiao on 16/5/19.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#define WIDTH 240

#define SCALE (568.0/[UIScreen mainScreen].bounds.size.height)

#import "QQPhoneOnLineViewController.h"
#import "QQPhoneTransition.h"

@interface QQPhoneOnLineViewController ()<UIViewControllerTransitioningDelegate>

/** 波浪图层 */
@property(nonatomic,strong) CAShapeLayer * layer;
/** 波浪图层 */
@property(nonatomic,strong) CAShapeLayer * layer1;
/** 波浪图层 */
@property(nonatomic,strong) CAShapeLayer * layer2;



@end

@implementation QQPhoneOnLineViewController

- (void)dealloc
{
    NSLog(@"online销毁");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置第一次电话图标的位置
    self.lastDismissPoint = CGPointMake([UIScreen mainScreen].bounds.size.width - 50, [UIScreen mainScreen].bounds.size.height - 90);
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.viewTop];
    [self.view addSubview:self.viewBottom];
    
    CGFloat topHeight = 280.0 / SCALE;
    CGFloat bottomHeight = 160.0 / SCALE;
    
    self.viewTop.frame = CGRectMake(0, 0, self.view.bounds.size.width, topHeight);
    self.viewBottom.frame = CGRectMake(0, self.view.bounds.size.height - bottomHeight, self.view.bounds.size.width, bottomHeight);
    
    //self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"11.png"].CGImage;
    
    self.layer = [CAShapeLayer layer];
    self.layer.fillColor = [UIColor clearColor].CGColor;
    self.layer.strokeColor = [UIColor colorWithRed:190/255.0 green:218/255.0 blue:226/255.0 alpha:0.3].CGColor;
    self.layer.lineCap = kCALineCapRound;
    
    self.layer1 = [CAShapeLayer layer];
    self.layer1.fillColor = [UIColor clearColor].CGColor;
    self.layer1.strokeColor = [UIColor colorWithRed:190/255.0 green:218/255.0 blue:226/255.0 alpha:0.6].CGColor;
    self.layer1.lineCap = kCALineCapRound;
    
    self.layer2 = [CAShapeLayer layer];
    self.layer2.fillColor = [UIColor clearColor].CGColor;
    self.layer2.strokeColor = [UIColor colorWithRed:190/255.0 green:218/255.0 blue:226/255.0 alpha:0.9].CGColor;
    self.layer2.lineCap = kCALineCapRound;
    
    
    CGFloat width = WIDTH;
    
    CGFloat width1 = 40;
    CGFloat width2 = 70;
    
    CGFloat centerY = 360.0 / SCALE;
    
    UIBezierPath *shapePath = [[UIBezierPath alloc] init];
    [shapePath moveToPoint:CGPointMake(-width, centerY)];
    
    UIBezierPath *shapePath1 = [[UIBezierPath alloc] init];
    [shapePath1 moveToPoint:CGPointMake(-width - width1, centerY)];
    
    UIBezierPath *shapePath2 = [[UIBezierPath alloc] init];
    [shapePath2 moveToPoint:CGPointMake(-width - width2, centerY)];
    
    
    CGFloat  x = 0;
    for (int i =0 ; i < 6; i++) {
        
        [shapePath addQuadCurveToPoint:CGPointMake(x - WIDTH / 2.0, centerY) controlPoint:CGPointMake(x - WIDTH + WIDTH/4.0, centerY - 8)];
        
        [shapePath addQuadCurveToPoint:CGPointMake(x, centerY) controlPoint:CGPointMake(x - WIDTH/4.0, centerY + 8)];
        
        [shapePath1 addQuadCurveToPoint:CGPointMake(x - width1 - WIDTH / 2.0, centerY) controlPoint:CGPointMake(x - width1 - WIDTH + WIDTH/4.0, centerY - 14)];
        [shapePath1 addQuadCurveToPoint:CGPointMake(x - width1, centerY) controlPoint:CGPointMake(x - width1 - WIDTH/4.0, centerY + 14)];
        
        
        [shapePath2 addQuadCurveToPoint:CGPointMake(x - width2 - WIDTH / 2.0, centerY) controlPoint:CGPointMake(x - width2 - WIDTH + WIDTH/4.0, centerY - 20)];
        [shapePath2 addQuadCurveToPoint:CGPointMake(x - width2, centerY) controlPoint:CGPointMake(x - width2 - WIDTH/4.0, centerY + 20)];
        x += width;
    }
    
    self.layer.path = shapePath.CGPath;
    self.layer1.path = shapePath1.CGPath;
    self.layer2.path = shapePath2.CGPath;
    
    
    [self.view.layer addSublayer:self.layer];
    [self.view.layer addSublayer:self.layer1];
    [self.view.layer addSublayer:self.layer2];
    
}


#pragma mark - Event

- (void)starLayerAnimation
{
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    animation1.duration = 1.0;
    animation1.repeatCount = INFINITY;
    animation1.keyPath = @"transform";
    animation1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(WIDTH, 0, 0)];
    
    [self.layer addAnimation:animation1 forKey:nil];
    [self.layer1 addAnimation:animation1 forKey:nil];
    [self.layer2 addAnimation:animation1 forKey:nil];
}

- (void)stopLayerAnimation
{
    [self.layer removeAllAnimations];
    [self.layer1 removeAllAnimations];
    [self.layer2 removeAllAnimations];
}


- (void)hangUpThePhone
{
    self.pressentType = QQPhoneTransitionPressentTypeNormal;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)packUpThePhone
{
    self.pressentType = QQPhoneTransitionPressentTypeMask;
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [QQPhoneTransition transitionWithQSTransitionType:QSTransitionTypeDismiss presentType:self.pressentType];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [QQPhoneTransition transitionWithQSTransitionType:QSTransitionTypePresent presentType:self.pressentType];
}




#pragma mark - getter
- (UIView *)viewTop
{
    if (!_viewTop) {
        _viewTop = [[UIView alloc] init];
        
        _viewTop.backgroundColor = [UIColor clearColor];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        lbl.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, 240.0/SCALE);
        lbl.textColor = [UIColor colorWithRed:61/255.0 green:169/255.0 blue:249/255.0 alpha:0.8];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.text = @"我是蓝天";
        
        [_viewTop addSubview:lbl];
        
        [_viewTop addSubview:self.imgIconView];
        self.imgIconView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, 160.0/SCALE);
        
    }
    return _viewTop;
}

- (UIImageView *)imgIconView
{
    if (!_imgIconView) {
        _imgIconView = [[UIImageView alloc] init];
        _imgIconView.frame = CGRectMake(0, 0, 140, 140);
        _imgIconView.image = [UIImage imageNamed:@"icon1.jpg"];
        _imgIconView.contentMode = UIViewContentModeScaleAspectFill;
        _imgIconView.layer.cornerRadius = 70;
        _imgIconView.layer.masksToBounds = YES;
        _imgIconView.backgroundColor = [UIColor cyanColor];
    }
    return _imgIconView;
}

- (UIView *)viewBottom
{
    if (!_viewBottom) {
        _viewBottom = [[UIView alloc] init];
        
        _viewBottom.backgroundColor = [UIColor clearColor];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 60, 60);
        btn.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0 - 60, 64);
        btn.layer.cornerRadius = 30;
        btn.layer.masksToBounds = YES;
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"挂断" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(hangUpThePhone) forControlEvents:UIControlEventTouchUpInside];
        [_viewBottom addSubview:btn];
        
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 60, 60);
        btn.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0 + 60, 64);
        btn.layer.cornerRadius = 30;
        btn.layer.masksToBounds = YES;
        btn.backgroundColor = [UIColor cyanColor];
        [btn setTitle:@"收起" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(packUpThePhone) forControlEvents:UIControlEventTouchUpInside];
        [_viewBottom addSubview:btn];
        
        
    }
    return _viewBottom;
}


@end
