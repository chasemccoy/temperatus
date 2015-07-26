//
//  Day.m
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "Day.h"

@implementation Day

- (id)initWithDate: (NSString *)dateInSecondsString
   HighTemperature: (NSString *)highTempString
    LowTemperature: (NSString *)lowTempString
     Precipitation: (NSString *)precipitationString
  farenheitSetting: (BOOL)farenheitSetting {
  
  if (self) {
    self.date = [HelperClass dateFromSecondsString:dateInSecondsString];
    self.highTemp = [HelperClass temperatureStringFromDoubleString:highTempString
                                               andFarenheitSetting:farenheitSetting];
    self.lowTemp = [HelperClass temperatureStringFromDoubleString:lowTempString
                                              andFarenheitSetting:farenheitSetting];
    self.precipPercent = [HelperClass percentageStringFromDoubleString:precipitationString];
    self.dayOfWeek = [HelperClass dayOfWeekStringFromDate:self.date];
  }
  return self;
}

@end
