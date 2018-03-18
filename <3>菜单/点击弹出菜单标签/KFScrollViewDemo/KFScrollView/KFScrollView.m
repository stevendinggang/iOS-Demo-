//
//  KFScrollView.m
//  KFScrollViewDemo
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 吴凯锋 QQ:24272779. All rights reserved.
//

#import "KFScrollView.h"
#import "ItemButton.h"
#import "KFScrollContentView.h"

#import "UIColor+MLPFlatColors.h"

#define kItemButtonDefaultWitdh 64
#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width

@interface KFScrollView ()
{
    UIScrollView *_topScrollView;
    UIScrollView *_contentScrollView;
    
    float _width;
    float _height;
    
    ItemButton *_tmpTopItemButton;
    UIButton *_tmpMiddleButton;
    UIButton *_tmpButtomButton;
    
    
    void (^SelectTopBlock)(id item);
    void (^SelectMiddleBlock)(UIButton *item,Second *model);
    void (^SelectButtomBlock)(UIButton *item,NSString *title);
}
@property (nonatomic,strong)NSArray *dataArray;
@property (assign)float headerHeight;
@end

@implementation KFScrollView

-(instancetype)initWithFrame:(CGRect)frame headerHeight:(float)headerHeight withArray:(NSArray *)dataArray
{
    if (self = [super initWithFrame:frame]) {
        
        _dataArray = dataArray;
        _headerHeight = headerHeight;
        _width = frame.size.width;
        _height = frame.size.height;
        
        UIScrollView *topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, headerHeight)];
        topScrollView.contentSize = CGSizeMake(kItemButtonDefaultWitdh * dataArray.count, headerHeight);
        [self addSubview:topScrollView];
        topScrollView.showsHorizontalScrollIndicator = NO;
        topScrollView.showsVerticalScrollIndicator = NO;
        _topScrollView = topScrollView;
        
        UIScrollView *contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, headerHeight, KMainScreenWidth, frame.size.height-headerHeight)];
        contentView.contentSize = CGSizeMake(frame.size.width * dataArray.count, frame.size.height-headerHeight);
        [self addSubview:contentView];
        contentView.showsVerticalScrollIndicator = NO;
        contentView.showsHorizontalScrollIndicator = NO;
        contentView.scrollEnabled = NO;
        contentView.pagingEnabled = YES;
        _contentScrollView = contentView;
        
        [self loadButtons];
        
        [self loadContents];
    }
    return self;

}
-(void)didSelectedTop:(void (^)(id))selectedTop selectedMiddle:(void (^)(UIButton *, Second *))selectedMiddle
{
    SelectTopBlock = ^(id item){ selectedTop(item);};
    SelectMiddleBlock = ^(UIButton *item,Second *model){selectedMiddle(item,model);};
}

-(void)itemDidSelected:(ItemButton *)itemButton
{
    _tmpTopItemButton.itemSected = NO;
    _tmpTopItemButton = itemButton;
    _tmpTopItemButton.itemSected = YES;
    if (SelectTopBlock) {
        SelectTopBlock(_tmpTopItemButton.itemModel.kindName);
    }
    [self scrollVisitAtIndex:itemButton.index];
}

-(void)scrollVisitAtIndex:(NSInteger )index
{
    [_contentScrollView scrollRectToVisible:CGRectMake(index * _width, 0, _width, _height-_headerHeight) animated:YES];
}


-(void)itemMiddleDidSelected:(UIButton *)btn second:(Second *)sec
{
    _tmpMiddleButton.backgroundColor = [UIColor whiteColor];
    [_tmpMiddleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _tmpMiddleButton = btn;
    _tmpMiddleButton.backgroundColor = [UIColor flatBlueColor];
    [_tmpMiddleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    if (SelectMiddleBlock) {
        SelectMiddleBlock(btn,sec);
    }
}

//初始上button
-(void)loadButtons
{
    for (int i = 0; i < _dataArray.count; i++) {
        DataModel *itemModel = _dataArray[i];
        ItemButton *item = [[ItemButton alloc]initWithFrame:CGRectMake(i*kItemButtonDefaultWitdh, 0, kItemButtonDefaultWitdh, _headerHeight) item:itemModel];
        item.index = i;
        [_topScrollView addSubview:item];
        
        if (i == 0) {
            [self itemDidSelected:item];
        }
        
        item.selectItem = ^(ItemButton *item)
        {
            [self itemDidSelected:item];
        };
    }
}

-(void)loadContents
{
    for (int i = 0; i < _dataArray.count; i++) {
        DataModel *model = _dataArray[i];
        KFScrollContentView *view = [[KFScrollContentView alloc]initWithFrame:CGRectMake(i * _width, 0, _width, _height-_headerHeight) data:model rowCount:3];
        view.selectedMiddleItem = ^(UIButton *btn,Second *model)
        {
            [self itemMiddleDidSelected:btn second:model];
        };
        [_contentScrollView addSubview:view];
    }
}


@end
