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
          dewPoint: (NSString *)dewPointString
          humidity: (NSString *)humidityString
         windSpeed: (NSString *)windSpeedString
       windBearing: (NSString *)windBearingString
        visibility: (NSString *)visibilityString
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
    self.dewPoint = dewPointString;
    self.humidity = [HelperClass percentageStringFromDoubleString:humidityString];
    self.windSpeed = [HelperClass speedStringFromDoubleString:windBearingString
                                              andMilesSetting:milesSetting];
    self.visibility = visibilityString;
    self.iconName = iconNameString;
  }
  return self;
}

@end
