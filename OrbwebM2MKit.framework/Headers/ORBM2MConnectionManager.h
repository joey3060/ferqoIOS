//
//  ORBM2MConnectionManager.h
//  OrbwebM2MKit
//
//  Created by Orbweb Taiwan, Inc on 5/7/15.
//  Copyright (c) 2015 Orbweb Taiwan, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ORBM2MConnection;
@protocol ORBM2MConnectionManagerDelegate;

/// ==========================
/// @name ORBM2MErrorCode
/// ==========================
/** ORBM2M Error Domain description */
typedef NS_ENUM(NSUInteger, ORBM2MErrorCode) {
    
    /// M2M connect success
    ORBM2M_CONN_ERROR_NONE = 0,
    /// Rendezvous server received unknown data format.
    ORBM2M_CONN_SERVER_POST_UNKNOWDATA = 1001,
    /// Rendezvous server cannot identify device role(client/host).
    ORBM2M_CONN_SERVER_UNKNOWNROLE = 1002,
    /// Client/host registered with invalid SID
    ORBM2M_CONN_SERVER_INVALID_SID = 1003,
    /// Rendezvous server cannot find TaT Server.
    ORBM2M_CONN_SERVER_NO_VALID_TAT = 1004,
    /// Host not registered
    ORBM2M_CONN_SERVER_HOST_NOT_EXIST = 1005,
    /// Rendezvous server response unknown info
    ORBM2M_CONN_SERVER_UNKNOWNINFO_ERROR = 1006,
    /// Rendezvous server error
    ORBM2M_CONN_HOST_RENDEZVOUS_SERVER_ERROR = 2000,
    /// Host register to TaT server timeout
    ORBM2M_CONN_HOST_REGISTER_TAT_SERVER_TIMEOUT,
    /// Host register to TaT server fail
    ORBM2M_CONN_HOST_REGISTER_TAT_SERVER_FAIL,
    /// Session ID is not registered.
    ORBM2M_CONN_HOST_SESSION_ID_NOT_REGISTERED,
    /// Session ID is already registered.
    ORBM2M_CONN_HOST_SESSION_ID_ALREADY_REGISTERED,
    /// tunnel is not ready.
    ORBM2M_CONN_HOST_TUNNEL_NOT_EXIST,
    /// Host local port is already used
    ORBM2M_CONN_HOST_LOCAL_PORT_ALREADY_USED,
    /// Host local port is not in port mapping
    ORBM2M_CONN_HOST_LOCAL_PORT_NOT_MAPPED,
    /// Host local port is not under listening.
    ORBM2M_CONN_HOST_LOCAL_PORT_NOT_LISTENED,
    /// Missing host configuration file.
    ORBM2M_CONN_HOST_MISSING_CONFIGURATION,
    /// Host has no memory
    ORBM2M_CONN_HOST_NOMEMORY,
    
    /// Rendezvous server error
    ORBM2M_CONN_CLIENT_RENDEZVOUS_SERVER_ERROR = 3000,
    /// Client connect host timeout.
    ORBM2M_CONN_CLIENT_CONNECT_HOST_TIMEOUT,
    /// Client connect host fail.
    ORBM2M_CONN_CLIENT_CONNECT_HOST_FAIL,
    /// Session ID is not registered.
    ORBM2M_CONN_CLIENT_SESSION_ID_NOT_REGISTERED,
    /// Session ID is already registered.
    ORBM2M_CONN_CLIENT_SESSION_ID_ALREADY_REGISTERED,
    /// Tunnel is not ready.
    ORBM2M_CONN_CLIENT_TUNNEL_NOT_EXIST,
    /// Host local port is already used
    ORBM2M_CONN_CLIENT_LOCAL_PORT_ALREADY_USED,
    /// Host local port is not in port mapping
    ORBM2M_CONN_CLIENT_LOCAL_PORT_NOT_MAPPED,
    /// Host local port is not under listening.
    ORBM2M_CONN_CLIENT_LOCAL_PORT_NOT_LISTENED,
    /// Missing client configuration file.
    ORBM2M_CONN_CLIENT_MISSING_CONFIGURATION,
    /// Client has no memory.
    ORBM2M_CONN_CLIENT_NOMEMORY,
    
    /// M2M bonjour service invalidate SID.
    ORBM2M_BJ_INVALID_SID = 4000,
    /// M2M bonjour service invalidate timeout.
    ORBM2M_BJ_INVALID_TIMEOUT,
    /// M2M bonjour service host not existed.
    ORBM2M_BJ_HOST_EXISTED,
    /// M2M bonjour service has no memory.
    ORBM2M_BJ_NOMEMORY,
    /// M2M bonjour service timeout.
    ORBM2M_BJ_TIMEOUT,
    /// M2M bonjour service unknown error.
    ORBM2M_BJ_UNKNOWN
};

