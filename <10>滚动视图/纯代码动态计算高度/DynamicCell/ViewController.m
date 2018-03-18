//
//  ViewController.m
//  DynamicCell
//
//  Created by chiyu on 16/2/16.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import "ViewController.h"
#import "WLCellModel.h"
#import "WLCellFrameModel.h"
#import "WLCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *cellFrames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self registNotifaction];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)registNotifaction
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCell:) name:@"SelectionViewController" object:nil];
    
}
//刷新cell
- (void)reloadCell:(NSNotification *)info
{
    NSDictionary *dict=info.userInfo;
    NSString *picHeight=[[dict objectForKey:@"Height"] stringValue];
    NSIndexPath *indexpath=[dict objectForKey:@"indexPath"];
    if ( self.cellFrames.count>=indexpath.row) {
        WLCellFrameModel *modelFrame=[self.cellFrames objectAtIndex:indexpath.row];
        modelFrame.cellModel.picH=picHeight;
        modelFrame.cellModel=modelFrame.cellModel;
        [self.cellFrames replaceObjectAtIndex:indexpath.row withObject:modelFrame];
        [self.tableView reloadData];
    }
}

-(NSArray *)cellFrames
{
    if (_cellFrames == nil) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dicArray=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *cellsFrameArray=[NSMutableArray array];
        for (NSDictionary *dict in dicArray) {
            WLCellModel *model=[WLCellModel modelWithDict:dict];
            WLCellFrameModel *modelFrame=[[WLCellFrameModel alloc] init];
            modelFrame.cellModel=model;
            [cellsFrameArray addObject:modelFrame];            
        }
        _cellFrames = cellsFrameArray;
    }
    return _cellFrames;
}


#pragma mark - 实现数据源方法
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    WLCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[WLCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    else
    {
        for (UIView *sub in cell.contentView.subviews) {
            if ([sub isKindOfClass:[UIImageView class]]) {
                UIImageView *tempImageView= (UIImageView *)sub;
                tempImageView.image=nil;
            }
            if ([sub isKindOfClass:[UILabel class]]) {
                UILabel *tempUILabel= (UILabel *)sub;
                tempUILabel.text=nil;
            }
            
        }
    }
    [cell showCellWithModel:self.cellFrames[indexPath.row] indexPath:indexPath];
    return cell;
    
}

#pragma mark - 实现代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WLCellFrameModel *cellFrame = self.cellFrames[indexPath.row];
    return cellFrame.cellHeight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
