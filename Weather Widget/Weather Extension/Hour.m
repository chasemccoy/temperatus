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
          dewPoint: (double)dewPoint
          humidity: (NSString *)humidityString
         windSpeed: (NSString *)windSpeedString
       windBearing: (NSString *)windBearingString
        visibility: (double)visibility
          iconName: (NSString *)iconNameString
  farenheitSetting: (BOOL)farenheitSetting
      milesSetting: (BOOL)milesSetting {
  
  if (self) {
    self.date = [HelperClass dateFromSecondsString:dateInSecondsString];
    self.temperature = [HelperClass temperatureStringFromDoubleString:tempString
                                                  andFarenheitSetting:farenheitSetting];
    self.feelsLikeTemp = [HelperClass temperatureStringFromDoubleString:feelsLikeTempString
                                                    andFarenheitSetting:farenheitSetting];
    self.precipPercent = [HelperClass percentageStringFromDoubleString:precepitationPercentString];
    self.precipintensity = [HelperClass descriptionForPrecipIntensity:precipitationIntensityString];
    self.precipType = precipitationTypeString;
    self.dewPoint = [NSString stringWithFormat:@"%f", dewPoint];
    self.humidity = [HelperClass percentageStringFromDoubleString:humidityString];
    self.windSpeed = [HelperClass speedStringFromDoubleString:windSpeedString andMilesSetting:milesSetting];
    self.windBearing = [HelperClass cardinalDirectionFromBearingString:windBearingString];
    self.visibility = [NSString stringWithFormat:@"%f", visibility];
    self.iconName = iconNameString;
  }
  return self;
}

@end
