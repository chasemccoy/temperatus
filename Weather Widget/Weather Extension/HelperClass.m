//
//  HelperClass.m
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "HelperClass.h"

@implementation HelperClass

/**
 * Converts seconds since 1970 to a NSDate object.
 * @author Nate
 *
 * @param secondsString A string value of the seconds from 1970.
 * @return A NSDate object of a date in seconds since 1970.
 */
+ (NSDate *)dateFromSecondsString: (NSString *)secondsString
                     andGMTOffset: (NSString *)hoursOffset {
  if (secondsString && hoursOffset) {
    NSInteger secondsOffset = [hoursOffset integerValue] * 3600;
    NSDate *dateBeforeOffset = [NSDate dateWithTimeIntervalSince1970:[secondsString integerValue]];
    return [dateBeforeOffset dateByAddingTimeInterval:secondsOffset];
  }
  return nil;
}




/**
 * Rounds a double value to an integer value and returns it as a string.
 * @author Nate
 *
 * @param doubleString The string representation of the double to be converted.
 * @return An NSString object of the integer.
 */
+ (NSString *)integerStringFromDoubleString: (NSString *)doubleString {
  double toReturn = [doubleString doubleValue];
  return [NSString stringWithFormat:@"%d",(int) (toReturn + 0.5)];
}




/**
 * Rounds the double value to the nearest integer value and adds a percent sign.
 * @author Nate
 *
 * @param doubleString A string representation of the double to be converted.
 * @return An NSString object of the value as a percent.
 */
+ (NSString *)percentageStringFromDoubleString: (NSString *)doubleString {
  NSString *toReturn = [self integerStringFromDoubleString:doubleString];
  return [toReturn stringByAppendingString:@"%"];
}




/**
 * Returns the 3 letter version of the day of the week of a date.
 * Ex. "Mon", "Tue", "Wed", etc.
 * @author Nate
 *
 * @param date The date to be processed.
 * @return An NSString object of the 3 letter version of the day of the week.
 */
+ (NSString *)dayOfWeekStringFromDate: (NSDate *)date {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"EEE"];
  return [dateFormatter stringFromDate:date];
}




/**
 * Returns a description for the precipitation intensity of the double value passed in.
 * @author Nate
 *
 * @param precipIntensityString A string representation of the double value of the
 *        precipitation intensity.
 * @return An NSString object of the intensity of precipitation, ranging
 *         from "None" to "Heavy".
 */
+ (NSString *)descriptionForPrecipIntensity: (NSString *)precipIntensityString {
  double precipIntensity = [precipIntensityString doubleValue];
  if (precipIntensity < 0.002) { return @"None"; }
  if (precipIntensity < 0.017) { return @"Very light"; }
  if (precipIntensity < 0.1)   { return @"Light"; }
  if (precipIntensity < 0.4)   { return @"Moderate"; }
  return @"Heavy";
}




/**
 * Returns the general cardinal direction from a degrees bearing.
 * Ex. "N", "SW", "NNE"
 * @author Nate
 *
 * @param bearingString A string representation of the direction as a bearing.
 * @return An NSString object of the general cardinal direction.
 */
+ (NSString *)cardinalDirectionFromBearingString: (NSString *)bearingString {
  double bearing = [bearingString doubleValue];
  if (bearing < 11.25)  { return @"N"; }
  if (bearing < 33.75)  { return @"NNE"; }
  if (bearing < 56.25)  { return @"NE"; }
  if (bearing < 78.75)  { return @"NEE"; }
  if (bearing < 101.25) { return @"E"; }
  if (bearing < 123.75) { return @"SEE"; }
  if (bearing < 146.25) { return @"SE"; }
  if (bearing < 168.75) { return @"SSE"; }
  if (bearing < 191.25) { return @"S"; }
  if (bearing < 213.75) { return @"SSW"; }
  if (bearing < 236.25) { return @"SW"; }
  if (bearing < 258.75) { return @"SWW"; }
  if (bearing < 281.25) { return @"W"; }
  if (bearing < 303.75) { return @"NWW"; }
  if (bearing < 326.25) { return @"NW"; }
  if (bearing < 348.75) { return @"NNW"; }
  return @"N";
}




/**
 * Converts a double to the correct temperature and adds a degree sign to the end.
 * @author Nate
 *
 * @param doubleString A string representation of the temperature in farenheit as a double.
 * @param farenheitSetting The setting for displaying farenheit or celsius, YES for farenheit
 * @return An NSString object of the temperature in the correct format.
 */
+ (NSString *)temperatureStringFromDoubleString: (NSString *)doubleString
                            andFarenheitSetting: (BOOL)farenheitSetting {
  if (farenheitSetting) {
    return [[self integerStringFromDoubleString:doubleString] stringByAppendingString:@"°"];
  }
  
  double celsiusTemp = (([doubleString doubleValue] - 32.0) * 5.0) / 9.0;
  doubleString = [NSString stringWithFormat:@"%f", celsiusTemp];
  return [[self integerStringFromDoubleString:doubleString] stringByAppendingString:@"°"];
}




/**
 * Converts a speed in mph to a string representation of that speed in either mph
 * or km/h and adds the correct unit to the end of the string.
 * @author Nate
 *
 * @param doubleString A string representation of the speed as a double.
 * @param milesSetting The setting for displaying miles or kilometers, YES for miles.
 * @return An NSString object of the speed in the correct format.
 */
+ (NSString *)speedStringFromDoubleString: (NSString *)doubleString
                          andMilesSetting: (BOOL)milesSetting {
  if (milesSetting) {
    return [NSString stringWithFormat:@"%.1f mph",[doubleString doubleValue]];
  }
  
  double speed = [doubleString doubleValue] * 1.609344;
  return [NSString stringWithFormat:@"%.1f km/h",speed];
}


@end
