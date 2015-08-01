//
//  Hour.m
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "Hour.h"

@implementation Hour

- (id)initWithDate: (NSString *)dateInSecondsString
       temperature: (NSString *)tempString
     feelsLikeTemp: (NSString *)feelsLikeTempString
     precipitation: (NSString *)precepitationPercentString
intensityPrecepitation: (NSString *)precipitationIntensityString
 typePrecepitation: (NSString *)precipitationTypeString
          dewPoint: (NSString *)dewPoint
          humidity: (NSString *)humidityString
         windSpeed: (NSString *)windSpeedString
       windBearing: (NSString *)windBearingString
        visibility: (NSString *)visibility
          iconName: (NSString *)iconNameString
         GMTOffset: (NSString *)GMTOffset
  farenheitSetting: (BOOL)farenheitSetting
      milesSetting: (BOOL)milesSetting {
  
  if (self) {
    self.date = [HelperClass dateFromSecondsString:dateInSecondsString
                                      andGMTOffset:GMTOffset];
    self.temperature = [HelperClass temperatureStringFromDoubleString:tempString
                                                  andFarenheitSetting:farenheitSetting];
    self.feelsLikeTemp = [HelperClass temperatureStringFromDoubleString:feelsLikeTempString
                                                    andFarenheitSetting:farenheitSetting];
    self.precipPercent = [HelperClass percentageStringFromDoubleString:precepitationPercentString];
    self.precipintensity = [HelperClass descriptionForPrecipIntensity:precipitationIntensityString];
    self.precipType = precipitationTypeString;
    self.dewPoint = dewPoint;
    self.humidity = [HelperClass percentageStringFromDoubleString:humidityString];
    self.windSpeed = [HelperClass speedStringFromDoubleString:windSpeedString andMilesSetting:milesSetting];
    self.windBearing = [HelperClass cardinalDirectionFromBearingString:windBearingString];
    self.visibility = dewPoint;
    self.iconName = iconNameString;
    self.stringVersion = [HelperClass stringVersionOfHourFromDate:self.date];
  }
  return self;
}

@end
