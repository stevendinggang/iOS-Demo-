//
//  PushViewController.m
//  KFScrollViewDemo
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import "PushViewController.h"
#import "KFScrollView.h"
#import "DataModel.h"
#import "UIColor+MLPFlatColors.h"
@interface PushViewController ()
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    navView.backgroundColor = [UIColor flatBlueColor];
    [self.view addSubview:navView];
    
    
    KFScrollView *scrollView = [[KFScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-40) headerHeight:40 withArray:self.dataArray];
    [scrollView didSelectedTop:^(id item) {
        
        
    } selectedMiddle:^(UIButton *item, Second *model) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:model.KindCode message:model.kindName delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        
    }];
    
    [self.view addSubview:scrollView];
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"json"];
        NSString *dataString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *dataArray = dict[@"Data"];
        for (NSDictionary *dict in dataArray) {
            DataModel *model = [[DataModel alloc]initWithDictionary:dict];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
