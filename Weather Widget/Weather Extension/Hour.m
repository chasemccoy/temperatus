//
//  Hour.m
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "Hour.h"

@implementation Hour

- (id)initWithDate:(NSString *)dateInSecondsString
       temperature:(NSString *)tempString
     feelsLikeTemp:(NSString *)feelsLikeTempString
     precipitation:(NSString *)precepitationPercentString
intensityPrecepitation:(NSString *)precipitationIntensityString
 typePrecepitation:(NSString *)precipitationTypeString
          dewPoint:(NSString *)dewPoint
          humidity:(NSString *)humidityString
         windSpeed:(NSString *)windSpeedString
       windBearing:(NSString *)windBearingString
        visibility:(NSString *)visibility
          iconName:(NSString *)iconNameString
         GMTOffset:(NSString *)GMTOffset
  farenheitSetting:(BOOL)farenheitSetting
      milesSetting:(BOOL)milesSetting {
  
  if (self) {
    _date = [HelperClass dateFromSecondsString:dateInSecondsString
                                      andGMTOffset:GMTOffset];
    _temperature = [HelperClass temperatureStringFromDoubleString:tempString
                                                  andFarenheitSetting:farenheitSetting];
    _feelsLikeTemp = [HelperClass temperatureStringFromDoubleString:feelsLikeTempString
                                                    andFarenheitSetting:farenheitSetting];
    _precipPercent = [HelperClass percentageStringFromDoubleString:precepitationPercentString];
    _precipintensity = [HelperClass descriptionForPrecipIntensity:precipitationIntensityString];
    _precipType = precipitationTypeString;
    _dewPoint = dewPoint;
    _humidity = [HelperClass percentageStringFromDoubleString:humidityString];
    _windSpeed = [HelperClass speedStringFromDoubleString:windSpeedString andMilesSetting:milesSetting];
    _windBearing = [HelperClass cardinalDirectionFromBearingString:windBearingString];
    _visibility = dewPoint;
    _iconName = iconNameString;
    _stringVersion = [HelperClass stringVersionOfHourFromDate:_date];
  }
  return self;
}

@end
