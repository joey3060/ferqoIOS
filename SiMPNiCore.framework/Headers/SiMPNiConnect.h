//
//  SiMPNiConnect.h
//  SiMPNiCore
//
//  Created by Jim_Hsu on 2018/6/13.
//  Copyright © 2018年 Jim_Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OrbwebM2MKit/OrbwebM2MKit.h>
#import "ConnectionINFO.h"
#import "ErrorDefine.h"
#import "SiMPNiCReport.h"

@interface SiMPNiConnect : NSObject {
    BOOL enterBackground;
}
+ (SiMPNiConnect *) instance;
- (void) initSiMPNiCNotification;
- (void) startConnection:(NSString *)UID Result:(void(^)(SiMPNiC_CONNECTION_ERROR errorCode))info;
- (void) checkUIDisInLan:(NSString *)UID result:(void(^)(BOOL inLan))info;
- (BOOL) checkUIDAlreadyConnected:(NSString *) SID;
- (void) closeConnection;
- (void) findLocalGateway:(void(^)(NSDictionary * localGatewayDict)) LocalGatewayDict;
- (void) startReportService;
- (void) stopReportService;
@end
