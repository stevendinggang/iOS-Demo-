//
//  QQPhoneTransition.m
//  QSImitateQQPhoneAnimation
//
//  Created by JosQiao on 16/5/19.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#import "QQPhoneTransition.h"
#import "QQPhoneViewController.h"

#import "QQPhoneView.h"

@interface QQPhoneTransition ()

/** transitionContext */
@property(nonatomic,strong)id <UIViewControllerContextTransitioning>tstContext;

/** 消失的试图控制器 */
@property(nonatomic,strong)UIViewController *fromVC;

/** 显示的视图控制器 */
@property(nonatomic,strong)UIViewController *toVC;

@end

@implementation QQPhoneTransition


+ (instancetype)transitionWithQSTransitionType:(QSTransitionType)transitionType presentType:(QQPhonePressentType)presentType
{
    QQPhoneTransition *transiton = [[self alloc] init];
    if (transiton) {
        transiton.transitionType = transitionType;
        transiton.pressetTyp = presentType;
    }
    return transiton;
}

- (void)dealloc
{
    NSLog(@"transition销毁");
}




- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.endRect = CGRectMake(100, 100, 100, 100);
        self.lastPoint = CGPointMake([UIScreen mainScreen].bounds.size.width - 50, [UIScreen mainScreen].bounds.size.height - 90);
        self.controlPoint = CGPointMake(self.lastPoint.x , self.endRect.origin.y + self.endRect.size.height);
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 2.0;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    switch (self.transitionType) {
        case QSTransitionTypeDismiss:
        {
            [self animateDismissTransition:transitionContext];
        }
            break;
        case QSTransitionTypePresent:
        {
            [self animatePresentTransition:transitionContext];
        }
            break;
            
        default:
            break;
    }
    

    
}


#pragma mark - 显示和消失动画
- (void)animatePresentTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    self.tstContext = transitionContext;
    
    self.toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UINavigationController *fromVC = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    self.fromVC = fromVC.viewControllers.lastObject;
        
    // 把新的试图控制器试图添加
    UIView *cView = [transitionContext containerView];
    [cView addSubview:_toVC.view];
    
    
    QQPhoneOnLineViewController *onlineVC = (QQPhoneOnLineViewController *)self.toVC;
    
    switch (self.pressetTyp) {
        case QQPhoneTransitionPressentTypeNormal:
        {
            
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
            animation.duration = 1.0;
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, -onlineVC.viewTop.bounds.size.height, 0)];
            animation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)];
            animation.delegate = self;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            
            [animation setValue:self.tstContext forKey:@"transitionContext"];
            [onlineVC.viewTop.layer addAnimation:animation forKey:nil];
            
            
            CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
            animation1.duration = 1.0;
            animation1.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0,onlineVC.viewBottom.bounds.size.height , 0)];
            animation1.byValue  = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, - onlineVC.viewBottom.bounds.size.height, 0)];
             animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
           
            [onlineVC.viewBottom.layer addAnimation:animation1 forKey:nil];
            
        }
            break;
        case QQPhoneTransitionPressentTypeMask:
        {
         
            QQPhoneView *phoneView = [[UIApplication sharedApplication].keyWindow viewWithTag:PHONE_VIEW_TAG];
            
            // 先隐藏新试图
            CALayer *maskLayer = [CALayer layer];
            maskLayer.frame = CGRectMake(0, 0, 0, 0);
            onlineVC.view.layer.mask = maskLayer;
            
            CGPoint starPoint = phoneView.center;
            CGPoint endPoint  = phoneView.firstCenter;
            
            CGPoint ancholPoint = CGPointMake(endPoint.x + (starPoint.x - endPoint.x)/2.0, endPoint.y);
            
            UIBezierPath *animPath = [[UIBezierPath alloc] init];
            [animPath moveToPoint:starPoint];
            [animPath addQuadCurveToPoint:endPoint controlPoint:ancholPoint];
            
            
            // 记录下phoneView消失的位置
            onlineVC.lastDismissPoint = starPoint;
            
            CAAnimationGroup *groupAnim = [self groupAnimationWithPath:animPath transform:CATransform3DMakeScale(1.0, 1.0, 1) duratio:1.0];
            
            groupAnim.removedOnCompletion = NO;
            groupAnim.fillMode = kCAFillModeForwards;
            groupAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [groupAnim setValue:self.tstContext forKey:@"transitionContext"];
            
            [phoneView.layer addAnimation:groupAnim forKey:@"keyAnim"];
        }
            break;
            
        default:
            break;
    }
    
    // 启动波浪动画
    [onlineVC starLayerAnimation];
}



