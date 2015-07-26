//
//  Day.h
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperClass.h"

@interface Day : NSObject

- (id)initWithDate: (NSString *)dateInSecondsString
   HighTemperature: (NSString *)highTempString
    LowTemperature: (NSString *)lowTempString
     Precepitation: (NSString *)precepitationString
  farenheitSetting: (BOOL)farenheitSetting;

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *highTemp;
@property (strong, nonatomic) NSString *lowTemp;
@property (strong, nonatomic) NSString *precipPercent;
@property (strong, nonatomic) NSString *dayOfWeek;

@end
