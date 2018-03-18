
//
//  ImageWebview.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/14.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "ImageWebview.h"

@implementation ImageWebview
@synthesize  webview,_header;
-(instancetype)initWithFrame:(CGRect)frame andwebArr:(NSArray *)webArr
{
    self = [super initWithFrame:frame];
     if (self) {
         NSArray *titlearray = [[NSArray alloc] initWithObjects:@"图文详情",@"产品参数",@"店铺推荐", nil];
         for (int i = 0; i<3; i++) {
             
             UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
             btn.frame = CGRectMake(self.frame.size.width/3.0*i, 0, self.frame.size.width/3.0, 50);
             btn.backgroundColor = [UIColor whiteColor];
             btn.tag = 10+i;
             [btn addTarget:self action:@selector(selectbtn:) forControlEvents:UIControlEventTouchUpInside];
             [btn setTitle:[titlearray objectAtIndex:i] forState:0];
             [btn setTitleColor:[UIColor blackColor] forState:0];
             [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:195/255.0 blue:73/255.0 alpha:1] forState:UIControlStateSelected];
             [self addSubview:btn];
             if (i == 0) {
                 btn.selected = YES;
                 UILabel *line =[[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width/3.0, 1)];
                 line.tag = 15;
                 line.backgroundColor = [UIColor colorWithRed:255/255.0 green:195/255.0 blue:73/255.0 alpha:1];
                 [self addSubview:line];
             }else{
                 btn.selected = NO;
               
             }
         }

         webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, self.frame.size.height-60)];
         _header = [[MJRefreshHeaderView alloc] init];
        // _header.delegate = self;
         _header.scrollView = webview.scrollView;
         [self addSubview:webview];
         webarr = webArr;
         webview.delegate = self;
         webview.scalesPageToFit = YES;
         webview.dataDetectorTypes = UIDataDetectorTypeAll;
         NSURL *urlstr = [NSURL URLWithString:[webArr objectAtIndex:0]];
         //创建NSURLRequest 即网络请求
         NSURLRequest *request = [[NSURLRequest alloc]initWithURL: urlstr];
         //进行加载
         [webview loadRequest:request];
     }
    return self;
}
-(void)selectbtn:(UIButton *)btn
{
    selectindex = (int)btn.tag-10;
    btn.selected = YES;
    NSURL *urlstr = [NSURL URLWithString:[webarr objectAtIndex:selectindex]];
    //创建NSURLRequest 即网络请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL: urlstr];
    //进行加载
    [webview loadRequest:request];
    for (int i = 0; i<3; i++) {
        UIButton *button1 = (UIButton *)[self viewWithTag:10+i];
        
        if (i == selectindex ) {
            button1.selected = YES;
            UILabel *lab = (UILabel *)[self viewWithTag:15];
            CGRect frame = lab.frame;
            frame.origin.x = button1.frame.origin.x;
            [UIView animateWithDuration: 0.15 animations: ^{
                lab.frame = CGRectMake( self.frame.size.width/3.0*selectindex, 50, self.frame.size.width/3.0, 1);
            
            } completion: nil];
        }else{
            button1.selected = NO;
            
        }
    }
    
}
#pragma mark-web
//网页代理
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
