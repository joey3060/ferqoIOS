//
//  SiMPNiCReport.h
//  SiMPNiCore
//
//  Created by Jim_Hsu on 2018/7/5.
//  Copyright © 2018年 Jim_Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SiMPNiCReport : NSObject
+ (SiMPNiCReport *) Management;
- (void) startReportServcie:(NSString *)ip Port:(int)port;
- (void) stopReportService;
@end