- (void)animateDismissTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.tstContext = transitionContext;
    self.fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UINavigationController *toVC = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    QQPhoneViewController *temp = toVC.viewControllers.lastObject;
    self.toVC = temp;
    
    
    // 把电话按钮添加到 控制器
    //[temp.view addSubview:temp.btnOnLinePhone];
    //self.endRect = temp.btnOnLinePhone.frame;
    
    QQPhoneOnLineViewController *onlineVC = (QQPhoneOnLineViewController *)self.fromVC;
    
    // 获取keyWindow
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect currentRect = [window convertRect:onlineVC.imgIconView.frame fromWindow:window];
    self.endRect = currentRect;
    
    
    switch (self.pressetTyp) {
        case QQPhoneTransitionPressentTypeNormal:
        {
            
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
            animation.duration = 1.0;
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)];
            animation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, -onlineVC.viewTop.bounds.size.height, 0)];
            animation.delegate = self;
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [animation setValue:self.tstContext forKey:@"transitionContext"];
            [onlineVC.viewTop.layer addAnimation:animation forKey:nil];
            
            
            CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
            animation1.duration = 1.0;
            animation1.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0,0, 0)];
            animation1.byValue  = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0,onlineVC.viewBottom.bounds.size.height, 0)];
            animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            animation1.removedOnCompletion = NO;
            animation1.fillMode = kCAFillModeForwards;
            
            
            [onlineVC.viewBottom.layer addAnimation:animation1 forKey:nil];
            
            
            [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
                onlineVC.view.alpha = 0;
            } completion:nil];
            
        }
            break;
            
        case QQPhoneTransitionPressentTypeMask:
        {
            
            /**
             * 画两个圆路径
             */
            
            UIView *containerView = [transitionContext containerView];
            containerView.backgroundColor = [UIColor clearColor];
            // 对角线的一半作为半径
            CGFloat radius = sqrtf(containerView.frame.size.height * containerView.frame.size.height + containerView.frame.size.width * containerView.frame.size.width) / 2;
            
            UIBezierPath *startCycle = [UIBezierPath bezierPathWithArcCenter:containerView.center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            UIBezierPath *endCycle =  [UIBezierPath bezierPathWithOvalInRect:self.endRect];
            
            //创建CAShapeLayer进行遮盖
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.fillColor = [UIColor greenColor].CGColor;
            maskLayer.path = endCycle.CGPath;
            self.fromVC.view.layer.mask = maskLayer;
            
            //创建路径动画
            CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
            maskLayerAnimation.fromValue = (__bridge id)(startCycle.CGPath);
            maskLayerAnimation.toValue = (__bridge id)((endCycle.CGPath));
            maskLayerAnimation.duration = 1.0;//[self transitionDuration:transitionContext];
            maskLayerAnimation.delegate = self;
            maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            //    maskLayerAnimation.removedOnCompletion = NO;
            //    maskLayerAnimation.fillMode = kCAFillModeForwards;
            [maskLayerAnimation setValue:transitionContext forKey:@"transitionContext"];
            [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
            
        }
            break;
            
        default:
            break;
    }

}



#pragma mark - 显示和消失状态 动画结束


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    
    switch (self.transitionType) {
            
        case QSTransitionTypeDismiss:
        {
            [self animationDismissDidStop:anim finished:flag];
        }
            break;
        case QSTransitionTypePresent:
        {
            [self animationPresentDidStop:anim finished:flag];
        }
            break;
            
        default:
            break;
    }
}


- (void)animationDismissDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    QQPhoneOnLineViewController *onlineVC = (QQPhoneOnLineViewController *)self.fromVC;
    
    switch (self.pressetTyp) {
        case QQPhoneTransitionPressentTypeNormal:
        {
            
            [onlineVC.viewTop.layer removeAllAnimations];
            [onlineVC.viewBottom.layer removeAllAnimations];
            [self.tstContext completeTransition:YES];

        }
            break;
            
        case QQPhoneTransitionPressentTypeMask:
        {
            // 如果是第一段动画
            if ([anim valueForKey:@"transitionContext"] == self.tstContext) {
                
                QQPhoneView *imgPhotoView = [[QQPhoneView alloc] initWithFrame:self.endRect];
                
                imgPhotoView.firstCenter = imgPhotoView.center;
                imgPhotoView.userInteractionEnabled = YES;
                imgPhotoView.layer.cornerRadius = self.endRect.size.width/2.0;
                imgPhotoView.layer.masksToBounds = YES;
                imgPhotoView.backgroundColor = [UIColor cyanColor];
                imgPhotoView.tag = PHONE_VIEW_TAG;
                [[UIApplication sharedApplication].keyWindow addSubview:imgPhotoView];
                imgPhotoView.image = onlineVC.imgIconView.image;
                
                // 因为这个项目的跟试图控制器是导航控制器
                UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
                UIViewController *vc = nav.viewControllers.firstObject;
                
                UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:vc action:@selector(pan:)];
                [imgPhotoView addGestureRecognizer:pan];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:@selector(tap:)];
                [imgPhotoView addGestureRecognizer:tap];
                
                
                [self.tstContext completeTransition:YES];
                [self.tstContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
                
                CGPoint starPoint = CGPointMake(self.endRect.origin.x + self.endRect.size.width / 2.0, self.endRect.origin.y + self.endRect.size.height / 2.0);
                
                CGPoint endPoint = onlineVC.lastDismissPoint;
                
                CGPoint ancholPoint = CGPointMake(starPoint.x + (endPoint.x - starPoint.x)/2.0, starPoint.y);
                
                UIBezierPath *animPath = [[UIBezierPath alloc] init];
                [animPath moveToPoint:starPoint];
                [animPath addQuadCurveToPoint:endPoint controlPoint:ancholPoint];
                
                CAAnimationGroup *groupAnim = [self groupAnimationWithPath:animPath transform:CATransform3DMakeScale(0.5, 0.5, 1) duratio:1.0];
                groupAnim.removedOnCompletion = NO;
                groupAnim.fillMode = kCAFillModeForwards;
                
                [imgPhotoView.layer addAnimation:groupAnim forKey:@"keyAnim"];
                
            }else {
                
                UIImageView *imgView = [[UIApplication sharedApplication].keyWindow viewWithTag:PHONE_VIEW_TAG];
                [imgView.layer removeAllAnimations];
                imgView.center = onlineVC.lastDismissPoint;
                imgView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
            }

        }
            break;
            
        default:
            break;
    }
    
}


