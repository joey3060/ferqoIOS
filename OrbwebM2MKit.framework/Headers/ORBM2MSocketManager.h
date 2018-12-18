//
//  ORBM2MSocketManager.h
//  OrbwebM2MKit
//
//  Created by Kevin Lin on 2016/6/15.
//  Copyright © 2016年 Orbweb Taiwan Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ORBSocketManagerDelegate;
@interface ORBM2MSocketManager : NSObject

@property (nonatomic, weak) id<ORBSocketManagerDelegate> mdelegate;
@property (nonatomic, assign) NSInteger type; // type 1 json format, type 2 audio data
@property (nonatomic, strong) NSNumber *mappedPort;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, assign) NSUInteger requestTimeout;
- (instancetype)initWithHost:(NSString*)hostIP port:(NSNumber*)port;
- (instancetype)initWithMappedPort:(NSNumber*)socketMappedPort;
- (void)sendCommandData:(NSData*)commandData;
- (void)sendCommandData:(NSData*)commandData success:(void(^)(NSData* responseData))completeBlock failure:(void(^)(NSError* error))failureBlock;
- (void)sendCommand:(NSString*)command;
- (void)sendCommand:(NSString*)command success:(void(^)(NSData* responseData))completeBlock failure:(void(^)(NSError* error))failureBlock;

@end


@protocol ORBSocketManagerDelegate <NSObject>

- (void)socket:(ORBM2MSocketManager*)socket didConnectStart:(NSString*)status;
- (void)socket:(ORBM2MSocketManager*)socket didConnectFinished:(NSString*)status;
- (void)socket:(ORBM2MSocketManager*)socket didConnectFail:(NSError*)error;
- (void)socket:(ORBM2MSocketManager*)socket didReceiveError:(NSError*)error;
- (void)socket:(ORBM2MSocketManager*)socket didResponseData:(NSData*)responseData;

@end
