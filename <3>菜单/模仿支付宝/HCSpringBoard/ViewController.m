//
//  ViewController.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/4.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    NSMutableArray *_iconModelsArray;
    
    HCSpringBoardView *_springBoard;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //获取序列化到本地的所有菜单
    NSDictionary *mainMenuDict = [[NSDictionary alloc]initWithContentsOfFile:DOCUMENT_FOLDER(kMenuFileName)];
    _favoriteMainMenu = [HCFavoriteIconModel modelWithDictionary:mainMenuDict];
    [self displayMenu];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_springBoard) {
        if (_springBoard.isEdit) {
            [_springBoard showEditButton];
        }
    }
}

- (void)displayMenu {
    _iconModelsArray = [[NSMutableArray alloc]init];
    //取出要显示的数据
    NSUserDefaults *userDefaultsLoveMenu = [[NSUserDefaults alloc]initWithSuiteName:kUserDefaultSuiteNameLoveMenu];
    NSArray *userDefaultsLoveMenuArray = [userDefaultsLoveMenu objectForKey:kUserDefaultLoveMenuKey];
    if (userDefaultsLoveMenu && userDefaultsLoveMenuArray) {
        NSData *modelsArrayData = [userDefaultsLoveMenu objectForKey:kUserDefaultLoveMenuKey];
        NSArray *modelsArray = [NSKeyedUnarchiver unarchiveObjectWithData:modelsArrayData];
        NSLog(@"modelsArray:%@",modelsArray);
        _iconModelsArray = [modelsArray mutableCopy];
    }
    else {
        [self getDisplayIcon:_favoriteMainMenu];
        HCFavoriteIconModel *addModel = [[HCFavoriteIconModel alloc]init];
        addModel.name = @"添加";
        addModel.image = @"tj";
        addModel.imageSeleted = @"tj";
        addModel.type = kViewcontroller;
        addModel.nodeIndex = @"-1";
        addModel.display = YES;
        addModel.isReadOnly = YES;
        addModel.targetController = @"";
        
        [_iconModelsArray addObject:addModel];
        
        NSData *iconModelsArrayData = [NSKeyedArchiver archivedDataWithRootObject:_iconModelsArray];
        [userDefaultsLoveMenu setObject:iconModelsArrayData forKey:kUserDefaultLoveMenuKey];
        [userDefaultsLoveMenu synchronize];
    }
    
    NSLog(@"displayMenu 显示数据：%@",_iconModelsArray);
    if ([self.view viewWithTag:90]) {
        [_springBoard removeFromSuperview];
    }
    
    //根据数据显示菜单
    CGRect sbRect = CGRectMake(0, 100, kScreenSize.width, [self getOnePageRomByDevice]*(ICONIMG_HEIGHT+0.5)+40);
    _springBoard = [[HCSpringBoardView alloc]initWithFrame:sbRect modes:_iconModelsArray];
    _springBoard.springBoardDelegate = self;
    _springBoard.tag = SpringBoardTag;
    [self.view addSubview:_springBoard];
}

#pragma mark - BankListDelegate
//显示在列表页勾选图标
- (void)addIconDone:(HCBankListViewController *)bankListViewController {
    CGRect sbRect = CGRectMake(0, 100, kScreenSize.width, [self getOnePageRomByDevice]*(ICONIMG_HEIGHT+0.5)+40);
    
    [_springBoard removeFromSuperview];
    _springBoard = [[HCSpringBoardView alloc]initWithFrame:sbRect modes:_iconModelsArray];
    _springBoard.springBoardDelegate = self;
    _springBoard.tag = SpringBoardTag;
    [self.view addSubview:_springBoard];
    
    //序列化
    [_springBoard archiverIconModelsArray];
    [_springBoard archiverLoveMenuMainModel];
}

//递归查找需要显示的图标
- (void)getDisplayIcon:(HCFavoriteIconModel *)favoroteModel
{
    if ([favoroteModel.type isEqualToString:kViewcontroller] || [favoroteModel.type isEqualToString:kWebLocal] || [favoroteModel.type isEqualToString:kWebNetwork]) {
        if (favoroteModel.display) {
            [_iconModelsArray addObject:favoroteModel];
        }
    }
    else if ([favoroteModel.type isEqualToString:kMenuList] || [favoroteModel.type isEqualToString:kMenuIcons]) {
        for (int i = 0; i < favoroteModel.itemList.count; i++) {
            [self getDisplayIcon:favoroteModel.itemList[i]];
        }
    }
}

- (NSInteger)getOnePageRomByDevice {
    NSInteger row = 3;
    if (IPHONE6Plus){
        row = 4;
    }
    return row;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com