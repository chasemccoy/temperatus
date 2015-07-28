//
//  Wrapper.m
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "Wrapper.h"

NSString *const notAvailableText = @"N/A";

@implementation Wrapper

/*!
 @brief Sets the JSON property and calls the methods to set the other properties.
 
 @param  JSON The NSDictionary containing the Forecast data.
 
 @return A Wrapper object.
 
 @author Chase
 */
-(Wrapper*)wrapData:(NSDictionary*)JSON {
  _JSON = JSON;
  _GMTOffset = _JSON[kFCOffset];
  [self wrapTodayData];
  [self wrapHourlyData];
  [self wrapTomorrowData];
  [self wrapWeekData];
  return self;
}


#pragma mark - Wrap Today's Data

/*!
 @brief Sets the properties for the weather data representing the current day.
 
 @author Chase
 */
- (void)wrapTodayData {
  NSLog(@"\n******WRAPPING TODAY'S DATA******\n");
  
  NSDictionary *currently = _JSON[kFCCurrentlyForecast];
  NSArray *daily = _JSON[kFCDailyForecast][@"data"];
  NSDictionary *today = daily[0];
  
  NSString *summary = currently[kFCSummary];
  NSString *temp = [HelperClass temperatureStringFromDoubleString:currently[kFCTemperature] andFarenheitSetting:YES];
  NSString *feelsLike = [HelperClass temperatureStringFromDoubleString:currently[kFCApparentTemperature] andFarenheitSetting:YES];
  NSString *highTemp = [HelperClass temperatureStringFromDoubleString:today[kFCTemperatureMax] andFarenheitSetting:YES];
  NSString *lowTemp = [HelperClass temperatureStringFromDoubleString:today[kFCTemperatureMin] andFarenheitSetting:YES];
  NSString *precipProbability = [HelperClass percentageStringFromDoubleString:currently[kFCPrecipProbability]];
  NSString *precipIntensity = [HelperClass descriptionForPrecipIntensity:currently[kFCPrecipIntensity]];
  NSString *precipType = currently[kFCPrecipType];
  
  _currentSummary = summary ? summary : notAvailableText;
  _currentTemp = temp ? temp : notAvailableText;
  _currentFeelsLikeTemp = feelsLike ? feelsLike : notAvailableText;
  _todayHighTemp = highTemp ? highTemp : notAvailableText;
  _todayLowTemp = lowTemp ? lowTemp : notAvailableText;
  _todayPrecipProbability = precipProbability ? precipProbability : notAvailableText;
  _todayDescriptionForPrecipIntensity = precipIntensity ? precipIntensity : notAvailableText;
  _todayPrecipType = precipType ? precipType : notAvailableText;
}

#pragma mark - Wrap Hourly Data

/*!
 @brief Sets the properties for the weather data representing the next 7 hours.
 
 @author Chase
 */
- (void)wrapHourlyData {
  NSLog(@"\n******WRAPPING HOURLY DATA******\n");
  
  NSArray *hourly = _JSON[kFCHourlyForecast][@"data"];
  
  NSString *summary = _JSON[kFCHourlyForecast][kFCSummary];
  _hourlySummary = summary ? summary : notAvailableText;
  
  for (int x = 6; x < 13; x++) {
    NSDictionary *hour = hourly[x];
    
    NSString *date = hour[kFCTime];
    NSString *temp = hour[kFCTemperature];
    NSString *feelsLikeTemp = hour[kFCApparentTemperature];
    NSString *precipProbability = hour[kFCPrecipProbability];
    NSString *precipIntensity = hour[kFCPrecipIntensity];
    NSString *precipType = hour[kFCPrecipType];
    NSString *dewPoint = hour[kFCDewPoint];
    NSString *humidity = hour[kFCHumidity];
    NSString *windSpeed = hour[kFCWindSpeed];
    NSString *windBearing = hour[kFCWindBearing];
    NSString *visibility = hour[kFCVisibility];
    NSString *iconName = hour[kFCIcon];
    
    if (_hourlyForecast == nil) {
      _hourlyForecast = [[NSMutableArray alloc] init];
    }
    
    Hour *hourObject = [[Hour alloc] init];
    hourObject = [hourObject initWithDate:date temperature:temp feelsLikeTemp:feelsLikeTemp precipitation:precipProbability intensityPrecepitation:precipIntensity typePrecepitation:precipType dewPoint:dewPoint humidity:humidity windSpeed:windSpeed windBearing:windBearing visibility:visibility iconName:iconName GMTOffset:_GMTOffset farenheitSetting:YES milesSetting:YES];
    
    if (hourObject) {
      [_hourlyForecast addObject:hourObject];
    }
  }
}

#pragma mark - Wrap Tomorrow's Data

/*!
 @brief Sets the properties for the weather data representing the next day.
 
 @author Chase
 */
- (void)wrapTomorrowData {
  NSLog(@"\n******WRAPPING TOMORROW'S DATA******\n");
  
  NSArray *daily = _JSON[kFCDailyForecast][@"data"];
  
  NSDictionary *tomorrow = daily[1];
  
  NSString *summary = tomorrow[kFCSummary];
  NSString *highTemp = [HelperClass temperatureStringFromDoubleString:tomorrow[kFCTemperatureMax] andFarenheitSetting:YES];
  NSString *lowTemp = [HelperClass temperatureStringFromDoubleString:tomorrow[kFCTemperatureMin] andFarenheitSetting:YES];
  NSString *precipProbability = [HelperClass percentageStringFromDoubleString:tomorrow[kFCPrecipProbability]];
  NSString *precipIntensity = [HelperClass descriptionForPrecipIntensity:tomorrow[kFCPrecipIntensity]];
  NSString *precipType = tomorrow[kFCPrecipType];
  
  _tomorrowSummary = summary ? summary : notAvailableText;
  _tomorrowHighTemp = highTemp ? highTemp : notAvailableText;
  _tomorrowLowTemp = lowTemp ? lowTemp : notAvailableText;
  _tomorrowPrecipProbability = precipProbability ? precipProbability : notAvailableText;
  _tomorrowDescriptionForPrecipIntensity = precipIntensity ? precipIntensity : notAvailableText;
  _tomorrowPrecipType = precipType ? precipType : notAvailableText;
}

#pragma mark - Wrap Weekly Data

/*!
 @brief Sets the properties for the weather data representing the next seven days.
 
 @author Chase
 */
- (void)wrapWeekData {
  NSLog(@"\n******WRAPPING WEEKLY DATA******\n");
  
  NSArray *daily = _JSON[kFCDailyForecast][@"data"];
  
  NSString *summary = _JSON[kFCDailyForecast][kFCSummary];
  _weekSummary = summary ? summary : notAvailableText;
  
  for (int x = 1; x < 8; x++) {
    NSDictionary *day = daily[x];
    
    NSString *highTemp = day[kFCTemperatureMax];
    NSString *lowTemp = day[kFCTemperatureMin];
    NSString *precipProbability = day[kFCPrecipProbability];
    NSString *date = day[kFCTime];
    
    if (_weekForecast == nil) {
      _weekForecast = [[NSMutableArray alloc] init];
    }
    
    Day *dayObject = [[Day alloc] init];
    dayObject = [dayObject initWithDate:date HighTemperature:highTemp LowTemperature:lowTemp Precipitation:precipProbability GMTOffset:_GMTOffset farenheitSetting:TRUE];
    
    if (dayObject) {
      [_weekForecast addObject:dayObject];
    }
  }
}

@end












