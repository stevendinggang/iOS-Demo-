//
//  HCAssistant.m
//  HCSpringBoard
//
//  Created by 刘海川 on 16/3/4.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCAssistant.h"

@implementation HCAssistant

+ (void)initMainMenu;
{
    NSUInteger kIndexValue = 0;
#pragma mark 助手 -> 金融计算器
    
    NSArray *FinanceCalculator = [NSArray arrayWithObjects:
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"存款计算器",kNodeName,
                                   @"金融计算器", kImage,
                                   @"金融计算器", kImageSeleted,
                                   @"金融计算器",kMenuListImage,
                                   [NSNumber numberWithInt:0], kSortNum,
                                   [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                   kViewcontroller, kNodeType,
                                   [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                   [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                   [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                   @"CSIITabBarViewController>3|CSIIHelpViewController>4|CNYFinancialCalViewController>0",kNavigationObject,
                                   @"DepositCalViewController",kSendController,
                                   nil],
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"贷款计算器",kNodeName,
                                   @"金融计算器", kImage,
                                   @"金融计算器", kImageSeleted,
                                   @"金融计算器",kMenuListImage,
                                   [NSNumber numberWithInt:0], kSortNum,
                                   [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                   kViewcontroller, kNodeType,
                                   [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                   [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                   [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                   @"CSIITabBarViewController>3|CSIIHelpViewController>4|CNYFinancialCalViewController>1",kNavigationObject,
                                   @"LoanCalViewController",kSendController,
                                   nil],
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"理财收益计算器",kNodeName,
                                   @"金融计算器", kImage,
                                   @"金融计算器", kImageSeleted,
                                   @"金融计算器",kMenuListImage,
                                   [NSNumber numberWithInt:0], kSortNum,
                                   [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                   kViewcontroller, kNodeType,
                                   [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                   [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                   [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                   @"CSIITabBarViewController>3|CSIIHelpViewController>4|CNYFinancialCalViewController>2",kNavigationObject,
                                   @"FinancialProfitViewController",kSendController,
                                   nil],
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"外汇兑换计算器",kNodeName,
                                   @"金融计算器", kImage,
                                   @"金融计算器", kImageSeleted,
                                   @"金融计算器",kMenuListImage,
                                   [NSNumber numberWithInt:0], kSortNum,
                                   [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                   kViewcontroller, kNodeType,
                                   [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                   [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                   [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                   @"CSIITabBarViewController>3|CSIIHelpViewController>4|CNYFinancialCalViewController>3",kNavigationObject,
                                   @"CSIIWBDHController",kSendController,
                                   nil],
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"信用卡分期还款计算器",kNodeName,
                                   @"金融计算器", kImage,
                                   @"金融计算器", kImageSeleted,
                                   @"金融计算器",kMenuListImage,
                                   [NSNumber numberWithInt:0], kSortNum,
                                   [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                   kViewcontroller, kNodeType,
                                   [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                   [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                   [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                   @"CSIITabBarViewController>3|CSIIHelpViewController>4|CNYFinancialCalViewController>4",kNavigationObject,
                                   @"CSIIXYKFQController",kSendController,
                                   nil],
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"按揭贷款月供计算器",kNodeName,
                                   @"金融计算器", kImage,
                                   @"金融计算器", kImageSeleted,
                                   @"金融计算器",kMenuListImage,
                                   [NSNumber numberWithInt:0], kSortNum,
                                   [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                   kViewcontroller, kNodeType,
                                   [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                   [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                   [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                   @"CSIITabBarViewController>3|CSIIHelpViewController>4|CNYFinancialCalViewController>5",kNavigationObject,
                                   @"CSIIAJDKController",kSendController,
                                   nil],
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"个人所得税计算器",kNodeName,
                                   @"金融计算器", kImage,
                                   @"金融计算器", kImageSeleted,
                                   @"金融计算器",kMenuListImage,
                                   [NSNumber numberWithInt:0], kSortNum,
                                   [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                   kViewcontroller, kNodeType,
                                   [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                   [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                   [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                   @"CSIITabBarViewController>3|CSIIHelpViewController>4|CNYFinancialCalViewController>6",kNavigationObject,
                                   @"CSIIGRSDSController",kSendController,
                                   nil]
                                  ,nil];
    
    
    
#pragma mark -助手 ————> 网点查询
    NSArray *LocationQry = [NSArray arrayWithObjects:
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"查询网点",kNodeName,
                             @"网点查询", kImage,
                             @"网点查询", kImageSeleted,
                             @"网点查询",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>3|CSIIHelpViewController>5|CSIIWandDianViewController>0",kNavigationObject,
                             @"WangDianViewController",kSendController,
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"查看周围网点",kNodeName,
                             @"网点查询", kImage,
                             @"网点查询", kImageSeleted,
                             @"网点查询",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>3|CSIIHelpViewController>5|CSIIWandDianViewController>1",kNavigationObject,
                             @"WangDianViewController",kSendController,
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"查询设备",kNodeName,
                             @"网点查询", kImage,
                             @"网点查询", kImageSeleted,
                             @"网点查询",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>3|CSIIHelpViewController>5|CSIIWandDianViewController>2",kNavigationObject,
                             @"WangDianViewController",kSendController,
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"查看周边设备",kNodeName,
                             @"网点查询", kImage,
                             @"网点查询", kImageSeleted,
                             @"网点查询",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>3|CSIIHelpViewController>5|CSIIWandDianViewController>3",kNavigationObject,
                             @"WangDianViewController",kSendController,
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"查询便民通",kNodeName,
                             @"网点查询", kImage,
                             @"网点查询", kImageSeleted,
                             @"网点查询",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>3|CSIIHelpViewController>5|CSIIWandDianViewController>4",kNavigationObject,
                             @"WangDianViewController",kSendController,
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"查看周边便民通",kNodeName,
                             @"网点查询", kImage,
                             @"网点查询", kImageSeleted,
                             @"网点查询",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>3|CSIIHelpViewController>5|CSIIWandDianViewController>5",kNavigationObject,
                             @"WangDianViewController",kSendController,
                             nil]
                            ,nil];
    
    
    
#pragma mark - 助手 --> 金融行情
    /* 金融行情 */
    NSArray * FinancialMarket = [NSArray arrayWithObjects:
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"存款利率",kNodeName,
                                  @"金融行情", kImage,
                                  @"金融行情", kImageSeleted,
                                  @"金融行情",kMenuListImage,
                                  [NSNumber numberWithInt:0], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>3|CSIIHelpViewController>0|CSIIGoldMeltListViewController>0",kNavigationObject,
                                  @"CSIILilvAndFundSearchViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"贷款利率",kNodeName,
                                  @"金融行情", kImage,
                                  @"金融行情", kImageSeleted,
                                  @"金融行情",kMenuListImage,
                                  [NSNumber numberWithInt:1], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>3|CSIIHelpViewController>0|CSIIGoldMeltListViewController>1",kNavigationObject,
                                  @"CSIILilvAndFundSearchViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"基金行情",kNodeName,
                                  @"金融行情", kImage,
                                  @"金融行情", kImageSeleted,
                                  @"金融行情",kMenuListImage,
                                  [NSNumber numberWithInt:2], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>3|CSIIHelpViewController>0|CSIIGoldMeltListViewController>2",kNavigationObject,
                                  @"CSIILilvAndFundSearchViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"外汇行情",kNodeName,
                                  @"金融行情", kImage,
                                  @"金融行情", kImageSeleted,
                                  @"金融行情",kMenuListImage,
                                  [NSNumber numberWithInt:3], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>3|CSIIHelpViewController>0|CSIIGoldMeltListViewController>3",kNavigationObject,
                                  @"CSIIOutMoneyTransViewController",kSendController,
                                  nil],
                                 nil];
    
#pragma mark - 助手 --> 金融资讯
    /* 金融资讯 */
    NSArray * FinancialInformation = [NSArray arrayWithObjects:
                                      [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"保险产品",kNodeName,
                                       @"金融资讯", kImage,
                                       @"金融资讯", kImageSeleted,
                                       @"金融资讯",kMenuListImage,
                                       [NSNumber numberWithInt:7], kSortNum,
                                       [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                       kViewcontroller, kNodeType,
                                       [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                       [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                                       [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                       @"CSIITabBarViewController>3|CSIIHelpViewController>1|CSIIGoldMeltNewsViewController>0",kNavigationObject,
                                       @"CSIIInsuranceDetailViewController",kSendController,
                                       nil],
                                      nil];
#pragma mark - 助手 --> 产品超市
    /* 产品超市 */
    NSArray *ProductSupermarket = [NSArray arrayWithObjects:
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"理财产品",kNodeName,
                                    @"产品超市", kImage,
                                    @"产品超市", kImageSeleted,
                                    @"产品超市",kMenuListImage,
                                    [NSNumber numberWithInt:0], kSortNum,
                                    [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                    kViewcontroller, kNodeType,
                                    [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                    [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                    [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                    @"CSIITabBarViewController>3|CSIIHelpViewController>3|FinaceProductMenuViewController>0",kNavigationObject,
                                    @"CSIIFinancingViewController",kSendController,
                                    nil],
                                   
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"黄金产品",kNodeName,
                                    @"产品超市", kImage,
                                    @"产品超市", kImageSeleted,
                                    @"产品超市",kMenuListImage,
                                    [NSNumber numberWithInt:0], kSortNum,
                                    [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                    kViewcontroller, kNodeType,
                                    [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                                    [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                    [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                    @"CSIITabBarViewController>3|CSIIHelpViewController>3|FinaceProductMenuViewController>1",kNavigationObject,
                                    @"CSIIGoldProductViewController",kSendController,
                                    nil],
                                   nil];
    
#pragma mark - 助手 --> 产品超市
    /* 帮助中心 */
    NSArray *helpCenter = [NSArray arrayWithObjects:
                           [NSDictionary dictionaryWithObjectsAndKeys:
                            @"资费标准",kNodeName,
                            @"帮助中心1", kImage,
                            @"帮助中心1", kImageSeleted,
                            @"帮助中心1",kMenuListImage,
                            [NSNumber numberWithInt:0], kSortNum,
                            [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                            kViewcontroller, kNodeType,
                            [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                            [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                            [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                            @"CSIITabBarViewController>3|CSIIHelpViewController>4|XHHHelperCenterViewController>0",kNavigationObject,
                            @"CSIIZFBZViewController",kSendController,
                            nil],
                           
                           [NSDictionary dictionaryWithObjectsAndKeys:
                            @"常见问题",kNodeName,
                            @"帮助中心1", kImage,
                            @"帮助中心1", kImageSeleted,
                            @"帮助中心1",kMenuListImage,
                            [NSNumber numberWithInt:0], kSortNum,
                            [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                            kViewcontroller, kNodeType,
                            [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                            [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                            [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                            @"CSIITabBarViewController>3|CSIIHelpViewController>4|XHHHelperCenterViewController>1",kNavigationObject,
                            @"XHHFreAskQuesViewController",kSendController,
                            nil],
                           
                           [NSDictionary dictionaryWithObjectsAndKeys:
                            @"意见反馈",kNodeName,
                            @"帮助中心1", kImage,
                            @"帮助中心1", kImageSeleted,
                            @"帮助中心1",kMenuListImage,
                            [NSNumber numberWithInt:0], kSortNum,
                            [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                            kViewcontroller, kNodeType,
                            [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                            [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                            [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                            @"CSIITabBarViewController>3|CSIIHelpViewController>4|XHHHelperCenterViewController>2",kNavigationObject,
                            @"XHHFeedbackViewController",kSendController,
                            nil],
                           
                           [NSDictionary dictionaryWithObjectsAndKeys:
                            @"服务热线",kNodeName,
                            @"帮助中心1", kImage,
                            @"帮助中心1", kImageSeleted,
                            @"帮助中心1",kMenuListImage,
                            [NSNumber numberWithInt:0], kSortNum,
                            [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                            kViewcontroller, kNodeType,
                            [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                            [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                            [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                            @"CSIITabBarViewController>3|CSIIHelpViewController>4|XHHHelperCenterViewController>3",kNavigationObject,
                            @"XHHServeLineViewController",kSendController,
                            nil],
                           
                           nil];
#pragma mark - 助手
    NSArray *Assistant = [NSArray arrayWithObjects:
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"金融行情",kNodeName,
                           @"金融行情", kImage,
                           @"金融行情", kImageSeleted,
                           @"金融行情",kMenuListImage,
                           kMenuList, kNodeType,
                           FinancialMarket, kItems,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"金融资讯",kNodeName,
                           @"金融资讯", kImage,
                           @"金融资讯", kImageSeleted,
                           @"金融资讯",kMenuListImage,
                           kMenuList, kNodeType,
                           FinancialInformation, kItems,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"申请贷款",kNodeName,
                           @"申请贷款", kImage,
                           @"申请贷款", kImageSeleted,
                           @"申请贷款",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:NO],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>3|CSIIHelpViewController>2",kNavigationObject,
                           @"CSIIApplyLoanViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"产品超市",kNodeName,
                           @"产品超市", kImage,
                           @"产品超市", kImageSeleted,
                           @"产品超市",kMenuListImage,
                           kMenuList, kNodeType,
                           ProductSupermarket, kItems,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"帮助中心",kNodeName,
                           @"帮助中心1", kImage,
                           @"帮助中心1", kImageSeleted,
                           @"帮助中心1",kMenuListImage,
                           kMenuList, kNodeType,
                           helpCenter, kItems,
                           nil],
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"金融计算器",kNodeName,
                           @"金融计算器", kImage,
                           @"金融计算器", kImageSeleted,
                           @"金融计算器",kMenuListImage,
                           kMenuList, kNodeType,
                           FinanceCalculator, kItems,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"网点及设备查询",kNodeName,
                           @"网点查询", kImage,
                           @"网点查询", kImageSeleted,
                           @"网点查询",kMenuListImage,
                           kMenuList, kNodeType,
                           LocationQry, kItems,
                           nil],
                          nil];
    /***************************************************************************************/
#pragma mark - 借记卡 --> 自助转账 --> 转账汇款
    /* 转账汇款 */
    NSArray * transfer = [NSArray arrayWithObjects:
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"行内转账",kNodeName,
                           @"行内转账", kImage,
                           @"行内转账", kImageSeleted,
                           @"行内转账",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                           [[NSNumber alloc]initWithBool:YES],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>0|CSIITransferViewController>0",kNavigationObject,
                           @"CSIITHTransferViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"跨行转账",kNodeName,
                           @"跨行转账", kImage,
                           @"跨行转账", kImageSeleted,
                           @"跨行转账",kMenuListImage,
                           [NSNumber numberWithInt:1], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                           [[NSNumber alloc]initWithBool:YES],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>0|CSIITransferViewController>1",kNavigationObject,
                           @"CSIIKHTransferViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"手机号转账",kNodeName,
                           @"行内转账", kImage,
                           @"行内转账", kImageSeleted,
                           @"行内转账",kMenuListImage,
                           [NSNumber numberWithInt:2], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>0|CSIITransferViewController>2",kNavigationObject,
                           @"CSIIPhoneNoTransViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"关联账户转账",kNodeName,
                           @"行内转账", kImage,
                           @"行内转账", kImageSeleted,
                           @"行内转账",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>0|CSIITransferViewController>3",kNavigationObject,
                           @"CSIIRelateTransferViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"预约转账",kNodeName,
                           @"行内转账", kImage,
                           @"行内转账", kImageSeleted,
                           @"行内转账",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>0|CSIITransferViewController>4",kNavigationObject,
                           @"CSIIAppThansferViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"收款人登记簿管理",kNodeName,
                           @"行内转账", kImage,
                           @"行内转账", kImageSeleted,
                           @"行内转账",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>0|CSIITransferViewController>5",kNavigationObject,
                           @"CSIIReceiverListViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"转账电话收款人管理",kNodeName,
                           @"行内转账", kImage,
                           @"行内转账", kImageSeleted,
                           @"行内转账",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>0|CSIITransferViewController>6",kNavigationObject,
                           @"CSIIReceiverListViewController",kSendController,
                           nil],
                          
                          nil];
    
#pragma mark - 借记卡 -->生活缴费
    NSArray *lifePay = [NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"电信充值",kNodeName,
                         @"生活缴费", kImage,
                         @"生活缴费", kImageSeleted,
                         @"生活缴费",kMenuListImage,
                         [NSNumber numberWithInt:5], kSortNum,
                         [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                         kViewcontroller, kNodeType,
                         [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                         [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                         [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                         @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>5|CSIILifePayIndexViewController>0",kNavigationObject,
                         @"CSIIElectricChargeIndexViewController",kSendController,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"水费缴费",kNodeName,
                         @"生活缴费", kImage,
                         @"生活缴费", kImageSeleted,
                         @"生活缴费",kMenuListImage,
                         [NSNumber numberWithInt:5], kSortNum,
                         [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                         kViewcontroller, kNodeType,
                         [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                         [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                         [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                         @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>5|CSIILifePayIndexViewController>1",kNavigationObject,
                         @"CSIIWaterChargesViewController",kSendController,
                         nil],
                        nil];
    
    
#pragma mark - 借记卡 --> 自助转账
    /****借记卡 --> 自助转账 ****/
    NSArray *SelfHelpTransfer = [NSArray arrayWithObjects:
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"转账汇款",kNodeName,
                                  @"自助转账", kImage,
                                  @"自助转账", kImageSeleted,
                                  @"自助转账",kMenuListImage,
                                  kMenuList, kNodeType,
                                  transfer, kItems,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"信用卡还款",kNodeName,
                                  @"自助转账", kImage,
                                  @"自助转账", kImageSeleted,
                                  @"自助转账",kMenuListImage,
                                  [NSNumber numberWithInt:5], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>2|CNYReturnAccViewController>0",kNavigationObject,
                                  @"CNYCreditReturnViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"二维码转账",kNodeName,
                                  @"自助转账", kImage,
                                  @"自助转账", kImageSeleted,
                                  @"自助转账",kMenuListImage,
                                  [NSNumber numberWithInt:5], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>2",kNavigationObject,
                                  @"CSIIQRTransferViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"定期存款",kNodeName,
                                  @"自助转账", kImage,
                                  @"自助转账", kImageSeleted,
                                  @"自助转账",kMenuListImage,
                                  kViewcontroller, kNodeType,
                                  [NSNumber numberWithInt:0], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>3",kNavigationObject,
                                  @"SavWithTimViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"通知存款转账",kNodeName,
                                  @"自助转账", kImage,
                                  @"自助转账", kImageSeleted,
                                  @"自助转账",kMenuListImage,
                                  kViewcontroller, kNodeType,
                                  [NSNumber numberWithInt:0], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>4",kNavigationObject,
                                  @"CSIINotifyDepositViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"第三方存管",kNodeName,
                                  @"自助转账", kImage,
                                  @"自助转账", kImageSeleted,
                                  @"自助转账",kMenuListImage,
                                  kViewcontroller, kNodeType,
                                  [NSNumber numberWithInt:0], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>5",kNavigationObject,
                                  @"CNYThirdPartyViewController",kSendController,
                                  nil],
                                 
                                 nil];
    
#pragma mark - 借记卡 --> 账户管理
    /* 转账汇款 */
    NSArray * AccountManagement = [NSArray arrayWithObjects:
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"账户总览",kNodeName,
                                    @"账户管理", kImage,
                                    @"账户管理", kImageSeleted,
                                    @"账户管理",kMenuListImage,
                                    [NSNumber numberWithInt:0], kSortNum,
                                    [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                    kViewcontroller, kNodeType,
                                    [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                    [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                    [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                    @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>0|CSIIAccMangerViewController>0",kNavigationObject,
                                    @"CSIIAccOverViewViewController",kSendController,
                                    nil],
                                   
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"交易查询",kNodeName,
                                    @"账户管理", kImage,
                                    @"账户管理", kImageSeleted,
                                    @"账户管理",kMenuListImage,
                                    [NSNumber numberWithInt:2], kSortNum,
                                    [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                    kViewcontroller, kNodeType,
                                    [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                    [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                    [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                    @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>0|CSIIAccMangerViewController>1",kNavigationObject,
                                    @"CSIITradingQueryNextViewController",kSendController,
                                    nil],
                                   
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"挂失",kNodeName,
                                    @"账户管理", kImage,
                                    @"账户管理", kImageSeleted,
                                    @"账户管理",kMenuListImage,
                                    [NSNumber numberWithInt:0], kSortNum,
                                    [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                    kViewcontroller, kNodeType,
                                    [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                    [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                    [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                    @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>0|CSIIAccMangerViewController>2",kNavigationObject,
                                    @"CSIIAccLostViewController",kSendController,
                                    nil],
                                   
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"电子回单",kNodeName,
                                    @"账户管理", kImage,
                                    @"账户管理", kImageSeleted,
                                    @"账户管理",kMenuListImage,
                                    [NSNumber numberWithInt:0], kSortNum,
                                    [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                    kViewcontroller, kNodeType,
                                    [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                    [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                    [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                    @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>0|CSIIAccMangerViewController>3",kNavigationObject,
                                    @"CSIIAccOverViewViewController",kSendController,
                                    nil],
                                   nil];
    
#pragma mark - 借记卡 --> 特色服务 -- > 无卡取现
    /* 转账汇款 */
    /*
     NSArray * noCardPayArray = [NSArray arrayWithObjects:
     [NSDictionary dictionaryWithObjectsAndKeys:
     @"无卡取款预约",kNodeName,
     @"160账号转账", kImage,
     @"160账号转账", kImageSeleted,
     @"自助转账",kMenuListImage,
     [NSNumber numberWithInt:0], kSortNum,
     @"37",kNodeIndex,
     kViewcontroller, kNodeType,
     [[NSNumber alloc]initWithBool:YES],kNeedLogin,
     [[NSNumber alloc]initWithBool:NO],kIsDisplay,
     [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
     @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>5|XHHUiqSerViewController>0|XHHNoCaFeViewController>0",kNavigationObject,
     @"XHHNoCaBoViewController",kSendController,
     nil],
     
     [NSDictionary dictionaryWithObjectsAndKeys:
     @"无卡取现查询",kNodeName,
     @"160定活互转", kImage,
     @"160定活互转", kImageSeleted,
     @"定活互转",kMenuListImage,
     [NSNumber numberWithInt:2], kSortNum,
     @"38",kNodeIndex,
     kViewcontroller, kNodeType,
     [[NSNumber alloc]initWithBool:YES],kNeedLogin,
     [[NSNumber alloc]initWithBool:NO],kIsDisplay,
     [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
     @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>5|XHHUiqSerViewController>0|XHHNoCaFeViewController>1",kNavigationObject,
     @"XHHNoCaBoViewController",kSendController,
     nil],
     nil];
     */
    
#pragma mark - 借记卡 --> 贷款管理
    /* 特色服务 */
    //@[@"额度查询",@"贷款明细查询",@"还款历史记录查询"];
    NSArray * manageDaiKuan = [NSArray arrayWithObjects:
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"额度查询",kNodeName,
                                @"贷款管理", kImage,
                                @"贷款管理", kImageSeleted,
                                @"贷款管理",kMenuListImage,
                                [NSNumber numberWithInt:0], kSortNum,
                                [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                kViewcontroller, kNodeType,
                                [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>4|loanControlViewController>0",kNavigationObject,
                                @"LoanLimitViewController",kSendController,
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"贷款明细查询",kNodeName,
                                @"贷款管理", kImage,
                                @"贷款管理", kImageSeleted,
                                @"贷款管理",kMenuListImage,
                                [NSNumber numberWithInt:0], kSortNum,
                                [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                kViewcontroller, kNodeType,
                                [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>4|loanControlViewController>1",kNavigationObject,
                                @"loanDetailFirstViewController",kSendController,
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"还款历史记录查询",kNodeName,
                                @"贷款管理", kImage,
                                @"贷款管理", kImageSeleted,
                                @"贷款管理",kMenuListImage,
                                [NSNumber numberWithInt:0], kSortNum,
                                [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                kViewcontroller, kNodeType,
                                [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>4|loanControlViewController>2",kNavigationObject,
                                @"LoanHistoryViewController",kSendController,
                                nil],
                               nil];
    
#pragma mark - 借记卡 --> 特色服务
    /* 特色服务 */
    NSArray * CharacteristicService = [NSArray arrayWithObjects:
                                       [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"无卡取款",kNodeName,
                                        @"无卡取款", kImage,
                                        @"无卡取款", kImageSeleted,
                                        @"无卡取款",kMenuListImage,
                                        [NSNumber numberWithInt:0], kSortNum,
                                        [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                        kViewcontroller, kNodeType,
                                        [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                        [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                        [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                        @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>5|XHHUiqSerViewController>0",kNavigationObject,
                                        @"XHHNoCaFeViewController",kSendController,
                                        nil],
                                       
                                       /***理财日历***/
                                       /*
                                        [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"理财日历",kNodeName,
                                        @"日历", kImage,
                                        @"日历", kImageSeleted,
                                        @"日历",kMenuListImage,
                                        [NSNumber numberWithInt:6], kSortNum,
                                        @"43",kNodeIndex,
                                        kViewcontroller, kNodeType,
                                        [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                        [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                                        [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                        @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>5|XHHUiqSerViewController>1",kNavigationObject,
                                        @"XHHFinCalViewController",kSendController,
                                        nil],
                                        */
                                       nil];
    
#pragma mark - 借记卡
    NSArray *DebitCard = [NSArray arrayWithObjects:
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"账户管理",kNodeName,
                           @"账户管理", kImage,
                           @"账户管理", kImageSeleted,
                           @"账户管理",kMenuListImage,
                           kMenuList, kNodeType,
                           AccountManagement, kItems,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"自助转账",kNodeName,
                           @"自助转账", kImage,
                           @"自助转账", kImageSeleted,
                           @"自助转账",kMenuListImage,
                           kMenuList, kNodeType,
                           SelfHelpTransfer, kItems,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"投资理财",kNodeName,
                           @"投资理财", kImage,
                           @"投资理财", kImageSeleted,
                           @"投资理财",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>1|CSIIWealthViewController>2",kNavigationObject,
                           @"CSIIFinancingViewController",kSendController,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"贷款管理",kNodeName,
                           @"贷款管理", kImage,
                           @"贷款管理", kImageSeleted,
                           @"贷款管理",kMenuListImage,
                           kMenuList, kNodeType,
                           manageDaiKuan, kItems,
                           nil],
                          
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"特色服务",kNodeName,
                           @"特色服务", kImage,
                           @"特色服务", kImageSeleted,
                           @"特色服务",kMenuListImage,
                           kMenuList, kNodeType,
                           CharacteristicService, kItems,
                           nil],
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"生活缴费",kNodeName,
                           @"生活缴费", kImage,
                           @"生活缴费", kImageSeleted,
                           @"生活缴费",kMenuListImage,
                           kMenuList, kNodeType,
                           lifePay, kItems,
                           nil],
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"客户积分",kNodeName,
                           @"客户积分", kImage,
                           @"客户积分", kImageSeleted,
                           @"客户积分",kMenuListImage,
                           [NSNumber numberWithInt:0], kSortNum,
                           [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                           kViewcontroller, kNodeType,
                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>6",kNavigationObject,
                           @"CSIIIntegralQueryViewController",kSendController,
                           nil],
                          
                          nil];
    
    /***********************************************************************************************/
#pragma mark - 信用卡 --> 信用卡查询
    NSArray * CreditSearch = [NSArray arrayWithObjects:
                              [NSDictionary dictionaryWithObjectsAndKeys:
                               @"办卡进度查询",kNodeName,
                               @"信用卡查询", kImage,
                               @"信用卡查询", kImageSeleted,
                               @"信用卡查询",kMenuListImage,
                               [NSNumber numberWithInt:0], kSortNum,
                               [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                               kViewcontroller, kNodeType,
                               [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                               [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                               [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                               @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>1|CSIICreditCardSearchViewController>0",kNavigationObject,
                               @"CSIICreditCardProgressViewController",kSendController,
                               nil],
                              
                              [NSDictionary dictionaryWithObjectsAndKeys:
                               @"信用卡账户信息查询",kNodeName,
                               @"信用卡查询", kImage,
                               @"信用卡查询", kImageSeleted,
                               @"信用卡查询",kMenuListImage,
                               [NSNumber numberWithInt:0], kSortNum,
                               [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                               kViewcontroller, kNodeType,
                               [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                               [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                               [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                               @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>1|CSIICreditCardSearchViewController>1",kNavigationObject,
                               @"CSIIAccInfoViewController",kSendController,
                               nil],
                              
                              [NSDictionary dictionaryWithObjectsAndKeys:
                               @"已出账单查询",kNodeName,
                               @"信用卡查询", kImage,
                               @"信用卡查询", kImageSeleted,
                               @"信用卡查询",kMenuListImage,
                               [NSNumber numberWithInt:0], kSortNum,
                               [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                               kViewcontroller, kNodeType,
                               [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                               [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                               [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                               @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>1|CSIICreditCardSearchViewController>2",kNavigationObject,
                               @"CSIICheckedOutPayListViewController",kSendController,
                               nil],
                              
                              [NSDictionary dictionaryWithObjectsAndKeys:
                               @"未出账单查询",kNodeName,
                               @"信用卡查询", kImage,
                               @"信用卡查询", kImageSeleted,
                               @"信用卡查询",kMenuListImage,
                               [NSNumber numberWithInt:0], kSortNum,
                               [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                               kViewcontroller, kNodeType,
                               [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                               [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                               [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                               @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>1|CSIICreditCardSearchViewController>3",kNavigationObject,
                               @"CSIIUnCheckedPayListViewController",kSendController,
                               nil],
                              
                              [NSDictionary dictionaryWithObjectsAndKeys:
                               @"历史交易查询",kNodeName,
                               @"信用卡查询", kImage,
                               @"信用卡查询", kImageSeleted,
                               @"信用卡查询",kMenuListImage,
                               [NSNumber numberWithInt:0], kSortNum,
                               [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                               kViewcontroller, kNodeType,
                               [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                               [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                               [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                               @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>1|CSIICreditCardSearchViewController>4",kNavigationObject,
                               @"CSIIHistoryViewController",kSendController,
                               nil],
                              nil];
    
#pragma mark - 信用卡 --> 还款管理
    NSArray * RepaymentManagement = [NSArray arrayWithObjects:
                                     [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"信用卡还款",kNodeName,
                                      @"还款管理", kImage,
                                      @"还款管理", kImageSeleted,
                                      @"还款管理",kMenuListImage,
                                      [NSNumber numberWithInt:0], kSortNum,
                                      [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                      kViewcontroller, kNodeType,
                                      [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                      [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                      [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                      @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>2|CNYReturnAccViewController>0",kNavigationObject,
                                      @"CNYCreditReturnViewController",kSendController,
                                      nil],
                                     
                                     [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"自动还款设置",kNodeName,
                                      @"还款管理", kImage,
                                      @"还款管理", kImageSeleted,
                                      @"还款管理",kMenuListImage,
                                      [NSNumber numberWithInt:0], kSortNum,
                                      [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                      kViewcontroller, kNodeType,
                                      [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                      [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                      [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                      @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>2|CNYReturnAccViewController>1",kNavigationObject,
                                      @"CNYAutoReturnViewController",kSendController,
                                      nil],
                                     nil];
    
#pragma mark - 信用卡 --> 分期管理
    NSArray * StageManagement = [NSArray arrayWithObjects:
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"预借现金",kNodeName,
                                  @"分期管理", kImage,
                                  @"分期管理", kImageSeleted,
                                  @"分期管理",kMenuListImage,
                                  [NSNumber numberWithInt:0], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>3|XHHBudMangViewController>0",kNavigationObject,
                                  @"XHHPreCashViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"账单分期",kNodeName,
                                  @"分期管理", kImage,
                                  @"分期管理", kImageSeleted,
                                  @"分期管理",kMenuListImage,
                                  [NSNumber numberWithInt:0], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>3|XHHBudMangViewController>1",kNavigationObject,
                                  @"XHHBillStageOfaViewController",kSendController,
                                  nil],
                                 
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"交易分期",kNodeName,
                                  @"分期管理", kImage,
                                  @"分期管理", kImageSeleted,
                                  @"分期管理",kMenuListImage,
                                  [NSNumber numberWithInt:0], kSortNum,
                                  [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                  kViewcontroller, kNodeType,
                                  [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                  [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                  [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                  @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>3|XHHBudMangViewController>2",kNavigationObject,
                                  @"XHHTradeInstalViewController",kSendController,
                                  nil],
                                 nil];
    
#pragma mark - 信用卡 --> 卡片管理
    NSArray * CardManagement = [NSArray arrayWithObjects:
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"信用卡激活",kNodeName,
                                 @"卡片管理", kImage,
                                 @"卡片管理", kImageSeleted,
                                 @"卡片管理",kMenuListImage,
                                 [NSNumber numberWithInt:0], kSortNum,
                                 [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                 kViewcontroller, kNodeType,
                                 [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                 [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                 [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                 @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>4|CreditCardManageViewController>0",kNavigationObject,
                                 @"XHHCreditCaActViewController",kSendController,
                                 nil],
                                nil];
    
#pragma mark - 信用卡
    NSArray *Credit = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObjectsAndKeys:
                        @"账户管理",kNodeName,
                        @"账户管理", kImage,
                        @"账户管理", kImageSeleted,
                        @"账户管理",kMenuListImage,
                        [NSNumber numberWithInt:0], kSortNum,
                        [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                        kViewcontroller, kNodeType,
                        [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                        [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                        [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                        @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>0",kNavigationObject,
                        @"CSIIAccOverViewViewController",kSendController,
                        nil],
                       
                       [NSDictionary dictionaryWithObjectsAndKeys:
                        @"信用卡查询",kNodeName,
                        @"信用卡查询", kImage,
                        @"信用卡查询", kImageSeleted,
                        @"信用卡查询",kMenuListImage,
                        kMenuList, kNodeType,
                        CreditSearch, kItems,
                        nil],
                       
                       [NSDictionary dictionaryWithObjectsAndKeys:
                        @"还款管理",kNodeName,
                        @"还款管理", kImage,
                        @"还款管理", kImageSeleted,
                        @"还款管理",kMenuListImage,
                        kMenuList, kNodeType,
                        RepaymentManagement, kItems,
                        nil],
                       
                       [NSDictionary dictionaryWithObjectsAndKeys:
                        @"分期管理",kNodeName,
                        @"分期管理", kImage,
                        @"分期管理", kImageSeleted,
                        @"分期管理",kMenuListImage,
                        kMenuList, kNodeType,
                        StageManagement, kItems,
                        nil],
                       
                       [NSDictionary dictionaryWithObjectsAndKeys:
                        @"卡片管理",kNodeName,
                        @"卡片管理", kImage,
                        @"卡片管理", kImageSeleted,
                        @"卡片管理",kMenuListImage,
                        kMenuList, kNodeType,
                        CardManagement, kItems,
                        nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:
                        @"积分管理",kNodeName,
                        @"积分管理", kImage,
                        @"积分管理", kImageSeleted,
                        @"积分管理",kMenuListImage,
                        [NSNumber numberWithInt:0], kSortNum,
                        [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                        kViewcontroller, kNodeType,
                        [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                        [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                        [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                        @"CSIITabBarViewController>0|CSIIFirstViewController>4|CSIICreditCardViewController>5",kNavigationObject,
                        @"XHHIntegerQuryViewController",kSendController,
                        nil],
                       nil];
    
#pragma mark - 财富 --> 通知存款
    NSArray * NotifyDeposit = [NSArray arrayWithObjects:
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"活期转通知存款",kNodeName,
                                @"通知存款", kImage,
                                @"通知存款", kImageSeleted,
                                @"通知存款",kMenuListImage,
                                [NSNumber numberWithInt:0], kSortNum,
                                [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                kViewcontroller, kNodeType,
                                [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                @"CSIITabBarViewController>1|CSIIWealthViewController>5|CSIINotifyDepositViewController>0",kNavigationObject,
                                @"CSIICurrentChangeNotifyDepositViewController",kSendController,
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"通知存款支取预约",kNodeName,
                                @"通知存款", kImage,
                                @"通知存款", kImageSeleted,
                                @"通知存款",kMenuListImage,
                                [NSNumber numberWithInt:0], kSortNum,
                                [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                kViewcontroller, kNodeType,
                                [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                @"CSIITabBarViewController>1|CSIIWealthViewController>5|CSIINotifyDepositViewController>1",kNavigationObject,
                                @"CSIITongZhiYuYueViewController",kSendController,
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"通知存款支取",kNodeName,
                                @"通知存款", kImage,
                                @"通知存款", kImageSeleted,
                                @"通知存款",kMenuListImage,
                                [NSNumber numberWithInt:0], kSortNum,
                                [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                kViewcontroller, kNodeType,
                                [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                @"CSIITabBarViewController>1|CSIIWealthViewController>5|CSIINotifyDepositViewController>2",kNavigationObject,
                                @"CSIIDrawDepositViewController",kSendController,
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"通知存款预约取消",kNodeName,
                                @"通知存款", kImage,
                                @"通知存款", kImageSeleted,
                                @"通知存款",kMenuListImage,
                                [NSNumber numberWithInt:0], kSortNum,
                                [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                                kViewcontroller, kNodeType,
                                [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                                [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                                [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                                @"CSIITabBarViewController>1|CSIIWealthViewController>5|CSIINotifyDepositViewController>3",kNavigationObject,
                                @"CSIICancelAppointmentViewController",kSendController,
                                nil],
                               nil];
    
#pragma mark - 财富 --> 定期存款
    NSArray * SavWithTim = [NSArray arrayWithObjects:
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"活期转定期",kNodeName,
                             @"定期存款", kImage,
                             @"定期存款", kImageSeleted,
                             @"定期存款",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>1|CSIIWealthViewController>0|SavWithTimViewController>0",kNavigationObject,
                             @"SavToTimViewController",kSendController,
                             nil],
                            
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             @"定期转活期",kNodeName,
                             @"定期存款", kImage,
                             @"定期存款", kImageSeleted,
                             @"定期存款",kMenuListImage,
                             [NSNumber numberWithInt:0], kSortNum,
                             [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                             kViewcontroller, kNodeType,
                             [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                             @"CSIITabBarViewController>1|CSIIWealthViewController>0|SavWithTimViewController>1",kNavigationObject,
                             @"TimToSavViewController",kSendController,
                             nil],
                            nil];
#pragma mark - 财富 --> 步步为盈
    NSArray * SepProf = [NSArray arrayWithObjects:
                         [NSDictionary dictionaryWithObjectsAndKeys:
                          @"步步唯盈签约",kNodeName,
                          @"步步唯盈", kImage,
                          @"步步唯盈", kImageSeleted,
                          @"步步唯盈",kMenuListImage,
                          [NSNumber numberWithInt:0], kSortNum,
                          [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                          kViewcontroller, kNodeType,
                          [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                          [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                          [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                          @"CSIITabBarViewController>1|CSIIWealthViewController>3|XHHSepProfViewController>0",kNavigationObject,
                          @"XHHSetpProfSignViewController",kSendController,
                          nil],
                         
                         [NSDictionary dictionaryWithObjectsAndKeys:
                          @"步步唯支取",kNodeName,
                          @"步步唯盈", kImage,
                          @"步步唯盈", kImageSeleted,
                          @"步步唯盈",kMenuListImage,
                          [NSNumber numberWithInt:0], kSortNum,
                          [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                          kViewcontroller, kNodeType,
                          [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                          [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                          [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                          @"CSIITabBarViewController>1|CSIIWealthViewController>3|XHHSepProfViewController>1",kNavigationObject,
                          @"BBWWZQViewController",kSendController,
                          nil],
                         nil];
    
#pragma mark - 财富 --> 积存金
    /* 积存金 */
    // NSArray * JiCunJin = [NSArray arrayWithObjects:
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"积存金",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:2], kSortNum,
    //                           @"20",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>1|CSIIWealthViewController>7",kNavigationObject,
    //                           @"CSIIJiCunBuyOrReturnViewController",kSendController,
    //                           nil],
    
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"积存金开户",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:2], kSortNum,
    //                           @"21",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>6|CSIIJiCunJinViewController>1",kNavigationObject,
    //                           @"RegisterJiCunViewController",kSendController,
    //                           nil],
    
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"主动积存",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:0], kSortNum,
    //                           @"22",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>1|CSIIWealthViewController>7|CSIIJiCunBuyOrReturnViewController>0",kNavigationObject,
    //                           @"CSIIMyJiCunJinViewController",kSendController,
    //                           nil],
    
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"交易明细查询",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:0], kSortNum,
    //                           @"23",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>6|CSIIJiCunJinViewController>3",kNavigationObject,
    //                           @"CSIIDealQueryViewController",kSendController,
    //                           nil],
    
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"历史价格查询",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:0], kSortNum,
    //                           @"24",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>6|CSIIJiCunJinViewController>4",kNavigationObject,
    //                           @"CSIIHisPriViewController",kSendController,
    //                           nil],
    
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"积存金密码修改",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:2], kSortNum,
    //                           @"25",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>6|CSIIJiCunJinViewController>5",kNavigationObject,
    //                           @"JiCunPwdUpdateViewController",kSendController,
    //                           nil],
    
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"更换绑定卡",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:0], kSortNum,
    //                           @"26",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>6|CSIIJiCunJinViewController>6",kNavigationObject,
    //                           @"CSIIChangeCardViewController",kSendController,
    //                           nil],
    
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"修改联系方式",kNodeName,
    //                           @"积存金", kImage,
    //                           @"积存金", kImageSeleted,
    //                           @"积存金",kMenuListImage,
    //                           [NSNumber numberWithInt:0], kSortNum,
    //                           @"27",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>0|CSIIFirstViewController>3|CSIIDebitCardViewController>1|CSIIAutoTransferViewController>6|CSIIJiCunJinViewController>7",kNavigationObject,
    //                           @"CSIIModifyContactViewController",kSendController,
    //                           nil],
    //     nil];
    
#pragma mark - 财富
    NSArray * Wealth = [NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"定期存款",kNodeName,
                         kMenuIcons, kNodeType,
                         @"定期存款",kMenuListImage,
                         SavWithTim, kItems,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"基金",kNodeName,
                         @"基金", kImage,
                         @"基金", kImageSeleted,
                         @"基金",kMenuListImage,
                         [NSNumber numberWithInt:0], kSortNum,
                         [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                         kViewcontroller, kNodeType,
                         [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                         [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                         [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                         @"CSIITabBarViewController>1|CSIIWealthViewController>1",kNavigationObject,
                         @"CSIIFundViewController",kSendController,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"理财",kNodeName,
                         @"理财", kImage,
                         @"理财", kImageSeleted,
                         @"理财",kMenuListImage,
                         [NSNumber numberWithInt:2], kSortNum,
                         [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                         kViewcontroller, kNodeType,
                         [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                         [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                         [[NSNumber alloc]initWithBool:YES],kIsReadOnly,
                         @"CSIITabBarViewController>1|CSIIWealthViewController>2",kNavigationObject,
                         @"CSIIFinancingViewController",kSendController,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"步步唯盈",kNodeName,
                         kMenuIcons, kNodeType,
                         @"步步唯盈",kMenuListImage,
                         SepProf, kItems,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"江南盈",kNodeName,
                         @"江南盈", kImage,
                         @"江南盈", kImageSeleted,
                         @"江南盈",kMenuListImage,
                         [NSNumber numberWithInt:0], kSortNum,
                         [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                         kViewcontroller, kNodeType,
                         [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                         [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                         [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                         @"CSIITabBarViewController>1|CSIIWealthViewController>4",kNavigationObject,
                         @"CSIIJNYViewController",kSendController,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"通知存款",kNodeName,
                         kMenuIcons, kNodeType,
                         @"通知存款",kMenuListImage,
                         NotifyDeposit, kItems,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"智能转存",kNodeName,
                         @"智能转存", kImage,
                         @"智能转存", kImageSeleted,
                         @"智能转存",kMenuListImage,
                         [NSNumber numberWithInt:0], kSortNum,
                         [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                         kViewcontroller, kNodeType,
                         [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                         [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                         [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                         @"CSIITabBarViewController>1|CSIIWealthViewController>6",kNavigationObject,
                         @"IntelLigentSavViewController",kSendController,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"积存金",kNodeName,
                         @"积存金", kImage,
                         @"积存金", kImageSeleted,
                         @"积存金",kMenuListImage,
                         [NSNumber numberWithInt:2], kSortNum,
                         [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                         kViewcontroller, kNodeType,
                         [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                         [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                         [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                         @"CSIITabBarViewController>1|CSIIWealthViewController>7",kNavigationObject,
                         @"CSIIJiCunBuyOrReturnViewController",kSendController,
                         nil],
                        nil];
    
    
#pragma mark - 活动信息 --> 抢月饼，抢红包
    NSArray * ActivityGrab = [NSArray arrayWithObjects:
                              //                          [NSDictionary dictionaryWithObjectsAndKeys:
                              //                           @"抢月饼",kNodeName,
                              //                           @"抽奖活动", kImage,
                              //                           @"抽奖活动", kImageSeleted,
                              //                           @"抽奖活动",kMenuListImage,
                              //                           [NSNumber numberWithInt:4], kSortNum,
                              //                           @"69",kNodeIndex,
                              //                           kWebNetwork, kNodeType,
                              //                           @"MoonCake",kActionId,
                              //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                              //                           [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                              //                           [[NSNumber alloc]initWithBool:YES],kIsReadOnly,
                              //                           @"CSIITabBarViewController>0|CSIIFirstViewController>1",kNavigationObject,
                              //                           @"WebViewController",kSendController,
                              //                           nil],
                              
                              //                          [NSDictionary dictionaryWithObjectsAndKeys:
                              //                           @"抢EXO门票",kNodeName,
                              //                           @"抽奖活动", kImage,
                              //                           @"抽奖活动", kImageSeleted,
                              //                           @"抽奖活动",kMenuListImage,
                              //                           [NSNumber numberWithInt:0], kSortNum,
                              //                           @"70",kNodeIndex,
                              //                           kWebNetwork, kNodeType,
                              //                           @"EXO",kActionId,
                              //                           [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                              //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                              //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                              //                           @"CSIITabBarViewController>0|CSIIFirstViewController>1",kNavigationObject,
                              //                           @"WebViewController",kSendController,
                              //                           nil],
                              
                              [NSDictionary dictionaryWithObjectsAndKeys:
                               @"摇一摇抽奖",kNodeName,
                               @"抽奖活动", kImage,
                               @"抽奖活动", kImageSeleted,
                               @"抽奖活动",kMenuListImage,
                               [NSNumber numberWithInt:0], kSortNum,
                               [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                               kWebNetwork, kNodeType,
                               @"YaoYiYao",kActionId,
                               [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                               [[NSNumber alloc]initWithBool:NO],kIsDisplay,
                               [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
                               @"CSIITabBarViewController>0|CSIIFirstViewController>1",kNavigationObject,
                               @"WebViewController",kSendController,
                               nil],
                              [NSDictionary dictionaryWithObjectsAndKeys:
                               @"工会卡红包",kNodeName,
                               @"抽奖活动", kImage,
                               @"抽奖活动", kImageSeleted,
                               @"抽奖活动",kMenuListImage,
                               [NSNumber numberWithInt:7], kSortNum,
                               [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                               kWebNetwork, kNodeType,
                               @"NewYear",kActionId,
                               [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                               [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                               [[NSNumber alloc]initWithBool:YES],kIsReadOnly,
                               @"CSIITabBarViewController>0|CSIIFirstViewController>1",kNavigationObject,
                               @"WebViewController",kSendController,
                               nil],
                              nil];
    
    //#pragma mark - 移动生活
    //    NSArray * mobileLife = [NSArray arrayWithObjects:
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"邻里生活",kNodeName,
    //                           @"邻里生活6", kImage,
    //                           @"邻里生活6", kImageSeleted,
    //                           @"邻里生活6",kMenuListImage,
    //                           [NSNumber numberWithInt:3], kSortNum,
    //                           @"72",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           @"PreferentialInfo",kActionId,
    //                           [[NSNumber alloc]initWithBool:NO],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:YES],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:YES],kIsReadOnly,
    //                           @"CSIITabBarViewController>2|CSIILifeViewController>0",kNavigationObject,
    //                           @"CSIILifeViewController",kSendController,
    //                           nil],
    //
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"品质生活",kNodeName,
    //                           @"品质生活6", kImage,
    //                           @"品质生活6", kImageSeleted,
    //                           @"品质生活6",kMenuListImage,
    //                           [NSNumber numberWithInt:4], kSortNum,
    //                           @"73",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           @"PreferentialMerchant",kActionId,
    //                           [[NSNumber alloc]initWithBool:NO],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>2|CSIILifeViewController>1",kNavigationObject,
    //                           @"CSIILifeViewController",kSendController,
    //                           nil],
    //
    //                          [NSDictionary dictionaryWithObjectsAndKeys:
    //                           @"线上金融",kNodeName,
    //                           @"线上金融6", kImage,
    //                           @"线上金融6", kImageSeleted,
    //                           @"线上金融6",kMenuListImage,
    //                           [NSNumber numberWithInt:3], kSortNum,
    //                           @"74",kNodeIndex,
    //                           kViewcontroller, kNodeType,
    //                           ActivityGrab, kItems,
    //                           [[NSNumber alloc]initWithBool:NO],kNeedLogin,
    //                           [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                           [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                           @"CSIITabBarViewController>2|CSIILifeViewController>2",kNavigationObject,
    //                           @"CSIILifeViewController",kSendController,
    //                           nil],
    
    //                            [NSDictionary dictionaryWithObjectsAndKeys:
    //                             @"江南特惠",kNodeName,
    //                             @"移动生活_MenuIcon", kImage,
    //                             @"移动生活_MenuIcon", kImageSeleted,
    //                             @"移动生活_MenuIcon",kMenuListImage,
    //                             [NSNumber numberWithInt:3], kSortNum,
    //                             @"75",kNodeIndex,
    //                             kViewcontroller, kNodeType,
    //                             ActivityGrab, kItems,
    //                             [[NSNumber alloc]initWithBool:NO],kNeedLogin,
    //                             [[NSNumber alloc]initWithBool:NO],kIsDisplay,
    //                             [[NSNumber alloc]initWithBool:NO],kIsReadOnly,
    //                             @"CSIITabBarViewController>2|CSIILifeViewController>3",kNavigationObject,
    //                             @"CSIILifeViewController",kSendController,
    //                             nil],
    //                          nil];
    /*************************************************************************************************/
#pragma mark - 功能模块
    NSArray *items = [NSArray arrayWithObjects:
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"借记卡",kNodeName,
                       kMenuIcons, kNodeType,
                       @"借记卡",kMenuListImage,
                       DebitCard, kItems,
                       nil],
                      
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"信用卡",kNodeName,
                       kMenuIcons, kNodeType,
                       @"信用卡",kMenuListImage,
                       Credit, kItems,
                       nil],
                      
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"财富",kNodeName,
                       kMenuIcons, kNodeType,
                       @"理财",kMenuListImage,
                       Wealth, kItems,
                       nil],
                      //                      
                      //                      [NSDictionary dictionaryWithObjectsAndKeys:
                      //                       @"移动生活",kNodeName,
                      //                       kMenuIcons, kNodeType,
                      //                       @"移动生活_MenuIcon",kMenuListImage,
                      //                       mobileLife, kItems,
                      //                       nil],
                      
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"助手",kNodeName,
                       kMenuIcons, kNodeType,
                       @"助手_MenuIcon",kMenuListImage,
                       Assistant, kItems,
                       nil],
                      
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"抽奖活动",kNodeName,
                       kMenuIcons, kNodeType,
                       @"活动",kMenuListImage,
                       ActivityGrab, kItems,
                       nil],
                      
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"工会卡商圈",kNodeName,
                       @"工会卡商圈", kImage,
                       @"工会卡商圈", kImageSeleted,
                       @"工会卡商圈",kMenuListImage,
                       [NSNumber numberWithInt:5], kSortNum,
                       [NSString stringWithFormat:@"%ld",kIndexValue++],kNodeIndex,
                       kWebNetwork, kNodeType,
                       @"PreferentialMerchant",kActionId,
                       [[NSNumber alloc]initWithBool:YES],kNeedLogin,
                       [[NSNumber alloc]initWithBool:YES],kIsDisplay,
                       [[NSNumber alloc]initWithBool:YES],kIsReadOnly,
                       @"CSIITabBarViewController>0|CSIIFirstViewController>1",kNavigationObject,
                       @"WebViewController",kSendController,
                       nil],
                      
                      nil];
    
    NSDictionary *root = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"添加我的最爱",kNodeName,
                          @"", kImage,
                          kMenuList, kNodeType,
                          [NSString string], kTarget,
                          items, kItems,
                          [[NSNumber alloc]initWithInt:40], @"sortMaxNum",
                          nil];
    
    NSString *path = DOCUMENT_FOLDER(kMenuFileName);
    [root writeToFile:path atomically:YES];
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com