//
//  SiMPNiCMD.h
//  SiMPNiCore
//
//  Created by Jim_Hsu on 2018/6/19.
//  Copyright © 2018年 Jim_Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionINFO.h"
#import "AFHTTPSession.h"
#import "ENUMDefine.h"
/**
 **/

@interface SiMPNiCMD : NSObject
+ (SiMPNiCMD *) Management;
- (void) SDKVersion;
- (void) getGatewayAllNodeInfo:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failure;
- (void) getGatewaySystemInfo:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getGatewayUID:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) createRoomWithName:(NSString *)name succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) changeRoomName:(NSString *)roomName WithRoomID:(int)roomID succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) removeRoomWithID:(int)roomID succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - About Zwave Include / Exclude
/**
 * backToNormalMode
 * startIncludeMode
 * startExcludeMode
 Need to listen report from gateway and parse
 **/
- (void) backToNormalMode:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) startIncludeMode:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) startExcludeMode:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) checkNodeInformationWithNodeID:(int)nodeID succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) forceRemoveNodeWithID:(int)nodeID succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
#pragma mark -
#pragma mark --- About Zwave Device Settings ---
- (void) setDeviceName:(NSString *)name WithNodeID:(int)nodeID succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) setNodeIntoRoom:(int)roomID withNodeID:(int)nodeID succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - COMMAND_CLASS_SWITCH_BINARY 0x25
/**
     Parameter nodeList means
     nodeID:endPoint or nodeID:endPoint, nodeID:endPoint, ...
     10:0 or 10:0,11:0, ...
     can get one or more devices one time
 **/
- (void) setBinarySwitchStatus:(BINARY_SWITCH_STATUS)status WithNodeID:(int)nodeID endPoint:(int)endPoint succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) setBinarySwitchStatus:(BINARY_SWITCH_STATUS)status WithNodeList:(NSString *)nodeIDList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getBinarySwitchStatusWithNodeList:(NSString *)nodeIDList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - COMMAND_CLASS_SWITCH_MULTILEVEL 0x26
/**
     Status can set range is 0 ~ 99
 **/
- (void) setMultipleSwitchStatus:(MULTIPLE_SWITCH_STATUS)status WithNodeID:(int)nodeID endPoint:(int)endPoint succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) setMultipleSwitchStatus:(MULTIPLE_SWITCH_STATUS)status WithNodeList:(NSString *)nodeIDList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getMultipleSwitchStatusWithNodeList:(NSString *)nodeIDList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - COMMAND_CLASS_DOOR_LOCK 0x62
- (void) setDoorLockStatus:(DOORLOCK_STATUS)status WithNodeID:(int)nodeID endPoint:(int)endPoint succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getDoorLockStatusWithNodeList:(NSString *)nodeList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - COMMAND_CLASS_THERMOSTAT_MODE 0x40
- (void) setThermostatMode:(THERMOSTAT_MODE)mode WithNodeID:(int)nodeID endPoint:(int)endPoint succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getThermostatModeWithNodeList:(NSString *)nodeList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - COMMAND_CLASS_THERMOSTAT_SETPOINT 0x43
/**
     e.q.
     set setPointDict like this
     {
        data = 21;      // key is data, and value is 21(int)
        precision = 0;  // key is precision, and value is 0(int)
        type = 2;       // key is type, and value is 2(int)
        unit = 0;       // key is unit, and value is 0(int)
     }
 
    Type Heating is 1, Cooling is 2
 **/
- (void) setThermoststatSetpoint:(NSMutableDictionary *)setPointDict WithNodeID:(int)nodeID endPoint:(int)endPoint succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getThermoststatSetpointWithNodeList:(NSString *)nodeList AndType:(int)type succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - COMMAND_CLASS_THERMOSTAT_FAN_MODE 0x44
- (void) setThermostatFanMode:(THERMOSTAT_FAN_MODE)fanMode andFanState:(int)fanState WithNodeID:(int)nodeID endPoint:(int)endPoint;
- (void) getThermostatFanModeWithNodeList:(NSString *)nodeList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark - COMMAND_CLASS_METER 0x32
/**
    getMeterTypeKWHWithNodeIDList for Meter Unit kWh
    getMeterTypeWwithNodeIDList for Meter Unit W
 **/
