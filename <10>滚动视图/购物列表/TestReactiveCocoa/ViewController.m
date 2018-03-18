//
//  ViewController.m
//  TestReactiveCocoa
//
//  Created by 马士奎 on 16/1/25.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import <ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *failLable;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.jumpButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"SecondStoryBoard" bundle:nil];
        NextViewController *nextController = [storyBoard instantiateViewControllerWithIdentifier:@"NextViewController"];
        [self.navigationController pushViewController:nextController animated:YES];
    }];
    
    [[[[self requestAccessToTwitterSignal]
       then:^RACSignal *{
           NSLog(@"dddddd");
           return self.userName.rac_textSignal;
       }]
      filter:^BOOL(NSString *text) {
          NSLog(@"ddfffff");
          return YES;
      }]
     subscribeNext:^(id x) {
         NSLog(@"%@", x);
     } error:^(NSError *error) {
         NSLog(@"An error occurred: %@", error);
     }];
    
    [[[self testThen] then:^RACSignal *{
        return self.textfield2.rac_textSignal;
    }] subscribeNext:^(id x) {
        NSLog(@"sssssss:%@",x);
    }error:^(NSError *error) {
        NSLog(@"sssssss:%@",error);
    }];
}

-(RACSignal *)testThen{
    NSError *error = [NSError errorWithDomain:@"非数字" code:200 userInfo:nil];
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if ([self.userName.text isEqualToString:@"2"]) {
            [subscriber sendNext:self.userName.text];
            [subscriber sendCompleted];
        }else{
            [subscriber sendError:error];
        }
        return nil;
    }];
}

- (RACSignal *)requestAccessToTwitterSignal {

    return [RACSignal createSignal:^RACDisposable *(id subscriber) {
        [subscriber sendNext:nil];
        [subscriber sendCompleted];
        return nil;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
