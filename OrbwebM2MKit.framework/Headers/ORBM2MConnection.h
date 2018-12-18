//
//  ORBM2MConnection.h
//  OrbwebM2MKit
//
//  Created by Orbweb Taiwan Inc on 5/8/15.
//  Copyright (c) 2015 Orbweb Taiwan Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

const static NSInteger kMaxMappingPort = 20001;
const static NSInteger kMinMappingPort = 10001;
const static NSInteger kIPCamRemotePort = 554;
const static NSInteger KIPCamSocketPort = 9001;
const static NSInteger KIPCamHttpPort = 81;

typedef NS_ENUM(NSUInteger, ORBM2MAuthStatus) {
    ORBM2MAuthNotConnected,
    ORBM2MAuthConnected,
    ORBM2MAuthConnecting
};

/** @name ORBM2MConnection */
/** An ORBM2MConnection object lets you manage the M2M connection with a specific SID. */
@interface ORBM2MConnection : NSObject

- (instancetype)initWithConnectionKey:(NSString *)key identifier:(NSString *)identifier;

///----------------------------
/// @name Properties
///----------------------------

 /** 
  The currently connected P2P server ID with the session id. 
  */
@property (nonatomic, readonly) NSString *identifier;

 /** 
  The currently linked tunnel connection session id.
  */
@property (nonatomic, readonly) NSString *connectionSID;

 /** 
  The currently linked tunnel connection server id.
  */
@property (nonatomic, readonly) NSString *serverId;

 /** 
  The currently linked tunnel peer address. 
  */
@property (nonatomic, readonly) NSString *peerAddress;

 /** 
  The currently P2P connection type(`ORBM2MType`).
  */
@property (nonatomic, assign) int m2mConnectionType;

 /** 
  The currently linked P2P connection defaults rtsp port mapped from port 554.
  **/
@property (nonatomic, assign) NSInteger rtspMappedPort;

 /** 
  The currently linked P2P connection defaults socket port mapped from port 9001.
  */
@property (nonatomic, assign) NSInteger socketMappedPort;

 /** 
  The currently linked P2P connection defaults http port mapped from port 81.
  */
@property (nonatomic, assign) NSInteger httpMappedPort;

 /** 
  The currently linked P2P connection mapped ports dictionary. 
  */
@property (nonatomic, strong) NSDictionary *mappedPortDict;

/**
 The currently linked P2P connection is authorized.
 **/
@property (nonatomic, assign) ORBM2MAuthStatus authorized;

///----------------------------
/// @name Methods
///----------------------------

/** @brief Map port with a connection directly
 @discussion mapping port
 @param remotePort  remote Port
 @param localPort Local port
 @param outError Mapping error
 */
- (nullable NSNumber *)localMappedPortWithRemotePort:(NSInteger)remotePort startingLocalPort:(NSInteger)localPort error:(inout NSError **)outError;
/*!
 @discussion 停止Mapped port
 @param remotePort remote port
 */
- (void)unmapPortMappingWithRemotePort:(NSInteger)remotePort;

/*!
 @discussion 停止全部已配對的port
 */
- (void)unmapAllPortMappings;


/*!
 @discussion set peer address
 @param peerAddress Set a peer address
 */
- (void)setPeerAddress:(NSString *)peerAddress;
@end

NS_ASSUME_NONNULL_END
