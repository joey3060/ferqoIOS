//
//  BinarySwitchDefine.h
//  smartIOT
//
//  Created by Jim_Hsu on 2017/9/22.
//  Copyright © 2017年 Jim_Hsu. All rights reserved.
//

#ifndef ENUMDefine_h
#define ENUMDefine_h

typedef enum {
    BINARY_SWITCH_OFF             = 0,
    BINARY_SWITCH_ON              = 255,
} BINARY_SWITCH_STATUS;

typedef enum {
    MULTIPLE_SWITCH_OFF             = 0,
    MULTIPLE_SWITCH_ON              = 99,
} MULTIPLE_SWITCH_STATUS;

typedef enum {
    DOORLOCK_UNSECURED              = 0,
    DOORLOCK_SECURED                = 255,
} DOORLOCK_STATUS;

typedef enum {
    MODE_OFF,
    MODE_HEAT,
    MODE_COOLING,
    MODE_AUTO,
    MODE_EMERGENCY_HEAT,
    MODE_RESUME_LAST,
    MODE_FAN_ONLY,
    MODE_FURNACE,
    MODE_DRY,
    MODE_HUMIDIFICATION,
    MODE_AUTO_CHANGE,
    MODE_HENERGY_SAVE,
    MODE_HENERGY_SAVE_COOLING,
    MODE_SPECIAL_HEATING,
} THERMOSTAT_MODE;

typedef enum {
    FANMODE_AUTO_LOW    = 0,
    FANMODE_LOW         = 1,
    FANMODE_HIGH        = 3,
    FANMODE_MEDIUM      = 5,
} THERMOSTAT_FAN_MODE;


#endif /* ENUMDefine_h */
