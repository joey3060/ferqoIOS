//
//  ORBM2MAuth.h
//  OrbwebM2MKit
//
//  Created by Kevin Lin on 12/07/2017.
//  Copyright © 2017 Orbweb Taiwan Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ORBM2MConnection;
/** @typedef ORBM2MAuthResultCallback
 @brief The type of block invoked when sign-in related events complete.
 @param success Optionally; the signed in success.
 @param error Optionally; if an error occurs, this is the NSError object that describes the
 problem. Set to nil otherwise.
 */
typedef void (^ORBM2MAuthResultCallback)(NSDictionary *_Nullable result, ORBM2MConnection *_Nullable connection, NSError *_Nullable error);

/** ORBM2MAuth lets you manage the authorization M2M connections to remote devices.*/
@interface ORBM2MAuth : NSObject

///----------------------------
/// @name Methods
///----------------------------

/**
Access the shared `ORBM2MAuth` instance
@return Returns the shared `ORBM2MAuth` instance
*/
+ (ORBM2MAuth*) shareInstance;

/** Implements a M2M authorized interface asynchronous to ORBM2MConnection
 @note You MUST initialize the [ORBM2MConnectionManager defaultManager] before calling any other method.
 @discussion Connect M2M is asynchronous.
 Connection will be notified on the `ORBM2MConnnectionDidConnectedNotification` notification.
 @param SID M2M Connection SID.
 @param userId Authorization user ID.
 @param password Authorization user password.
 @param completeBlock callback (`NSDictionary`\*,`ORBM2MConnection`\*, NSError\*) result block.
 */
- (void)signInWithSID:(NSString*) SID
               userId:(NSString*) userId
             password:(NSString*) password
           completion:(ORBM2MAuthResultCallback)completeBlock ;

/** Implements a M2M authorized interface with remote ports asynchronous to ORBM2MConnection
 @note You MUST initialize the [ORBM2MConnectionManager defaultManager] before calling any other method.
 @discussion Connect M2M is asynchronous.
 Connection will be notified on the `ORBM2MConnnectionDidConnectedNotification` notification.
 @param SID M2M Connection SID.
 @param userId Authorization user ID.
 @param password Authorization user password.
 @param remotePorts Remote ports for local mapping.
 @param completeBlock callback (`NSDictionary`\*,`ORBM2MConnection`\*, NSError\*) result block.
 */
- (void)signInWithSID:(NSString*) SID
               userId:(NSString*) userId
             password:(NSString*) password
          remotePorts:(NSArray*) remotePorts
           completion:(ORBM2MAuthResultCallback)completeBlock ;

/*
 *
    === result: Login success ===
    {
        "CMD_ID" = "P2P_USER_PASSWORD_RSP";
        STATUS = 0;
    }
 
    === error: Login fail ===
    {
        "CMD_ID" = "P2P_USER_PASSWORD_RSP";
        STATUS = -1;
    }
 *
 */

/*! @brirf Function to set socket stream timeout */
/// @param second set for socket timeout.
- (void)setSocketRequestTimeout:(NSUInteger) second;

/*! @brief Function to check whether the connection is authorized */
/// @param SID M2M Connection SID.
/// @return boolean value for connection exists or not

- (NSUInteger)authorizedStatusWithSID:(NSString*)SID;

/** Notification.
 @notification ORBM2MAuthDidRefreshP2PNotification
 Posted when the authorization M2M connection(TCP/UDP) connected.
 */
extern NSString * const ORBM2MAuthDidRefreshP2PNotification;

@end

NS_ASSUME_NONNULL_END
