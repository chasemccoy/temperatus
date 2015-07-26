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

#pragma mark - Wrap Tomorrow's Data

- (void)wrapTomorrowData {
  NSLog(@"\n******WRAPPING TOMORROW'S DATA******\n");
}

#pragma mark - Wrap Weekly Data

- (void)wrapWeekData {
  NSLog(@"\n******WRAPPING WEEKLY DATA******\n");
}

@end
