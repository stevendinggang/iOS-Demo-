//
//  XMHView.m
//  XMHDragView
//
//  Created by 徐茂怀 on 15/12/31.
//  Copyright © 2015年 徐茂怀. All rights reserved.
//

#import "XMHView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface XMHView ()
@property(nonatomic, strong) UIView *dotOne;    //这是个小点,向下滑动时改变其Point,从而绘制贝塞尔曲线
@property(nonatomic, assign) CGFloat dotOneX;   //dotOne的x坐标,当滑动时会改变
@property(nonatomic, assign) CGFloat dotOneY;   //dotOne的y坐标,当滑动时会改变
@property(nonatomic, strong) CAShapeLayer *dotOneShapeLayer;//这是滑动时出现的那个曲面


/**下面的和上面的对应,上面是向下滑动时的点,下面是向右滑动时的点*/
@property(nonatomic, assign) CGFloat maxWidth;
@property(nonatomic, strong) UIView *dotTwo;
@property(nonatomic, assign) CGFloat dotTwoX;
@property(nonatomic, assign) CGFloat dotTwoY;
@property(nonatomic, strong) CAShapeLayer *dotTwoShapeLayer;
@property(nonatomic, strong) CADisplayLink *dotTwoDisPlayLink;

@property(nonatomic, assign)BOOL isAnimating;
@property(nonatomic, strong) CADisplayLink *disPlayLink;//这相当于一个定时器,不同于NSTimer的是NSTimer一旦初始化它就开始运行，而CADisplayLink需要将显示链接添加到一个运行循环中，即用于处理系统事件的一个Cocoa Touch结构,还有就是NSTimer我们通常会用在背景计算，更新一些数值资料，而如果牵涉到画面的更新，动画过程的演变，我们通常会用CADisplayLink。

@end
@implementation XMHView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = .4;
        [self addGesture];
        [self configDotView];
        [self initShapeLayer];
        [self updateShapeLayerPath];
    }
    return self;
}
#pragma mark-添加手势和displaylink
-(void)addGesture
{
    _isAnimating = NO;//是否处于动画状态
    // 添加滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanAction:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:pan];
    
    // CADisplayLink默认每秒运行60次calculatePath是算出在运行期间_curveView的坐标，从而确定_shapeLayer的形状
    _disPlayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(calculatePath)];
    [_disPlayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];//之前说过CADisplayLink需要添加到运行时中
    _disPlayLink.paused = YES;
    
}

#pragma mark -初始化shapeLayer并将其颜色设置为灰色
-(void)initShapeLayer
{
    
    _dotOneShapeLayer = [CAShapeLayer layer];
    _dotOneShapeLayer.fillColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:_dotOneShapeLayer];
    
    _dotTwoShapeLayer = [CAShapeLayer layer];
    _dotTwoShapeLayer.fillColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:_dotTwoShapeLayer];
}

#pragma mark -初始化2个小点
- (void)configDotView
{
    _dotOne = [[UIView alloc] initWithFrame:CGRectMake(WIDTH / 2.0, 0, 3, 3)];
    _dotTwo = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT / 2, 3, 3)];
    [self addSubview:_dotOne];
    [self addSubview:_dotTwo];
}

#pragma  mark -当滑动时改变小点的point
- (void)handlePanAction:(UIPanGestureRecognizer *)pan
{
    if(!_isAnimating)
    {
        if(pan.state == UIGestureRecognizerStateChanged)
        {
            
            CGPoint point = [pan translationInView:self];
            
            // 这部分代码使dotOne跟着手势走
            CGFloat dotOneHeight = point.y * 0.7;
            _dotOneX = WIDTH / 2.0 + point.x;
            _dotOneY = dotOneHeight ;
            _dotOne.frame = CGRectMake(_dotOneX,_dotOneY,_dotOne.frame.size.width,_dotOne.frame.size.height);
            
            // 根据r5的坐标,更新_shapeLayer形状
            CGFloat dotTwoWidth = point.x * 0.7 ;
            _dotTwoX = dotTwoWidth;
            _dotTwoY = HEIGHT / 2.0 + point.y;
            _dotTwo.frame = CGRectMake(_dotTwoX, _dotTwoY, _dotTwo.frame.size.width, _dotTwo.frame.size.height);
            
            [self updateShapeLayerPath];//当小点point改变,各自的shaplayer也会跟着变
            
        }
        else if (pan.state == UIGestureRecognizerStateCancelled ||
                 pan.state == UIGestureRecognizerStateEnded ||
                 pan.state == UIGestureRecognizerStateFailed)
        {
            // 手势结束时,_shapeLayer返回原状并产生弹簧动效
            _isAnimating = YES;
            _disPlayLink.paused = NO;           //开启displaylink,会执行方法calculatePath.
            // 弹簧动效,因为各自的shapelayer是根据各自的点动,当小点有弹簧效果,那么shapelayer也会有弹簧效果
            [UIView animateWithDuration:1.0
                                  delay:0.0
                 usingSpringWithDamping:1.0
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 _dotOne.frame = CGRectMake(WIDTH / 2.0, 0, 3, 3);
                                 _dotTwo.frame = CGRectMake(0, HEIGHT / 2.0, 3, 3);
                             } completion:^(BOOL finished) {
                                 if(finished)
                                 {
                                     _disPlayLink.paused = YES;
                                     _isAnimating = NO;
                                 }
                             }];
        }
    }
}

- (void)updateShapeLayerPath
{
    // 更新_shapeLayer形状,贝塞尔曲线其实就是根据一天直线和一个点描绘出一条曲线,以向下滑动为例,首先确定一条直线,这条直线就是从(0,0)到(WIDTH,0)这个线,然后就可以根据dotOne的point去描绘这条曲线了
    UIBezierPath *dotOnePath = [UIBezierPath bezierPath];
    [dotOnePath moveToPoint:CGPointMake(0, 0)];
    [dotOnePath addLineToPoint:CGPointMake(WIDTH, 0)];
    [dotOnePath addQuadCurveToPoint:CGPointMake(0, 0)
                  controlPoint:CGPointMake(_dotOneX, _dotOneY)];
    [dotOnePath closePath];
    _dotOneShapeLayer.path = dotOnePath.CGPath;
    
    UIBezierPath *dotTwoPath = [UIBezierPath bezierPath];
    [dotTwoPath moveToPoint:CGPointMake(0, 0)];
    [dotTwoPath addLineToPoint:CGPointMake(0, HEIGHT)];
    [dotTwoPath addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(_dotTwoX, _dotTwoY)];
    [dotTwoPath closePath];
    _dotTwoShapeLayer.path = dotTwoPath.CGPath;
}

- (void)calculatePath
{
    // 由于手势结束时,dotOne和dotTwo执行了一个UIView的弹簧动画,把这个过程的坐标记录下来,并相应的画出各自的shapeLayer形状
    CALayer *dotOnelayer = _dotOne.layer.presentationLayer;
    _dotOneX = dotOnelayer.position.x;
    _dotOneY = dotOnelayer.position.y;
    
    CALayer *dotTwoLayer = _dotTwo.layer.presentationLayer;
    _dotTwoX = dotTwoLayer.position.x;
    _dotTwoY = dotTwoLayer.position.y;
    [self updateShapeLayerPath];
}


@end
