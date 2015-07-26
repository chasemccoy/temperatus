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
  
  NSString *summary           = currently[kFCSummary];
  NSString *temp              = currently[kFCTemperature];
  NSString *feelsLike         = currently[kFCApparentTemperature];
  NSString *highTemp          = currently[kFCTemperatureMax];
  NSString *lowTemp           = currently[kFCTemperatureMin];
  NSString *precipProbability = currently[kFCPrecipProbability];
  
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
  NSString *highTemp          = tomorrow[kFCTemperatureMax];
  NSString *lowTemp           = tomorrow[kFCTemperatureMin];
  NSString *precipProbability = tomorrow[kFCPrecipProbability];
  
  _tomorrowSummary = summary ? summary : notAvailableText;
  _tomorrowHighTemp = highTemp ? highTemp : notAvailableText;
  _tomorrowLowTemp = lowTemp ? lowTemp : notAvailableText;
  _tomorrowPrecipProbability = precipProbability ? precipProbability : notAvailableText;
}

#pragma mark - Wrap Weekly Data

- (void)wrapWeekData {
  NSLog(@"\n******WRAPPING WEEKLY DATA******\n");
  
  NSArray *daily = _JSON[kFCDailyForecast][@"data"];
  
//  NSDictionary *firstDay = daily[1];
//  NSDictionary *secondDay = daily[2];
//  NSDictionary *thirdDay = daily[3];
//  NSDictionary *fourthDay = daily[4];
//  NSDictionary *fifthDay = daily[5];
//  NSDictionary *sixthDay = daily[6];
//  NSDictionary *seventhDay = daily[7];
  
  for (int x = 1; x < 8; x++) {
    NSDictionary *day = daily[x];
    //DayClass *dayObject = [[DayClass alloc] init];
    
    NSString *summary = day[kFCSummary];
    NSString *highTemp = day[kFCTemperatureMax];
    NSString *lowTemp = day[kFCTemperatureMin];
    NSString *precipProbability = day[kFCPrecipProbability];
  }
}

@end












