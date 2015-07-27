//
//  Hour.h
//  Weather Widget
//
//  Created by Nathan Ansel on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperClass.h"

@interface Hour : NSObject

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
      milesSetting: (BOOL)milesSetting;

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *temperature;
@property (strong, nonatomic) NSString *feelsLikeTemp;
@property (strong, nonatomic) NSString *precipPercent;
@property (strong, nonatomic) NSString *precipintensity;
@property (strong, nonatomic) NSString *precipType;
@property (strong, nonatomic) NSString *dewPoint;
@property (strong, nonatomic) NSString *humidity;
@property (strong, nonatomic) NSString *windSpeed;
@property (strong, nonatomic) NSString *windBearing;
@property (strong, nonatomic) NSString *visibility;
@property (strong, nonatomic) NSString *iconName;

@end
