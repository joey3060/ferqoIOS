//
//  ORBNetGetAddress.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <netinet/in.h>

@interface ORBNetGetAddress : NSObject

//Network type
typedef enum {
    NETWORK_TYPE_NONE = 0,
    NETWORK_TYPE_2G = 1,
    NETWORK_TYPE_3G = 2,
    NETWORK_TYPE_4G = 3,
    NETWORK_TYPE_5G = 4,
    NETWORK_TYPE_WIFI = 5,
} NETWORK_TYPE;

/*!
 * Get current Device ip address
 */
+ (NSString *)deviceIPAdress;


/*!
 * Get Device connect network address
 */
+ (NSString *)getGatewayIPAddress;


/*!
 * Get DNS IP Addres by hostName
 */
+ (NSArray *)getDNSsWithDormain:(NSString *)hostName;


/*!
 * Get local DNSs address
 */
+ (NSArray *)outPutDNSServers;


/*!
 * Get current network type
 */
+ (NETWORK_TYPE)getNetworkTypeFromStatusBar;

/**
 * IPV6 address format
 */
+(NSString *)formatIPV6Address:(struct in6_addr)ipv6Addr;

@end
