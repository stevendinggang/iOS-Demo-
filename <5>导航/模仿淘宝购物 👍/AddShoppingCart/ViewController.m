//
//  ViewController.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/3/23.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+NavBarHidden.h"
#import "ChoseView.h"
#import "GoodsDetailView.h"
#import "BottomView.h"
@interface ViewController ()<UITextFieldDelegate,UIScrollViewDelegate>
{
    //尺寸选择所需对象
    ChoseView *choseView;
    //UIView *bgview;
    CGPoint center;
    NSArray *sizearr;//型号数组
    NSArray *colorarr;//分类数组
    NSDictionary *stockdic;//商品库存量
    int goodsStock;
    //详情页所需对象
    GoodsDetailView *goodsDetail;
    BottomView *bottomView;
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    /**
     这些数据应该从服务器获得 没有服务器我就只能先写死这些数据了
     */
    sizearr = [[NSArray alloc] initWithObjects:@"S",@"M",@"L",nil];
    colorarr = [[NSArray alloc] initWithObjects:@"蓝色",@"红色",@"湖蓝色",@"咖啡色",nil];
    NSString *str = [[NSBundle mainBundle] pathForResource: @"stock" ofType:@"plist"];
    stockdic = [[NSDictionary alloc] initWithContentsOfURL:[NSURL fileURLWithPath:str]];
    
    //1.设置当有导航栏自动添加64的高度的属性为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //2.设置导航条内容
    [self setUpNavBar];
    
    //3.导航条上的自定义的子标签是否需要跟着隐藏.
    self.isTitleAlpha = YES;
   // self.isLeftAlpha = YES;
    
   
    [self initview];
    
    //5.告诉程序是根据哪个scrollView的滚动来控制状态栏的变化
    self.keyScrollView = goodsDetail;
    
    
}
#pragma mark-method

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self setInViewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self setInViewWillDisappear];
}


#pragma mark - UI设置


- (void)setUpNavBar{
   
    
//    UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:addBtn];
    UILabel * titleLabel =[[UILabel alloc]init];
    titleLabel.text = @"商品详情";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
  

}

-(void)initview
{
    self.view.backgroundColor = [UIColor blackColor];
    [self initBottomView];
    [self initDetailView];
    [self initChoseView];
}
-(void)initBottomView
{
    bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-64-47, self.view.frame.size.width, 47)];
    [self.view addSubview:bottomView];
    [bottomView.bt_service addTarget:self action:@selector(seleteService) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_shop addTarget:self action:@selector(seleteShop) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_collection addTarget:self action:@selector(seleteCollection:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_addBasket addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_buyNow addTarget:self action:@selector(seleteBuy) forControlEvents:UIControlEventTouchUpInside];
}
-(void)initDetailView
{
     NSLog(@"%.f",self.view.frame.size.height);
    //宝贝图片数组
    NSArray *imgarr = [[NSArray alloc] initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg", nil];
    goodsDetail = [[GoodsDetailView alloc] initWithFrame:CGRectMake(0, -64, self.view.frame.size.width, bottomView.frame.origin.y + 64) andImageArr:imgarr];
    goodsDetail.delegate = self;
    [self.view addSubview:goodsDetail];
    //宝贝详情内容
    [goodsDetail initdata:[NSDictionary dictionary]];
    
    [goodsDetail.bt_addSize addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [goodsDetail.bt_judge addTarget:self action:@selector(goodsJudge) forControlEvents:UIControlEventTouchUpInside];
    [goodsDetail.bt_shop addTarget:self action:@selector(seleteShop) forControlEvents:UIControlEventTouchUpInside];
    [goodsDetail.bt_share addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    //图文详情webview的网址
    [goodsDetail initWebScro:@[@"http://www.cocoachina.com",@"http://www.baidu.com",@"http://code.cocoachina.com"]];
}
/**
 *  初始化弹出视图
 */
-(void)initChoseView
{
    //选择尺码颜色的视图
    choseView = [[ChoseView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:choseView];
    [choseView.bt_cancle addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [choseView.bt_sure addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [choseView initTypeView:sizearr :colorarr :stockdic];
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [choseView.alphaiView addGestureRecognizer:tap];
    
}
#pragma mark-bottom action
-(void)seleteService
{
 [self showAlert:@"点击客服"];
}
-(void)seleteShop
{
    [self showAlert:@"进入店铺"];
}
-(void)seleteCollection:(UIButton *)btn
{
    if (btn.selected) {
        btn.selected = NO;
        [self showAlert:@"取消收藏"];
    }else
    {
        btn.selected = YES;
        [self showAlert:@"已收藏"];
    }
}
-(void)seleteBuy
{
    [self showAlert:@"立即购买"];
}
#pragma mark-goosdetail action
-(void)share
{
    [self showAlert:@"分享"];
}
-(void)goodsJudge
{
    [self showAlert:@"宝贝评价"];
}
#pragma mark-action
/**
 *  点击按钮弹出
 */
-(void)show
{
    center = goodsDetail.center;
    center.y -= 64;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        
        goodsDetail.center = center;
        goodsDetail.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);

        choseView.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion: nil];


}
/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    center.y += 64;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        choseView.frame =CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        goodsDetail.center = center;
        goodsDetail.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        goodsDetail.bt_addSize.headLabel.text = choseView.lb_detail.text;
    } completion: nil];

}
-(void)sure
{
    [self dismiss];
    [self showAlert:@"已经加入购物车"];
}
-(void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}
#pragma mark-scro
#warning 监听滚动,调用框架接口
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //rate将决定颜色变化程度,值越大,颜色变化越明显,rate的取值范围是0.01 - 0.999999
    if (scrollView == goodsDetail) {
        [self scrollControlByOffsetY:200];
    }
   
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView == goodsDetail)
 {
     if (goodsDetail.contentOffset.y>100) {
         [UIView animateWithDuration: 0.25 animations: ^{
             goodsDetail.contentSize = CGSizeMake(self.view.frame.size.width, goodsDetail.webscro.frame.size.height+goodsDetail.webscro.frame.origin.y);
             
             goodsDetail.contentOffset =CGPointMake(0, goodsDetail.webscro.frame.origin.y-64) ;
             goodsDetail.scrollEnabled = NO;
             [goodsDetail.webscro._header endRefreshing];
         } completion: nil];
         
     }
 }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
