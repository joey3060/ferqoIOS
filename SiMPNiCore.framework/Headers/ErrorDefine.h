//
//  ErrorDefine.h
//  SiMPNiCore
//
//  Created by Jim_Hsu on 2018/7/4.
//  Copyright © 2018年 Jim_Hsu. All rights reserved.
//

#ifndef ErrorDefine_h
#define ErrorDefine_h

typedef enum {
    CONN_ERROR_NONE                             =   0,
    CONN_SERVER_POST_UNKNOWDATA                 =   1001,
    CONN_SERVER_UNKNOWNROLE                     =   1002,
    CONN_SERVER_INVALID_SID                     =   1003,
    CONN_SERVER_NO_VALID_TAT                    =   1004,
    CONN_SERVER_HOST_NOT_EXIST                  =   1005,
    CONN_SERVER_UNKNOWNINFO_ERROR               =   1006,
    CONN_HOST_RENDEZVOUS_SERVER_ERROR           =   2000,
    CONN_HOST_REGISTER_TAT_SERVER_TIMEOUT       =   2001,
    CONN_HOST_REGISTER_TAT_SERVER_FAIL          =   2002,
    CONN_HOST_SESSION_ID_NOT_REGISTERED         =   2003,
    CONN_HOST_SESSION_ID_ALREADY_REGISTERED     =   2004,
    CONN_HOST_TUNNEL_NOT_EXIST                  =   2005,
    CONN_HOST_LOCAL_PORT_ALREADY_USED           =   2006,
    CONN_HOST_LOCAL_PORT_NOT_MAPPED             =   2007,
    CONN_HOST_LOCAL_PORT_NOT_LISTENED           =   2008,
    CONN_HOST_MISSING_CONFIGURATION             =   2009,
    CONN_HOST_NOMEMORY                          =   2010,
    CONN_CLIENT_RENDEZVOUS_SERVER_ERROR         =   3000,
    CONN_CLIENT_CONNECT_HOST_TIMEOUT            =   3001,
    CONN_CLIENT_CONNECT_HOST_FAIL               =   3002,
    CONN_CLIENT_SESSION_ID_NOT_REGISTERED       =   3003,
    CONN_CLIENT_SESSION_ID_ALREADY_REGISTERED   =   3004,
    CONN_CLIENT_TUNNEL_NOT_EXIST                =   3005,
    CONN_CLIENT_LOCAL_PORT_ALREADY_USED         =   3006,
    CONN_CLIENT_LOCAL_PORT_NOT_MAPPED           =   3007,
    CONN_CLIENT_LOCAL_PORT_NOT_LISTENED         =   3008,
    CONN_CLIENT_MISSING_CONFIGURATION           =   3009,
    CONN_CLIENT_NOMEMORY                        =   3010,
}SiMPNiC_CONNECTION_ERROR;

#endif /* ErrorDefine_h */
