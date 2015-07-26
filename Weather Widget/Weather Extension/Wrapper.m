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
 
 @author Chase McCoy
 */
-(Wrapper*)wrapData:(NSDictionary*)JSON {
  _JSON = JSON;
  [self wrapTodayData];
  [self wrapTomorrowData];
  [self wrapWeekData];
  return self;
}


#pragma mark - Wrap Today's Data

- (void)wrapTodayData {
  NSLog(@"\n******WRAPPING TODAY'S DATA******\n");
  
  NSDictionary *currently = _JSON[kFCCurrentlyForecast];
  
  NSString *summary = currently[kFCSummary];
  NSString *temp = [HelperClass temperatureStringFromDoubleString:currently[kFCTemperature] andFarenheitSetting:YES];
  NSString *feelsLike         = [HelperClass temperatureStringFromDoubleString:currently[kFCApparentTemperature] andFarenheitSetting:YES];
  NSString *highTemp          = [HelperClass temperatureStringFromDoubleString:currently[kFCTemperatureMax] andFarenheitSetting:YES];
  NSString *lowTemp           = [HelperClass temperatureStringFromDoubleString:currently[kFCTemperatureMin] andFarenheitSetting:YES];
  NSString *precipProbability = [HelperClass percentageStringFromDoubleString:currently[kFCPrecipProbability]];
  
  _currentSummary = summary ? summary : notAvailableText;
  _currentTemp = temp ? temp : notAvailableText;
  _currentFeelsLikeTemp = feelsLike ? feelsLike : notAvailableText;
  _todayHighTemp = highTemp ? highTemp : notAvailableText;
  _todayLowTemp = lowTemp ? lowTemp : notAvailableText;
  _todayPrecipProbability = precipProbability ? precipProbability : notAvailableText;
}

#pragma mark - Wrap Hourly Data

- (void)wrapHourlyData {
  
}

#pragma mark - Wrap Tomorrow's Data

- (void)wrapTomorrowData {
  NSLog(@"\n******WRAPPING TOMORROW'S DATA******\n");
  
  NSArray *daily = _JSON[kFCDailyForecast][@"data"];
  
  NSDictionary *tomorrow = daily[1];
  
  NSString *summary           = tomorrow[kFCSummary];
  NSString *highTemp = [HelperClass temperatureStringFromDoubleString:tomorrow[kFCTemperatureMax] andFarenheitSetting:YES];
  NSString *lowTemp = [HelperClass temperatureStringFromDoubleString:tomorrow[kFCTemperatureMin] andFarenheitSetting:YES];
  NSString *precipProbability = [HelperClass percentageStringFromDoubleString:tomorrow[kFCPrecipProbability]];
  
  _tomorrowSummary = summary ? summary : notAvailableText;
  _tomorrowHighTemp = highTemp ? highTemp : notAvailableText;
  _tomorrowLowTemp = lowTemp ? lowTemp : notAvailableText;
  _tomorrowPrecipProbability = precipProbability ? precipProbability : notAvailableText;
}

#pragma mark - Wrap Weekly Data

- (void)wrapWeekData {
  NSLog(@"\n******WRAPPING WEEKLY DATA******\n");
  
  NSArray *daily = _JSON[kFCDailyForecast][@"data"];
  
  for (int x = 1; x < 8; x++) {
    NSDictionary *day = daily[x];
    //DayClass *dayObject = [[DayClass alloc] init];
    
    NSString *summary = day[kFCSummary];
    NSString *highTemp = day[kFCTemperatureMax];
    NSString *lowTemp = day[kFCTemperatureMin];
    NSString *precipProbability = day[kFCPrecipProbability];
    NSString *date = day[kFCTime];
    
    _weekSummary = summary ? summary : notAvailableText;
    
    Day *dayObject;
    dayObject = [dayObject initWithDate:date HighTemperature:highTemp LowTemperature:lowTemp Precipitation:precipProbability farenheitSetting:TRUE];
    
    [_weekForecast addObject:dayObject];
  }
}

@end












