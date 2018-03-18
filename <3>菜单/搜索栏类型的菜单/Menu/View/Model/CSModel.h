//
//  CSModel.h
//  test
//
//  Created by sangcixiang on 16/2/21.
//  Copyright © 2016年 sangcixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSModel : NSObject
@property(nonatomic,strong)NSArray   * list;
@property(nonatomic,copy  )NSString  * name;
@property(nonatomic,copy  )NSString  * parentld;

@property(nonatomic,copy  )NSString   * subID;
@property(nonatomic,copy  )NSString   * subName;
@property(nonatomic,copy  )NSString   * subParentld;

@property(nonatomic,assign)BOOL isShow;
+(NSArray *)getAllModelData:(NSArray *)array;
+(NSArray *)getAllModelInfo:(NSArray *)array;
@end
