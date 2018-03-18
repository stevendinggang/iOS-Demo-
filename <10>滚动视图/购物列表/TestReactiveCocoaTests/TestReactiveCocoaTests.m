//
//  TestReactiveCocoaTests.m
//  TestReactiveCocoaTests
//
//  Created by 马士奎 on 16/1/25.
//  Copyright (c) 2016年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MSKBottomView.h"
@interface TestReactiveCocoaTests : XCTestCase

@end

@implementation TestReactiveCocoaTests

- (void)setUp {
    [super setUp];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testThatItDoesURLEncoding
{
    // given
    NSString *searchQuery = @"$&?@";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"/search?q=%@", searchQuery]]];
    
    // when
    NSString *encodedURL = request.URL;
    
    // then
    XCTAssertEqualObjects(encodedURL, @"/search?q=%24%26%3F%40");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
