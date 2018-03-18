//
//  FXJSortView.m
//  标签排序Demo
//
//  Created by 冯学杰 on 16/4/5.
//  Copyright © 2016年 冯学杰. All rights reserved.
//
//  如果arr的数量超过100,需要手动修改代码
//  水平太低 代码太乱，请见谅- -

#import "FXJSortView.h"

#define distance 20 //标签间的距离
#define numOfRow 4 //每行的按钮数量
#define buttonWidth (SCREEN_WIDTH - distance * (numOfRow+1)) / numOfRow
#define buttonHeight 20
#define sectionHeight 20

@implementation FXJSortView{
    CGPoint recognizerPoint;
    NSMutableArray *secondSectionArr;//存放未选中的
    NSMutableArray *btnArr;//存放所有Btn 避免后面拖动判断时判断到其他控件
}


//创建titleList
-(void)firstTitleBtns:(NSArray *)arr{

    self.backgroundColor = [UIColor whiteColor];
    
    self.lineImageView = [[UIImageView alloc]init];
    self.lineImageView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.lineImageView];
    
    secondSectionArr = [[NSMutableArray alloc]init];
    btnArr = [[NSMutableArray alloc]init];
    self.newtitleArr  = [[NSMutableArray alloc] init];
    for(id obj in arr)
    {
        [self.newtitleArr addObject: obj];
    }
    for (int i = 0; i < arr.count; i++) {
        
        
       
        
        CGFloat btnX = distance + (buttonWidth + distance) * (i % numOfRow);
        CGFloat btnY = (buttonHeight + distance) * (i / numOfRow);
        MyButton *btn = [MyButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, btnY, buttonWidth, buttonHeight);
        btn.backgroundColor = [UIColor whiteColor];
        [btn.layer setBorderWidth:0.3]; //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 0.5 });
        [btn.layer setBorderColor:colorref];//边框颜色
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
        btn.tag = i+1;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        //事件
        [btn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
        //添加手势
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(LongPress:)];
        
        [btn addGestureRecognizer:longPress];
        [btnArr addObject:btn];
        [self addSubview:btn];
       
    }

}