- (void)animationPresentDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
 
    // 如果是第一段动画
    if ([anim valueForKey:@"transitionContext"] == self.tstContext) {
        
        switch (self.pressetTyp) {
            case QQPhoneTransitionPressentTypeNormal:
            {
                [self.tstContext completeTransition:YES];
            }
                break;
            case QQPhoneTransitionPressentTypeMask:
            {
                QQPhoneView *phoneView = [[UIApplication sharedApplication].keyWindow viewWithTag:PHONE_VIEW_TAG];
                
                phoneView.layer.transform =  CATransform3DMakeScale(1, 1, 1);
                phoneView.center = phoneView.firstCenter;
                [phoneView.layer removeAllAnimations];
                
                UIView *containerView = [self.tstContext containerView];
                
                /**
                 * 画两个圆路径
                 */
                // 对角线的一半作为半径
                CGFloat radius = sqrtf(containerView.frame.size.height * containerView.frame.size.height + containerView.frame.size.width * containerView.frame.size.width) / 2;
                
                UIBezierPath *endCycle = [UIBezierPath bezierPathWithArcCenter:containerView.center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
                
                UIBezierPath *starCycle =  [UIBezierPath bezierPathWithOvalInRect:phoneView.frame];
                
                //创建CAShapeLayer进行遮盖
                CAShapeLayer *maskLayer = [CAShapeLayer layer];
                maskLayer.fillColor = [UIColor greenColor].CGColor;
                maskLayer.path = endCycle.CGPath;
                self.toVC.view.layer.mask = maskLayer;
                
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
                animation.duration = 1.0;
                animation.fromValue = (__bridge id)starCycle.CGPath;
                animation.toValue   = (__bridge id)endCycle.CGPath;
                animation.delegate = self;
                
                [maskLayer addAnimation:animation forKey:@"path"];
            }
                break;
                
            default:
                break;
        }
        
    }else {
        
        QQPhoneView *phoneView = [[UIApplication sharedApplication].keyWindow viewWithTag:PHONE_VIEW_TAG];
        [phoneView.layer removeAllAnimations];
        [phoneView removeFromSuperview];
        
        [self.tstContext completeTransition:YES];
        
        self.toVC.view.layer.mask = nil;
    }
    
}


- (CAAnimationGroup *)groupAnimationWithPath:(UIBezierPath *)path transform:(CATransform3D)transform duratio:(CFTimeInterval)duration
{

    // 关键路径动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = path.CGPath;
    
    // 尺寸动画
    CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotationAnim.toValue = [NSValue valueWithCATransform3D:transform];
    
    // 动画组
    CAAnimationGroup *groupAnim = [CAAnimationGroup animation];
    groupAnim.animations = @[keyAnimation,rotationAnim];
    
    groupAnim.delegate = self;
    groupAnim.duration = duration;
    
    groupAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    return groupAnim;
}












/*
 UIView *fromView = [self.tstContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
 
 CGFloat topDistance = fromView.center.y - self.endRect.origin.y + self.endRect.size.height/2;
 CGFloat leftDistance = fromView.center.x - self.endRect.origin.x + self.endRect.size.width/2;
 
 CGPoint endPoint = CGPointMake(self.lastRect.origin.x + self.lastRect.size.width/2 + leftDistance, topDistance + self.lastRect.origin.y + self.lastRect.size.height/2 );
 
 fromView.center = endPoint;
 */

/*
 id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
 
 [transitionContext completeTransition:YES];
 
 [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
 */


@end
