//
//  ConnectionINFO.h
//  SiMPNiCore
//
//  Created by Jim_Hsu on 2018/6/13.
//  Copyright © 2018年 Jim_Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionINFO : NSObject
+ (ConnectionINFO *) instance;
@property (nonatomic, retain) NSString * ipAddress;
@property (nonatomic, assign) int port;
@property (nonatomic, assign) int port2;
@property (nonatomic, assign) BOOL isLan;
@end