/** @brief ORBM2MType */
typedef NS_OPTIONS (NSUInteger, ORBM2MType) {
    /// LAN TCP
    ORBM2MType_TCP_Lan = 1,
    /// TCP NAT Traversal
    ORBM2MType_TCP = 1 << 1,
    /// UDP NAT Traversal
    ORBM2MType_UDP = 1 << 2,
    /// Relay
    ORBM2MType_Relay = 1 << 3,
    /// P2P option
    ORBM2MType_P2P = ORBM2MType_TCP_Lan | ORBM2MType_TCP | ORBM2MType_UDP
};

/** ORBM2MConnectionResultBlock */
typedef void(^ORBM2MConnectionResultBlock)(ORBM2MConnection  * _Nullable connection, NSError * _Nullable error);

/** ORBM2MConnectionManager lets you manage the M2M connections to remote devices.*/
@interface ORBM2MConnectionManager : NSObject

///----------------------------
/// @name Properties
///----------------------------

/**
 @brief Returns the rendezousServier domain name, default is (rdz.orbwebsys.com).
 */
@property (nonatomic, copy) NSString *rendezvousServerDomainName;


///----------------------------
/// @name Methods
///----------------------------

/**
 Access the shared `ORBM2MConnectionManager` instance
 @return Returns the shared `ORBM2MConnectionManager` instance
 */
+ (ORBM2MConnectionManager*)defaultManager;


/**
 @brief Project version number for OrbwebM2MKit.
 @return OrbwebM2M library version number
 */
+ (NSString*)OrbwebM2MKitVersionNumber;

/**
 @brief Create connection manager with a specific server domain.
 @discussion Create ConnectionManager with specific server domain (You don't need to use this function if you use Singleton object [defaultManager]。)
 @param domainName a FQDN domainName
 */
- (instancetype)initWithRendezvousServerDomainName:(NSString *)domainName;

///----------------------------
/// @name Connect M2M Methods
///----------------------------

/** Implements a M2M interface synchronize to ORBM2MConnection.
 @note You MUST initialize the [ORBM2MConnectionManager defaultManager] before calling any other method.
 @discussion Connect M2M is synchronous.
 @param SID M2M Connection SID.
 @param outError Connection error
 @return ORBM2MConnection
 */
- (ORBM2MConnection*)syncConnectWithSID:(NSString *)SID
                                  error:(inout NSError **)outError;

/** Implements a M2M interface synchronize to ORBM2MConnection with `ORBM2MType`.
 @note You MUST initialize the [ORBM2MConnectionManager defaultManager] before calling any other method.
 @discussion Connect M2M is synchronous.
 @param SID M2M Connection SID.
 @param type ORBM2MType
 @param outError Connection error
 @return ORBM2MConnection
 */
- (ORBM2MConnection*)syncConnectWithSID:(NSString *)SID
                                m2mType:(ORBM2MType)type
                                  error:(inout NSError **)outError ;

/** Implements a M2M interface asynchronous to ORBM2MConnection
 @note You MUST initialize the [ORBM2MConnectionManager defaultManager] before calling any other method.
 @discussion Connect M2M is asynchronous.
 Connection will be notified on the `ORBM2MConnnectionDidConnectedNotification` notification.
 @param SID M2M Connection SID.
 @param remotePorts Remote ports for local mapping
 @param completeBlock callback (`ORBM2MConnection`\*, NSError\*) result block.
 */
- (void)asyncConnectWithSID:(NSString *)SID
                remotePorts:(NSArray *)remotePorts
                    success:(ORBM2MConnectionResultBlock)completeBlock;

/** Implements a M2M interface asynchronous to ORBM2MConnection with `ORBM2MType`
 @note You MUST initialize the `ORBM2MConnectionManager defaultManager` before calling any other method.
 @discussion Connect M2M is asynchronous.
 Connection will be notified on the [ORBM2MConnnectionDidConnectedNotification] notification.
 @param SID M2M Connection SID
 @param remotePorts Remote ports for local mapping
 @param type ORBM2MType
 @param completeBlock callback (`ORBM2MConnection`\*, NSError\*) result block
 */
- (void)asyncConnectWithSID:(NSString *)SID
                remotePorts:(NSArray *)remotePorts
                       type:(ORBM2MType)type
                    success:(ORBM2MConnectionResultBlock)completeBlock;

