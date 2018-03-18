//
//  AddressBookVC.m
//  AddressBook
//
//  Created by YPShao on 15/12/15.
//  Copyright © 2015年 YPShao. All rights reserved.
//

#import "AddressBookVC.h"
#import "ChineseString.h"
#import "AttachedCell.h"
#import "BATableViewKit/BATableView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface AddressBookVC ()<BATableViewDelegate,SYPDelegate>

@property(nonatomic,strong)NSMutableArray *indexArray;
@property(nonatomic,strong)NSMutableArray *letterResultArr;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *stateArray;




@end

@implementation AddressBookVC{

    BATableView *_BAtableview;
    UISearchBar *_searchBar;
  

}

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    UICollectionView
    
     self.automaticallyAdjustsScrollViewInsets  = NO;
     self.title = @"通讯录";
  
    
   _dataArray=[NSMutableArray arrayWithObjects:
                            @"￥hhh, .$",@" ￥Chin ese ",
                            @"开源中国 ",
                            @"www.oschina.net",
                            @"开源技术",@"社区",@"开发者",@"传播",
                            @"2014",@"a1",@"100",@"中国",@"暑假作业",
                            @"键盘", @"鼠标",@"hello",@"world",@"b1",
                            nil];
    self.indexArray = [ChineseString IndexArray:self.dataArray];
    
    self.letterResultArr = [ChineseString LetterSortArray:_dataArray];
    
    NSDictionary *dic = @{@"Cell": @"MainCell",@"isAttached":@(NO)};
    
//    [self.indexArray count];  组
    //每组cell数量
//    [[self.letterResultArr objectAtIndex:section] count]
    self.stateArray = [[NSMutableArray alloc]init];
    for (int i = 0; i< self.indexArray.count ; i++) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int j = 0; j< [[self.letterResultArr objectAtIndex:i] count] ; j++) {
            
            [array addObject:dic];
        }

        [self.stateArray addObject:array];
        
    }

    [self setUpView];
  
}



-(void)setUpView{

    _BAtableview = [[BATableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) ];
//    _tableview.backgroundColor = [UIColor redColor];
    _BAtableview.delegate = self;
    
    [self.view addSubview:_BAtableview];
   
}

#pragma mark - UITableViewDataSource
- (NSArray *) sectionIndexTitlesForABELTableView:(BATableView *)tableView {
    return @[
             @"A",@"B",@"C",@"D",@"E",
             @"F",@"G",@"H",@"I",@"J",
             @"K",@"L",@"M",@"N",@"O",
             @"P",@"Q",@"R",@"S",@"T",
             @"U",@"V",@"W",@"X",@"Y",
             @"Z", @"#"
             ];
}

- (NSString *)titleString:(NSInteger)section
{
    return  [self.indexArray objectAtIndex:section];
}



#pragma mark - UITableViewDataSource
//
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return self.indexArray;
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [self.indexArray objectAtIndex:section];
    return key;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.stateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%ld",[[self.stateArray objectAtIndex:section] count]);
    return [[self.stateArray objectAtIndex:section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.stateArray[indexPath.section][indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil)
       {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
          }
    
    cell.textLabel.text = [[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
        
    }
    
    else if ([[self.stateArray[indexPath.section][indexPath.row] objectForKey:@"Cell"] isEqualToString:@"AttachedCell"])
    {
        
        static NSString *CellIdentifier2 = @"AttachedCell";
        
        AttachedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
              if (cell == nil) {
            cell = [[AttachedCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
                  //协议
                  cell.delegate = self;
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
        
    }
    

    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}



#pragma mark -
#pragma mark - UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    lab.backgroundColor = [UIColor colorWithRed:188/255.0 green:189/255.0 blue:190/255.0 alpha:1];

    lab.text = [self.indexArray objectAtIndex:section];
    lab.textColor = [UIColor whiteColor];
    return lab;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100.0;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.stateArray[indexPath.section][indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
        return 50;
    }else{
        return 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSLog(@"indexPath%ld",indexPath.row);
    /*
    NSLog(@"---->%@",[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]
                                                   delegate:nil
                                          cancelButtonTitle:@"YES" otherButtonTitles:nil];
    [alert show];
     */
    
    NSIndexPath *path = nil;
    
    if ([[self.stateArray[indexPath.section][indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"]) {
        path = [NSIndexPath indexPathForItem:(indexPath.row+1) inSection:indexPath.section];
    }else{
        path = indexPath;
    }
    
    if ([[self.stateArray[indexPath.section][indexPath.row] objectForKey:@"isAttached"] boolValue]) {
        // 关闭附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(NO)};
        self.stateArray[indexPath.section][(path.row-1)] = dic;
        [self.stateArray[path.section] removeObjectAtIndex:path.row];
        //删除占位
        [self.letterResultArr[path.section] removeObjectAtIndex:path.row];
        [_BAtableview.tableView beginUpdates];
        [_BAtableview.tableView deleteRowsAtIndexPaths:@[path]  withRowAnimation:UITableViewRowAnimationMiddle];
        [_BAtableview.tableView endUpdates];
        
    }else{
        //关闭之前打开的cell
        
        // 打开附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(YES)};
       self.stateArray[indexPath.section][(path.row-1)] = dic;
//        NSLog(@"%@",indexPath);
  
        
//        NSLog(@"%@",self.stateArray[indexPath.section][(path.row-1)]);
        
        NSDictionary * addDic = @{@"Cell": @"AttachedCell",@"isAttached":@(YES)};
        [self.stateArray[indexPath.section] insertObject:addDic atIndex:path.row];
        //占位
        [self.letterResultArr[indexPath.section] insertObject:@"" atIndex:path.row];

        [_BAtableview.tableView beginUpdates];
        [_BAtableview.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        [_BAtableview.tableView endUpdates];
        
    }
    

}

#pragma mark - 二级cell点击方法
-(void)makePhoneCall:(UIButton*)button{

    UIView *cell = [[button superview]superview];
    NSIndexPath *indexPath = [_BAtableview.tableView indexPathForCell:(UITableViewCell*)cell];
    
    NSLog(@"%@",indexPath);
    NSLog(@"%ld",(long)button.tag);
    NSLog(@"%@",self.letterResultArr[indexPath.section][indexPath.row-1]);
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
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
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com