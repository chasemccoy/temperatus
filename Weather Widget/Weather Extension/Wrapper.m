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
  self.JSON = JSON;
  self.GMTOffset = self.JSON[kFCOffset];
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
  
  NSDictionary *currently = self.JSON[kFCCurrentlyForecast];
  NSArray *daily = self.JSON[kFCDailyForecast][@"data"];
  NSDictionary *today = daily[0];
  
  NSString *summary = currently[kFCSummary];
  NSString *temp = [HelperClass temperatureStringFromDoubleString:currently[kFCTemperature] andFarenheitSetting:YES];
  NSString *feelsLike = [HelperClass temperatureStringFromDoubleString:currently[kFCApparentTemperature] andFarenheitSetting:YES];
  NSString *highTemp = [HelperClass temperatureStringFromDoubleString:today[kFCTemperatureMax] andFarenheitSetting:YES];
  NSString *lowTemp = [HelperClass temperatureStringFromDoubleString:today[kFCTemperatureMin] andFarenheitSetting:YES];
  
  NSNumber *precipProbabilityNumeric = currently[kFCPrecipProbability];
  double precipProbablilityVal = [precipProbabilityNumeric doubleValue] * 100;
  NSString *precipProbability = [HelperClass percentageStringFromDoubleString:[NSString stringWithFormat:@"%f", precipProbablilityVal]];
  
  NSString *precipIntensity = [HelperClass descriptionForPrecipIntensity:currently[kFCPrecipIntensity]];
  NSString *precipType = currently[kFCPrecipType];
  
  NSNumber *humidityNumeric = currently[kFCHumidity];
  NSNumber *dewPointNumeric = currently[kFCDewPoint];
  double humidityVal = [humidityNumeric doubleValue] * 100;
  NSString *humidity = [HelperClass percentageStringFromDoubleString:[NSString stringWithFormat:@"%f", humidityVal]];
  NSString *dewPoint = [HelperClass temperatureStringFromDoubleString:[dewPointNumeric stringValue] andFarenheitSetting:YES];
  
  self.currentSummary = summary ? summary : notAvailableText;
  self.currentTemp = temp ? temp : notAvailableText;
  self.currentFeelsLikeTemp = feelsLike ? feelsLike : notAvailableText;
  self.todayHighTemp = highTemp ? highTemp : notAvailableText;
  self.todayLowTemp = lowTemp ? lowTemp : notAvailableText;
  self.todayPrecipProbability = precipProbability ? precipProbability : notAvailableText;
  self.todayDescriptionForPrecipIntensity = precipIntensity ? precipIntensity : notAvailableText;
  self.todayPrecipType = precipType ? precipType : notAvailableText;
  self.currentHumidity = humidity ? humidity : notAvailableText;
  self.currentDewPoint = dewPoint ? dewPoint : notAvailableText;
}

#pragma mark - Wrap Hourly Data

/*!
 @brief Sets the properties for the weather data representing the next 7 hours.
 
 @author Chase
 */
