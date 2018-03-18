//
//  MainViewController.m
//  vipshop
//
//  Created by Mind is important  on 15/12/15.
//  Copyright (c) 2015年 iovo. All rights reserved.
//

#import "MainViewController.h"
#import "CenterViewController.h"
#import "LeftViewController.h"
#import "MYNavigationController.h"
@interface MainViewController ()<CenterViewControllerCheckleftBarButtonItemDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) CenterViewController *centerViewController;
@property (nonatomic, strong) LeftViewController *leftViewController;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, assign) CGPoint panGestureStartLocation;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) CenterViewController *oldCenterViewController;
@property (nonatomic, strong) UIButton *tapCloseButton;
@end

@implementation MainViewController
- (instancetype)initWithCenterViewController:(CenterViewController*)centerCtl leftViewController:(LeftViewController*)leftCtl
{
    if (self = [super init]) {
        MYNavigationController *navCtl = [[MYNavigationController alloc]initWithRootViewController:centerCtl];
        self.centerViewController = (id)navCtl;
        self.leftViewController = leftCtl;
        self.oldCenterViewController = centerCtl;
        centerCtl.delegate = self;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCenterView];
}
- (void)setUpCenterView
{
    self.centerView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.centerViewController.view.bounds = self.view.bounds;
    [self.centerView addSubview:self.centerViewController.view];
    [self addChildViewController:self.centerViewController];
    [self.centerViewController didMoveToParentViewController:self];
    [self.view addSubview:self.centerView];
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureEvent:)];
    self.panGesture.delegate = self;
    [self.centerView addGestureRecognizer:self.panGesture];
}
#warning 实现有scrollView的向右划可行的原理就是 在滑动的那瞬间初始化滑动视图和手势 我觉得 他是把响应事件传给了UIPanGestureRecognizer手势 因为scrollView也是可以滑动的。
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]])
    {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer*)gestureRecognizer;
        CGFloat x = self.oldCenterViewController.mainScrollView.contentOffset.x;
        if ([pan velocityInView:self.view].x > 0.0f && x == 0.0f) {
            [self setUpCenterView];//如果没有他 刚开始那就没有手势
        }
    }
    return YES;
}
- (void)panGestureEvent:(UIPanGestureRecognizer*)panGesture
{
     UIGestureRecognizerState state = panGesture.state;
    CGPoint translation = [panGesture translationInView:self.view];
    CGPoint velocity = [panGesture velocityInView:self.view];
     switch (state) {
        case UIGestureRecognizerStateBegan:
            [self prepareingLeftView];
             break;
        case UIGestureRecognizerStateChanged:{
             static CGRect centerFrame;
             centerFrame = self.centerView.frame;
             centerFrame.origin.x += translation.x;
             if (centerFrame.origin.x < 0) {
                centerFrame.origin.x = 0;
             }
             self.centerView.frame = centerFrame;
             } break;
        case UIGestureRecognizerStateEnded:
        {
            //滑动结果(划少了 划多了) 动画效果处理
            if (self.centerView.frame.origin.x > 10 && velocity.x>0) {
                [self openingLeftController];
            }
            else
            {
                [self closeingLeftController];
            }
        } break;
        default:
            break;
    }
    [panGesture setTranslation:CGPointZero inView:self.view];
}
- (void)openingLeftController
{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:10 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.centerView.frame = CGRectMake(250, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        self.oldCenterViewController.mainScrollView.userInteractionEnabled = NO;
        self.tapCloseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.tapCloseButton.frame = self.view.bounds;
        [self.tapCloseButton addTarget:self action:@selector(closeingLeftController) forControlEvents:UIControlEventTouchUpInside];
        [self.centerView addSubview:self.tapCloseButton];
     }];
}

- (void)closeingLeftController
{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:10 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.centerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [self.leftViewController willMoveToParentViewController:nil];
        [self.leftViewController.view removeFromSuperview];
        [self.leftViewController removeFromParentViewController];
        [self.leftView removeFromSuperview];
        self.oldCenterViewController.mainScrollView.userInteractionEnabled = YES;
        [self.tapCloseButton removeFromSuperview
         ];
     }];
}

- (void)prepareingLeftView
{
    self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.leftViewController.view.frame = self.view.bounds;
    [self.leftView addSubview:self.leftViewController.view];
    [self addChildViewController:self.leftViewController];
    [self.leftViewController willMoveToParentViewController:self];
    [self.view insertSubview:self.leftView belowSubview:self.centerView];
}
#pragma mark - RootViewControllerCheckleftBarButtonItemDelegate
- (void)checkleftBarButtonItemRootViewController:(UIViewController *)viewController
{
    [self prepareingLeftView];
    self.centerView.frame.origin.x > 0 ? [self closeingLeftController]:[self openingLeftController];
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com