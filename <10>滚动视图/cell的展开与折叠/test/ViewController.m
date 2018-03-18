//
//  ViewController.m
//  test
//
//  Created by qmap01 on 16/4/6.
//  Copyright © 2016年 qmap. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;
    BOOL isOpen;
    NSIndexPath *selectIndex;
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic) NSInteger selectSection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    isOpen=YES;
    _dataArr=[[NSMutableArray alloc]initWithObjects:@"a",@"b",@"c",@"d",@"b",@"c",@"d", nil];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    
    
}
#pragma  mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (selectIndex.row == indexPath.row && selectIndex!=nil) {
        if (isOpen) {
            return 120;
        }
        return 50;
    }
    return 50;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID=@"CELLID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (selectIndex.row == indexPath.row && selectIndex!=nil ) {
        if (isOpen) {
            //可自定义当前cell样式
            cell.textLabel.text=_dataArr[indexPath.row];
            cell.backgroundColor=[UIColor grayColor];
        }else {
            //恢复原状（定义原cell并填充）
            cell.textLabel.text=@"关闭";
            cell.backgroundColor=[UIColor whiteColor];
        }
    
    }else {
        cell.textLabel.text=@"关闭";
        cell.backgroundColor=[UIColor whiteColor];
    }
      return cell;
   
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //更改选中cell的状态 用以 刷新页面是进行折叠和展开
     NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    if (selectIndex!=nil &&indexPath.row ==selectIndex.row) {
        isOpen=!isOpen;
      
    }else if (selectIndex!=nil && indexPath.row!=selectIndex.row) {
        indexPaths = [NSArray arrayWithObjects:indexPath,selectIndex, nil];
        isOpen=YES;
    }
    selectIndex=indexPath;
      //刷新
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