- (void)wrapHourlyData {
  NSLog(@"\n******WRAPPING HOURLY DATA******\n");
  
  NSArray *hourly = self.JSON[kFCHourlyForecast][@"data"];
  
  NSString *summary = self.JSON[kFCHourlyForecast][kFCSummary];
  self.hourlySummary = summary ? summary : notAvailableText;
  
  for (int x = 6; x < 11; x++) {
    NSDictionary *hour = hourly[x];
    
    NSString *date = hour[kFCTime] ? hour[kFCTime] : notAvailableText;
    NSString *temp = hour[kFCTemperature] ? hour[kFCTemperature] : notAvailableText;
    NSString *feelsLikeTemp = hour[kFCApparentTemperature] ? hour[kFCApparentTemperature] : notAvailableText;
    
    NSNumber *precipProbabilityNumeric = hour[kFCPrecipProbability];
    double precipProbablilityVal = [precipProbabilityNumeric doubleValue] * 100;
    NSString *precipProbability = [HelperClass percentageStringFromDoubleString:[NSString stringWithFormat:@"%f", precipProbablilityVal]];
    
    NSString *precipIntensity = hour[kFCPrecipIntensity] ? hour[kFCPrecipIntensity] : notAvailableText;
    NSString *precipType = hour[kFCPrecipType] ? hour[kFCPrecipType] : notAvailableText;
    NSString *dewPoint = hour[kFCDewPoint] ? hour[kFCDewPoint] : notAvailableText;
    NSString *humidity = hour[kFCHumidity] ? hour[kFCHumidity] : notAvailableText;
    NSString *windSpeed = hour[kFCWindSpeed] ? hour[kFCHumidity] : notAvailableText;
    NSString *windBearing = hour[kFCWindBearing] ? hour[kFCWindBearing] : notAvailableText;
    NSString *visibility = hour[kFCVisibility] ? hour[kFCVisibility] : notAvailableText;
    NSString *iconName = hour[kFCIcon] ? [HelperClass imageNameForWeatherIconType:hour[kFCIcon]] : notAvailableText;
    
    if (self.hourlyForecast == nil) {
      self.hourlyForecast = [[NSMutableArray alloc] init];
      
    }
    
    Hour *hourObject = [[Hour alloc] init];
    hourObject = [hourObject initWithDate:date
                              temperature:temp
                            feelsLikeTemp:feelsLikeTemp
                            precipitation:precipProbability
                   intensityPrecepitation:precipIntensity
                        typePrecepitation:precipType
                                 dewPoint:dewPoint
                                 humidity:humidity
                                windSpeed:windSpeed
                              windBearing:windBearing
                               visibility:visibility
                                 iconName:iconName
                                GMTOffset:self.GMTOffset
                         farenheitSetting:YES
                             milesSetting:YES];
    
    if (hourObject) {
      [self.hourlyForecast addObject:hourObject];
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
  
  NSArray *daily = self.JSON[kFCDailyForecast][@"data"];
  
  NSDictionary *tomorrow = daily[1];
  
  NSString *summary = tomorrow[kFCSummary];
  NSString *highTemp = [HelperClass temperatureStringFromDoubleString:tomorrow[kFCTemperatureMax] andFarenheitSetting:YES];
  NSString *lowTemp = [HelperClass temperatureStringFromDoubleString:tomorrow[kFCTemperatureMin] andFarenheitSetting:YES];
  
  NSNumber *precipProbabilityNumeric = tomorrow[kFCPrecipProbability];
  double precipProbablilityVal = [precipProbabilityNumeric doubleValue] * 100;
  NSString *precipProbability = [HelperClass percentageStringFromDoubleString:[NSString stringWithFormat:@"%f", precipProbablilityVal]];
  
  NSString *precipIntensity = [HelperClass descriptionForPrecipIntensity:tomorrow[kFCPrecipIntensity]];
  NSString *precipType = tomorrow[kFCPrecipType];
  
  self.tomorrowSummary = summary ? summary : notAvailableText;
  self.tomorrowHighTemp = highTemp ? highTemp : notAvailableText;
  self.tomorrowLowTemp = lowTemp ? lowTemp : notAvailableText;
  self.tomorrowPrecipProbability = precipProbability ? precipProbability : notAvailableText;
  self.tomorrowDescriptionForPrecipIntensity = precipIntensity ? precipIntensity : notAvailableText;
  self.tomorrowPrecipType = precipType ? precipType : notAvailableText;
}

#pragma mark - Wrap Weekly Data

/*!
 @brief Sets the properties for the weather data representing the next seven days.
 
 @author Chase
 */
- (void)wrapWeekData {
  NSLog(@"\n******WRAPPING WEEKLY DATA******\n");
  
  NSArray *daily = self.JSON[kFCDailyForecast][@"data"];
  
  NSString *summary = self.JSON[kFCDailyForecast][kFCSummary];
  self.weekSummary = summary ? summary : notAvailableText;
  
  for (int x = 1; x < 6; x++) {
    NSDictionary *day = daily[x];
    
    NSString *highTemp = day[kFCTemperatureMax];
    NSString *lowTemp = day[kFCTemperatureMin];
    
    NSNumber *precipProbabilityNumeric = day[kFCPrecipProbability];
    double precipProbablilityVal = [precipProbabilityNumeric doubleValue] * 100;
    NSString *precipProbability = [HelperClass percentageStringFromDoubleString:[NSString stringWithFormat:@"%f", precipProbablilityVal]];
    
    NSString *date = day[kFCTime];
    
    if (self.weekForecast == nil) {
      self.weekForecast = [[NSMutableArray alloc] init];
    }
    
    Day *dayObject = [[Day alloc] init];
    dayObject = [dayObject initWithDate:date
                        HighTemperature:highTemp
                         LowTemperature:lowTemp
                          Precipitation:precipProbability
                              GMTOffset:self.GMTOffset
                       farenheitSetting:TRUE];
    
    if (dayObject) {
      [self.weekForecast addObject:dayObject];
    }
  }
}

@end












