//
//  ViewController.m
//  SlideNav
//
//  Created by 赵贺 on 16/1/21.
//  Copyright © 2016年 赵贺. All rights reserved.
//

#import "ViewController.h"
#import "InsuranceController.h"
#import "UIView+Extension.h"

#pragma mark - 宏定义

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RandomColor Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))/** 随机色  */

static CGFloat const titleH = 44;/** 文字高度  */

static CGFloat const MaxScale = 1.2;/** 选中文字放大  */


@interface ViewController ()<UIScrollViewDelegate>
/** 文字scrollView  */
@property (nonatomic, strong) UIScrollView *titleScrollView;
/** 控制器scrollView  */
@property (nonatomic, strong) UIScrollView *contentScrollView;
/** 标签文字  */
@property (nonatomic ,strong) NSArray * titlesArr;
/** 标签按钮  */
@property (nonatomic, strong) NSMutableArray *buttons;
/** 选中的按钮  */
@property (nonatomic ,strong) UIButton * selectedBtn;
/** 选中的按钮背景图  */
@property (nonatomic ,strong) UIImageView * imageBackView;


@end

@implementation ViewController


#pragma mark lazy loading
- (NSMutableArray *)buttons
{
    if (!_buttons)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


-(NSArray *)titlesArr
{

    if (!_titlesArr) {
        _titlesArr  = [NSArray arrayWithObjects:@"建议书",@"投保书",@"待缴费",@"已预交",@"已承保",@"问题件",nil];
    }

    return _titlesArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController];    /** 添加子控制器视图  */
    
    [self setTitleScrollView];        /** 添加文字标签  */
    
    [self setContentScrollView];      /** 添加scrollView  */
    
    [self setupTitle];                /** 设置标签按钮 文字 背景图  */
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.contentScrollView.contentSize = CGSizeMake(self.titlesArr.count * ScreenW, 0);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.showsHorizontalScrollIndicator  = NO;
    self.contentScrollView.delegate = self;
    
}

#pragma mark - PRIVATE

-(void)addChildViewController{

    for (int i = 0; i<self.titlesArr.count; i++) {
        InsuranceController *vc  = [[InsuranceController alloc] init];
        vc.title  =  self.titlesArr[i];
        vc.view.backgroundColor = RandomColor;
        [self addChildViewController:vc];

    }

}
-(void)setTitleScrollView{

    CGRect rect  = CGRectMake(0, 64, ScreenW, titleH);
    self.titleScrollView = [[UIScrollView alloc] initWithFrame:rect];
    [self.view addSubview:self.titleScrollView];


}
-(void)setContentScrollView{

    CGFloat y  = CGRectGetMaxY(self.titleScrollView.frame);
    CGRect rect  = CGRectMake(0, y, ScreenW, ScreenH - titleH);
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:rect];
    [self.view addSubview:self.contentScrollView];
    

}

-(void)setupTitle{
    NSUInteger count = self.childViewControllers.count;
    
    CGFloat x = 0;
    CGFloat w = 80;
    CGFloat h = titleH;
    self.imageBackView  = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 80-10, titleH-10)];
    self.imageBackView.image = [UIImage imageNamed:@"b1"];
    self.imageBackView.backgroundColor = [UIColor whiteColor];
    self.imageBackView.userInteractionEnabled = YES;
    [self.titleScrollView addSubview:self.imageBackView];

    for (int i = 0; i < count; i++)
    {
        UIViewController *vc = self.childViewControllers[i];
        
        x = i * w;
        CGRect rect = CGRectMake(x, 0, w, h);
        UIButton *btn = [[UIButton alloc] initWithFrame:rect];
        
        btn.tag = i;
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        

        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        
        [self.buttons addObject:btn];
        [self.titleScrollView addSubview:btn];
        

        if (i == 0)
        {
            [self click:btn];
        }
        
    }
    self.titleScrollView.contentSize = CGSizeMake(count * w, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;

}
-(void)click:(UIButton *)sender{
    
    [self selectTitleBtn:sender];
    NSInteger i = sender.tag;
    CGFloat x  = i *ScreenW;
    self.contentScrollView.contentOffset = CGPointMake(x, 0);
    
    [self setUpOneChildController:i];


}

-(void)selectTitleBtn:(UIButton *)btn{


    [self.selectedBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.selectedBtn.transform = CGAffineTransformIdentity;
    

    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.transform = CGAffineTransformMakeScale(MaxScale, MaxScale);
    self.selectedBtn = btn;

    [self setupTitleCenter:btn];

}

-(void)setupTitleCenter:(UIButton *)sender
{

    CGFloat offset = sender.center.x - ScreenW * 0.5;
    if (offset < 0) {
        offset = 0;
    }
    CGFloat maxOffset  = self.titleScrollView.contentSize.width - ScreenW;
    if (offset > maxOffset) {
        offset = maxOffset;
    }
    [self.titleScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];

}

-(void)setUpOneChildController:(NSInteger)index{


    CGFloat x  = index * ScreenW;
    UIViewController *vc  =  self.childViewControllers[index];
    if (vc.view.superview) {
        return;
    }
    vc.view.frame = CGRectMake(x, 0, ScreenW, ScreenH - self.contentScrollView.frame.origin.y);
    [self.contentScrollView addSubview:vc.view];

}


#pragma mark - UIScrollView  delegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger i  = self.contentScrollView.contentOffset.x / ScreenW;
    [self selectTitleBtn:self.buttons[i]];
    [self setUpOneChildController:i];

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat offsetX  = scrollView.contentOffset.x;
    NSInteger leftIndex  = offsetX / ScreenW;
    NSInteger rightIdex  = leftIndex + 1;
    
    UIButton *leftButton = self.buttons[leftIndex];
    UIButton *rightButton  = nil;
    if (rightIdex < self.buttons.count) {
        rightButton  = self.buttons[rightIdex];
    }
    CGFloat scaleR  = offsetX / ScreenW - leftIndex;
    CGFloat scaleL  = 1 - scaleR;
    CGFloat transScale = MaxScale - 1;

    self.imageBackView.transform  = CGAffineTransformMakeTranslation((offsetX*(self.titleScrollView.contentSize.width / self.contentScrollView.contentSize.width)), 0);
    
    leftButton.transform = CGAffineTransformMakeScale(scaleL * transScale + 1, scaleL * transScale + 1);
    rightButton.transform = CGAffineTransformMakeScale(scaleR * transScale + 1, scaleR * transScale + 1);
    
    UIColor *rightColor = [UIColor colorWithRed:(174+66*scaleR)/255.0 green:(174-71*scaleR)/255.0 blue:(174-174*scaleR)/255.0 alpha:1];
    UIColor *leftColor = [UIColor colorWithRed:(174+66*scaleL)/255.0 green:(174-71*scaleL)/255.0 blue:(174-174*scaleL)/255.0 alpha:1];
    
    [leftButton setTitleColor:leftColor forState:UIControlStateNormal];
    [rightButton setTitleColor:rightColor forState:UIControlStateNormal];

}
@end






















