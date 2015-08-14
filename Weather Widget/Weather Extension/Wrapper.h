//
//  Wrapper.h
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forecastr.h"
#import "HelperClass.h"
#import "Day.h"
#import "Hour.h"

@interface Wrapper : NSObject

# pragma mark - Properties

@property (strong, nonatomic) NSDictionary *JSON;

@property (strong, nonatomic) NSString *GMTOffset;

// Today
# pragma mark Today
@property (strong, nonatomic) NSString *currentSummary;
@property (strong, nonatomic) NSString *currentTemp;
@property (strong, nonatomic) NSString *currentFeelsLikeTemp;
@property (strong, nonatomic) NSString *todayHighTemp;
@property (strong, nonatomic) NSString *todayLowTemp;
@property (strong, nonatomic) NSString *todayPrecipProbability;
@property (strong, nonatomic) NSString *todayDescriptionForPrecipIntensity;
@property (strong, nonatomic) NSString *todayPrecipType;
@property (strong, nonatomic) NSString *currentDewPoint;
@property (strong, nonatomic) NSString *currentHumidity;

// Hourly
# pragma mark Hourly
@property (strong, nonatomic) NSString *hourlySummary;
@property (strong, nonatomic) NSMutableArray *hourlyForecast;

// Tomorrow
# pragma mark Tomorrow
@property (strong, nonatomic) NSString *tomorrowSummary;
@property (strong, nonatomic) NSString *tomorrowHighTemp;
@property (strong, nonatomic) NSString *tomorrowLowTemp;
@property (strong, nonatomic) NSString *tomorrowPrecipProbability;
@property (strong, nonatomic) NSString *tomorrowDescriptionForPrecipIntensity;
@property (strong, nonatomic) NSString *tomorrowPrecipType;

// This Week
# pragma mark This Week
@property (strong, nonatomic) NSString *weekSummary;
@property (strong, nonatomic) NSMutableArray *weekForecast;

# pragma mark - Methods
- (Wrapper*)wrapData:(NSDictionary*)JSON;
- (void)wrapTodayData;
- (void)wrapHourlyData;
- (void)wrapTomorrowData;
- (void)wrapWeekData;

@end
