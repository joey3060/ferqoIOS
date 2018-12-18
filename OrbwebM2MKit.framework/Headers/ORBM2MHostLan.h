//
//  ORBM2MHostLan.h
//  OrbwebM2MKit
//
//  Created by Kevin Lin on 20/06/2017.
//  Copyright © 2017 Orbweb Taiwan Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ORBM2MHostLan : NSObject

+(ORBM2MHostLan*)shareInstance;

- (void)startHostLanWithSID:(NSString*) SID;
- (void)startClientLanWithSID:(NSArray*) SIDs success:(void(^)(NSDictionary *result, NSError *error))successBlock;

- (void)stopHostLan;
@end
