//
//  Day.m
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "Day.h"

@implementation Day

- (id)initWithDate:(NSString *)dateInSecondsString
   HighTemperature:(NSString *)highTempString
    LowTemperature:(NSString *)lowTempString
     Precipitation:(NSString *)precipitationString
         GMTOffset:(NSString *)GMTOffset
  farenheitSetting:(BOOL)farenheitSetting {
  
  if (self) {
    _date = [HelperClass dateFromSecondsString:dateInSecondsString
                                      andGMTOffset:GMTOffset];
    _highTemp = [HelperClass temperatureStringFromDoubleString:highTempString
                                               andFarenheitSetting:farenheitSetting];
    _lowTemp = [HelperClass temperatureStringFromDoubleString:lowTempString
                                              andFarenheitSetting:farenheitSetting];
    _precipPercent = [HelperClass percentageStringFromDoubleString:precipitationString];
    _dayOfWeek = [HelperClass dayOfWeekStringFromDate:_date];
  }
  return self;
}

@end