/*! Implements a M2M interface asynchronous to ORBM2MConnection with customized local ports
 @param SID M2M Connection SID.
 @param localPorts Use specify local ports.
 @param remotePorts Remote ports to mapping as NSNumber
 @param completeBlock callback (`ORBM2MConnection`\*, NSError\*) result block.
 */
- (void)asyncConnectWithSID:(NSString *)SID
          specifyLocalPorts:(NSArray*)localPorts
                remotePorts:(NSArray*)remotePorts
                    success:(ORBM2MConnectionResultBlock)completeBlock;

/*! Implements a M2M interface asynchronous to ORBM2MConnection with customized local ports and `ORBM2MType`
 @param SID M2M Connection SID.
 @param localPorts Use specify local ports.
 @param remotePorts Remote ports to mapping as NSNumber
 @param type M2M connection type.
 @param completeBlock callback (`ORBM2MConnection`\*, NSError\*) result block.
 */
- (void)asyncConnectWithSID:(NSString *)SID
          specifyLocalPorts:(NSArray*)localPorts
                remotePorts:(NSArray*)remotePorts
                       type:(ORBM2MType)type
                    success:(ORBM2MConnectionResultBlock)completeBlock;

/** @brief Get connection if connection exists.
 @param SID M2M Connection SID.
 @return ORBM2MConnection
 */
- (ORBM2MConnection*)getConnectionWithSID:(NSString*)SID;

/** @brief Get authorized connection if connection exists.
 @param SID M2M Connection SID.
 @return ORBM2MConnection
 */
- (ORBM2MConnection*)getAuthorizedConnectionWithSID: (NSString*)SID;

/** @brief mapped other port number
 @param port other mappedPort if you need
 @param SID M2M Connection SID.
 @param completeBlock callback (NSInteger, NSError\*) mappedPort block.
 */
- (void)addPort:(NSInteger)port
        withSID:(NSString*)SID
        success:(void(^)(NSInteger mappedPort, NSError * __nullable error))completeBlock;

/*! @brief Disconnect M2M with a specific sid. */
/// @param key M2M Connection Session ID
- (void)endConnectionWithConnectionKey:(NSString *)key;

/*! @brief Disconnect M2M with a specific service id. */
/// @discussion Disconnect M2M connection with a specific Server ID.
/// @param serverId Server ID return upon successful connection established.
- (void)endConnectionWithServerId:(NSString*)serverId;

/*! @brief Disconnect all M2M connection. */
- (void)endAllConnections;

/*! @brief Release ORBConnection object with a specific sid. */
/// @param SID M2M Connection SID.
- (void)cleanUpTerminatedConnectionWithSID:(NSString *)SID;

/*! @brief Function to check whether the connection is established */
/// @param SID M2M Connection SID.
/// @return boolean value for connection exists or not

- (BOOL)isAlreadyConnectedWithSID:(NSString *)SID;

@end

///----------------------------
/// @name Notifications
///----------------------------

/**
 @notification ORBM2MConnectionWillStartConnectNotification
 Posted when the connection will start connect.
 @available OrbwebM2MKit 1.1
 */
extern NSString * const ORBM2MConnectionWillStartConnectNotification;

/**
 @notification ORBM2MConnectionDidEndNotification
 Posted when the connection did disconnect.
 @available OrbwebM2MKit 1.1
 */
extern NSString * const ORBM2MConnectionDidEndNotification;

/**
 @notification ORBM2MConnnectionDidConnectedNotification
 Posted when the connection connected.
 @available OrbwebM2MKit 1.1
 */
extern NSString * const ORBM2MConnnectionDidConnectedNotification;

/**
 @notification ORBM2MConnectionDidEndTCPRelayNotification
 Posted when the TCP relay did disconnect.
 @available OrbwebM2MKit 1.1
 */
extern NSString * const ORBM2MConnectionDidEndTCPRelayNotification;

/**
 @notification ORBM2MConnectionDidRefreshNotification
 Posted when the connection refreshed to M2M
 @available OrbwebM2MKit 1.1
 */
extern NSString * const ORBM2MConnectionDidRefreshNotification;

/**
 @notification ORBM2MNotifyMessageNotification
 Posted when the connection notify something message.
 @available OrbwebM2MKit 1.1
 */
extern NSString * const ORBM2MNotifyMessageNotification;

/** Used for Notification userinfo.
 notification.userinfo[ORBM2MConnectionServerID]
 */
extern NSString * const ORBM2MConnectionServerID;
extern NSString * const ORBM2MConnectionClientID;
extern NSString * const ORBM2MConnectionPeerAddress;

NS_ASSUME_NONNULL_END

