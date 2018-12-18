//
//  AFHTTPSession.h
//  smartIOT
//
//  Created by Jim_Hsu on 2018/1/3.
//  Copyright © 2018年 Jim_Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSession : NSObject
+ (AFHTTPSessionManager *) instance;
@end
