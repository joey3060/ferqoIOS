//
//  SiMPNiCPush.h
//  SiMPNiCore
//
//  Created by Jim_Hsu on 2018/7/10.
//  Copyright © 2018年 Jim_Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "app.h"

@protocol SiMPNiCNotification <NSObject>
@required
- (void) getNotificationResult:(NSMutableDictionary *)reslultDict;
@end

@interface SiMPNiCPush : NSObject {
    BOOL closeThread;
}
@property (nonatomic, assign) id<SiMPNiCNotification> delegate;
+ (SiMPNiCPush *) Notification;
- (void) subscribeNotificationWithDict:(NSMutableDictionary *)Dict;
- (void) unSubscribeNotificationWithDict:(NSMutableDictionary *)Dict;
- (void) unsubscribeAllNotificationWithDict:(NSMutableDictionary *)Dict;
- (void) updateGatewayName:(NSMutableDictionary *)Dict;
- (void) updateToken:(NSMutableDictionary *)Dict;
/**
 When setting push notification and enter backgroud need to call
 **/
- (void) closePushNotificationThread;
@end
