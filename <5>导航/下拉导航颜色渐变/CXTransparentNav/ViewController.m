//
//  ViewController.m
//  CXTransparentNav
//
//  Created by artifeng on 16/1/14.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "ViewController.h"
#define Height [UIScreen mainScreen].bounds.size.height
#define Width [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView *mainTableView;
    UIImageView * imageView;
    UIView *view_bar;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    // self.myTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mainTableView.translatesAutoresizingMaskIntoConstraints=NO;

    
    mainTableView.delegate=self;//设置表视图外貌代理
   mainTableView.dataSource=self;
    

    [self.view addSubview:mainTableView];
    [self SetHeaderView];
    [self NavigationBa];
    

}
-(void)viewWillAppear:(BOOL)animated
{
    [self SetNavBarHidden:YES];
     [self SetHeaderView];
    
}

-(void) SetNavBarHidden:(BOOL) isHidden
{
    self.navigationController.navigationBarHidden = isHidden;
}
/**
 *  自定义Nav
 *
 *  @return UIView
 */
-(UIView*)NavigationBa
{
    view_bar =[[UIView alloc]init];
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>6.1)
    {
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44+20);
        
//        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44+20)];
//        imageV.image=[UIImage imageNamed:@"top"];
        
        //[view_bar addSubview:imageV];
        
    }else{
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44);
        
//        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//        imageV.image=[UIImage imageNamed:@"top"];
       //[view_bar addSubview:imageV];
    }
     view_bar.backgroundColor=[UIColor clearColor];
    

    
    [self.view addSubview: view_bar];
    UILabel *title_label=[[UILabel alloc]initWithFrame:CGRectMake(65, view_bar.frame.size.height-44, self.view.frame.size.width-130, 44)];
    title_label.text=@"渐变色";
    title_label.font=[UIFont boldSystemFontOfSize:17];
    title_label.backgroundColor=[UIColor clearColor];
    title_label.textColor =[UIColor whiteColor];
    title_label.textAlignment=1;
   [view_bar addSubview:title_label];

    
   
    
    UIButton* meBtn=[[UIButton alloc]initWithFrame:CGRectMake(view_bar.frame.size.width-44, view_bar.frame.size.height-34, 25, 25)];
    [meBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_icon_me_normal@2x"] forState:UIControlStateNormal];
    
    [meBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
   // [self.scanningBtn addTarget:self action:@selector(Scanning) forControlEvents:UIControlEventTouchDown];
    
    [view_bar addSubview:meBtn];
    
    UIButton * readerBtn=[[UIButton alloc] initWithFrame:CGRectMake(10, view_bar.frame.size.height-34, 25, 25)];
    [readerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_icon_reader_normal@2x"] forState:UIControlStateNormal];
        [view_bar addSubview:readerBtn];
    
    return view_bar;
}

-(void)SetHeaderView
{
   // UIView*HeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0,Width,150)];
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,Width,180)];
    UIImage* img=[UIImage imageNamed:@"6.jpeg"];//原图
    
    CGRect rect = CGRectMake(0, 0,2000, 400);
    
    CGImageRef imageRef=CGImageCreateWithImageInRect([img CGImage],rect);
    
    UIImage *image1=[UIImage imageWithCGImage:imageRef];
    
    [imageView setImage:image1];
    
    
    //[HeaderView addSubview:imageView];
    
    
    mainTableView.tableHeaderView=imageView;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier=@"cell";
    //如果需要重用，就从这个cell的队列里面找标识符一样的重用
   
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=@"变……变了…………";
    cell.textLabel.font=[UIFont systemFontOfSize:13];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
        return 40;
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(mainTableView.contentOffset.y<-20) {
        
       // [self.navigationController setNavigationBarHidden:YES animated:NO];
        
        
        [view_bar setHidden:YES];
        
    }else if(mainTableView.contentOffset.y<700){
        [view_bar setHidden:NO];

         view_bar.backgroundColor=[UIColor colorWithRed:0.9 green:0 blue:0 alpha:mainTableView.contentOffset.y / 1000];
    }else
    {
        [view_bar setHidden:NO];
        
        view_bar.backgroundColor=[UIColor colorWithRed:0.9 green:0 blue:0 alpha:0.7];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
