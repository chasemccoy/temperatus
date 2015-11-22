//
//  HelperClass.h
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forecastr+CLLocation.h"

@interface HelperClass : NSObject

+ (NSDate *)dateFromSecondsString:(NSString *)secondsString
                     andGMTOffset:(NSString *)secondsOffset;
+ (NSString *)integerStringFromDoubleString:(NSString *)doubleString;
+ (NSString *)percentageStringFromDoubleString:(NSString *)doubleString;
+ (NSString *)dayOfWeekStringFromDate:(NSDate *)date;
+ (NSString *)stringVersionOfHourFromDate:(NSDate *)date;
+ (NSString *)descriptionForPrecipIntensity:(NSString *)precipIntensityString;
+ (NSString *)cardinalDirectionFromBearingString:(NSString *)bearingString;
+ (NSString *)temperatureStringFromDoubleString:(NSString *)doubleString
                            andFarenheitSetting:(BOOL)farenheitSetting;
+ (NSString *)speedStringFromDoubleString:(NSString *)doubleString
                          andMilesSetting:(BOOL)milesSetting;
+ (NSString *)imageNameForWeatherIconType:(NSString *)iconDescription;

@end


enum {
  QUARTER_BLANK,
  QUARTER_CURRENT_TEMP,
  QUARTER_HUMIDITY,
  QUARTER_DEW_POINT,
  QUARTER_CURRENT_CONDITION,
  QUARTER_WIND_DIRECTION,
  HALF_START,
  HALF_DAY_SUMMARY,
  HALF_HOUR_SUMMARY,
  HALF_CURRENT_CONDITION_WITH_TEMP,
  FULL_START,
  FULL_HOUR,
  FULL_DAY,
  FULL_WEEKLY_SUMMARY
};