- (void) getMeterTypeKWHWithNodeIDList:(NSString *)nodeList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getMeterTypeWwithNodeIDList:(NSString *)nodeList succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark -
#pragma mark --- About Zwave Scene Settings ---
/**
 Create use :
 {
     "scene":{
         "scene0":{
             "new":"1",     // 1 is Create, 0 is edit
             "id":"193",    // Range, start from
             "to":"222",    // end
             "value":"name,1,2,23213131",   // name,enable,flag,uniqueTime(epochTime)
             "specific": {
                 "situations": {
                 },
                 "criteria": {
                 },
                 "actions": {
                 }
            }
         }
     }
 }
 
 Edit use :
 * edit name, criteria, actions, situations
 {
     "scene":{
         "scene0":{
             "new":"0",     // 1 is Create, 0 is edit
             "id":"193",    // start from
             "value":"name,1,2,23213131",   // name,enable,flag,uniqueTime(epochTime)
             "specific": {
                 "situations": {
                 },
                 "criteria": {
                 },
                 "actions": {
                 }
             }
         }
     }
 }
 **/
- (void) setAutomationWithData:(NSMutableDictionary *)Dict succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) editAutomationStatusWithID:(int)profileID AutomationName:(NSString *)name Enable:(int)enable Flag:(int)flag UniqueTime:(int)uniqueTime succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

/**
 create two scenes at the same time, use this
 {
     "scene": {
         "positive0": {
             "new": 1,
             "id": 191,
             "to": 222,
             "value": "positive,0,2,1530756571",
             "specific": {
                 "situations": {},
                 "criteria": {},
                 "actions": {
                    "1":"0,cmd/node/7:0/class/bswitch/act/set 0"
                 }
             }
         },
         "nagative0": {
             "new": 1,
             "id": 223,
             "to": 254,
             "value": "positive,0,2,1530756571",
             "specific": {
                 "situations": {},
                 "criteria": {},
                 "actions": {
                    "1":"0,cmd/node/7:0/class/bswitch/act/set 255"
                 }
             }
         }
     }
 }
 **/
- (void) setSceneWithData:(NSMutableDictionary *)Dict succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) trySceneActionWithSceneID:(int)sceneID succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

/**
 e.q Dict is like
 param1 =     (
     "1530756571@scene_actn_app_used",  // uniqueTime@scene_actn_app_used
     "-,0,195,227, 0"                   // hotkey (b1~b8, and non is -)
                                           state, 1 is 195, 0 227
                                           postive sceneID
                                           nagative sceneID
                                           reserved
 );
 **/
- (void) setSceneActionState:(NSMutableDictionary *)Dict succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark -
#pragma mark --- Account Settings ---
- (void) createAccount:(NSString *)account WithPassword:(NSString *)password Level:(int)level succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) editAccount:(NSString *)account WithPassword:(NSString *)password Level:(int)level succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) verificationAccount:(NSString *)account WithPassword:(NSString *)password succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getAccountList:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark -
#pragma mark --- Firmware Upgrade ---
/**
 e.q Dict is like
 {
     useSFTP = 1;                   // key is useSFTP, and value 1 is FTP, 4 is SFTP
     Domain = "ota.simpnic.com";    // key is Domain, and value is ota.simpnic.com
     Account = "upgrade";           // key is Account, and value is fw_upgrade
     Password = upgrade;            // key is Password, and value is upgrade
     FileName = @"S1-FW-1.00.03";   // key is FileName, and value is S1-FW-1.00.03
 }
 **/
- (void) firmwareUpgrade:(NSMutableDictionary *)Dict succeed:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getGatewayFirmwareUpgradeProgress:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark -
#pragma mark --- Event Log ---
/**
     count          data count，limit 1000
     nodeID         nodeID， 255 means all node
     commandList    COMMAND_CLASS use decimal eq. 0x71 ->113, e.q. 113,37,38,91,98
 **/
- (void) getEventHistoryWithCount:(int)count nodeID:(int)nodeID commandClassList:(NSString *)commandList success:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;

#pragma mark -
#pragma mark --- About System and Other ---
- (void) rebootGateway:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) saveZwaveConfiguration:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) saveSystemConfiguration:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
- (void) getPNMAuthenticationKey:(void(^)(id responseObject))successed failure:(void(^)(NSError * error))failed;
@end
