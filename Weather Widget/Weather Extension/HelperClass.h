//
//  HelperClass.h
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end
