//
//  UpdateInfo.h
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Forecastr+CLLocation.h"
#import "Wrapper.h"
@import CoreLocation;

@interface UpdateInfo : NSObject <CLLocationManagerDelegate> 

@property (strong, nonatomic) Forecastr *forecastr;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (weak, nonatomic) NSDictionary *JSON;
@property (strong, nonatomic) Wrapper *dataWrapper;

- (id)init;
- (void)update;
- (void)getLocation;
- (void)updateForecastData;
- (void)createWrapper:(NSDictionary*)JSON;

@end