-(void)secondTitleBtns:(NSArray *)arr{
    for(id obj in arr)
    {
        [secondSectionArr addObject: obj];
    }
    for (int i = 0; i < arr.count; i++) {
        

        MyButton *btn = [MyButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        [btn.layer setBorderWidth:0.3]; //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 0.5 });
        [btn.layer setBorderColor:colorref];//边框颜色
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
        btn.tag = i+100;
        btn.isDown = YES;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        //事件
        [btn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
        //添加手势
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(LongPress:)];
        
        [btn addGestureRecognizer:longPress];
        [btnArr addObject:btn];
        [self addSubview:btn];
        [self NextSection];
        
    }
}

#pragma mark - 按钮位置改变

//调整第二个section位置
-(void)NextSection{
    CGFloat row = 0.0;
    if (self.newtitleArr.count % numOfRow ==0) {
        row = (self.newtitleArr.count / numOfRow);
    }else{
        row = (self.newtitleArr.count / numOfRow +1);
    }
    
    CGFloat firstSectionHeght = row * (buttonHeight+distance);
    self.lineImageView.frame = CGRectMake(10, firstSectionHeght, SCREEN_WIDTH-20, 0.5);
    
    for (int i = 0; i< secondSectionArr.count; i++) {
            MyButton *button = [self viewWithTag:i+100];
            //button现在的位置
            NSInteger nowWeiZhi=secondSectionArr.count-i;
            CGFloat btnX = distance + (buttonWidth + distance) * ((nowWeiZhi-1) % numOfRow);
            CGFloat btnY = (buttonHeight + distance) * ((nowWeiZhi-1) / numOfRow);

            [UIView animateWithDuration:0.3 animations:^{
                button.frame = CGRectMake(btnX, firstSectionHeght+sectionHeight+btnY, buttonWidth, buttonHeight);
            }];
    }
}
//改变后第一个secontion按钮的Btn变化
-(void)changeUpTag:(NSInteger)changeTag{
    //修改后面btn的位置
    for (NSInteger i = changeTag; i<=self.newtitleArr.count; i++) {
        MyButton *button = [self viewWithTag:i+1];
        button.tag = i;
        CGFloat btnX = distance + (buttonWidth + distance) * ((i-1) % numOfRow);
        CGFloat btnY = (buttonHeight + distance) * ((i-1) / numOfRow);
        [UIView animateWithDuration:0.3 animations:^{
            button.frame = CGRectMake(btnX, btnY, buttonWidth, buttonHeight);
        }];
    }
}

-(void)btnUp:(MyButton *)sender{
    //改变后第二个secontion按钮的Btn变化
    for (NSInteger i = sender.tag; i<secondSectionArr.count+100; i++) {
        MyButton *button = [self viewWithTag:i+1];
        button.tag = i;
        
    }
    //修改上移按钮的位置
    sender.tag = self.newtitleArr.count;
    sender.isDown = NO;
    CGFloat btnX = distance + (buttonWidth + distance) * ((sender.tag-1) % numOfRow);
    CGFloat btnY = (buttonHeight + distance) * ((sender.tag-1) / numOfRow);
    [UIView animateWithDuration:0.3 animations:^{
        sender.frame = CGRectMake(btnX, btnY, buttonWidth, buttonHeight);
    }];
    
    //修改后面btn的位置
    [self NextSection];
}


#pragma mark - 按钮事件 
//按钮改变
-(void)touchBtn:(MyButton *)sender{
    if (sender.isDown == NO) {
        [self.newtitleArr removeObjectAtIndex:sender.tag-1];
        [self changeUpTag:sender.tag];
        
        sender.isDown = YES;
        sender.tag = secondSectionArr.count+100;
        NSString *title = sender.titleLabel.text;
        [secondSectionArr insertObject:title atIndex:0];
        [self NextSection];
        
    }else{
        NSInteger weiZhi=secondSectionArr.count-sender.tag+100-1;
        NSString *str = [secondSectionArr objectAtIndex:weiZhi];
        [secondSectionArr removeObjectAtIndex:weiZhi];
        [self.newtitleArr addObject:str];

        [self btnUp:sender];
    }
}
#pragma mark - 手势事件

//长按
- (void)LongPress:(UIGestureRecognizer *)recognizer{
    
    MyButton *recognizerView = (MyButton *)recognizer.view;
    if (recognizerView.isDown == NO) {
        // 触碰点
        recognizerPoint = [recognizer locationInView:self];
        //begin
        if (recognizer.state == UIGestureRecognizerStateBegan) {
            
            
            [UIView animateWithDuration:0.2 animations:^{
                recognizerView.transform = CGAffineTransformMakeScale(1.3, 1.3);
                recognizerView.alpha = 0.7;
            }];
            [self bringSubviewToFront:recognizerView];
            
        }//change
        else if (recognizer.state == UIGestureRecognizerStateChanged){
            
            recognizerView.center = recognizerPoint;
            for (MyButton *btn in btnArr) {
                if (CGRectContainsPoint(btn.frame, recognizerView.center)&& btn!= recognizerView && btn.isDown ==NO) {
                    
                    if (btn.tag > recognizerView.tag) {
                        //向后
                        long int to = btn.tag;
                        long int from = recognizerView.tag;
                        
                        NSString *str = [self.newtitleArr objectAtIndex:from - 1];
                        [self.newtitleArr removeObjectAtIndex:from - 1 ];
                        [self.newtitleArr insertObject:str atIndex:to - 1 ];
                        
                        for (long int i = from; i<=to; i++) {
                            if (i==to) {
                                recognizerView.tag = to;
                            }else{
                                MyButton *onebtn = [self viewWithTag:i+1];
                                onebtn.tag = i;
                                CGFloat btnX = distance + (buttonWidth + distance) * ((i-1) % numOfRow);
                                CGFloat btnY = (buttonHeight + distance) * ((i-1) / numOfRow);
                                [UIView animateWithDuration:0.3 animations:^{
                                    onebtn.frame = CGRectMake(btnX, btnY, buttonWidth, buttonHeight);
                                    
                                }];
                            }
                        }
                    } else {
                        //向前
                        long int twoto = btn.tag;
                        long int twofrom = recognizerView.tag;
                        
                        NSString *str = [self.newtitleArr objectAtIndex:twofrom - 1];
                        [self.newtitleArr removeObjectAtIndex:twofrom - 1 ];
                        [self.newtitleArr insertObject:str atIndex:twoto - 1 ];
                        
                        for ( NSInteger i = twofrom; i>= twoto; i--) {
                            if (i == twoto) {
                                recognizerView.tag = twoto;
                            }else{
                                MyButton *twobtn = [self viewWithTag:i-1];
                                twobtn.tag = i;
                                CGFloat btnX = distance + (buttonWidth + distance) * ((i-1) % numOfRow);
                                CGFloat btnY = (buttonHeight + distance) * ((i-1) / numOfRow);
                                [UIView animateWithDuration:0.3 animations:^{
                                    twobtn.frame = CGRectMake(btnX, btnY, buttonWidth, buttonHeight);
                                }];
                                
                            }
                        }
                    }
                }
            }
        } else if (recognizer.state == UIGestureRecognizerStateEnded){
            //长按结束
            [UIView animateWithDuration:0.2 animations:^{
                recognizerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                recognizerView.alpha = 1;
                CGFloat btnX = distance + (buttonWidth + distance) * ((recognizerView.tag - 1) % numOfRow);
                CGFloat btnY = (buttonHeight + distance) * ((recognizerView.tag -1) / numOfRow);
                [UIView animateWithDuration:0.3 animations:^{
                    recognizerView.frame = CGRectMake(btnX, btnY, buttonWidth, buttonHeight);
                }];
            }];
        }
    }
    
}

@end


@implementation MyButton

@end
