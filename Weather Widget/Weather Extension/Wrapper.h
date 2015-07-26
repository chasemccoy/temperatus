//
//  Wrapper.h
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forecastr.h"

@interface Wrapper : NSObject

@property (strong, nonatomic) NSDictionary *JSON;

// Today
@property (strong, nonatomic) NSString *currentSummary;
@property (strong, nonatomic) NSString *currentTemp;
@property (strong, nonatomic) NSString *currentFeelsLikeTemp;
@property (strong, nonatomic) NSString *todayHighTemp;
@property (strong, nonatomic) NSString *todayLowTemp;
@property (strong, nonatomic) NSString *todayPrecipProbability;

// Tomorrow
@property (strong, nonatomic) NSString *tomorrowSummary;
@property (strong, nonatomic) NSString *tomorrowHighTemp;
@property (strong, nonatomic) NSString *tomorrowLowTemp;
@property (strong, nonatomic) NSString *tomorrowPrecipProbability;

// This Week
@property (strong, nonatomic) NSString *weekSummary;
@property (strong, nonatomic) NSArray *weekForecast;

- (Wrapper*)wrapData:(NSDictionary*)JSON;
- (void)wrapTodayData;
- (void)wrapHourlyData;
- (void)wrapTomorrowData;
- (void)wrapWeekData;

@end
