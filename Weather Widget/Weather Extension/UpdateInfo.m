//
//  UpdateInfo.m
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "UpdateInfo.h"

@implementation UpdateInfo

- (id)init {
  self = [super init];
  if (self) {
    _forecastr = [Forecastr sharedManager];
    _forecastr.apiKey = @"47b4c46a2eba602b069144b4b6310e09";
    [_forecastr flushCache];
    _forecastr.cacheExpirationInMinutes = 10;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateForecastData) name:@"locationFound" object:nil];
  }
  return self;
}

- (void)update {
  [self getLocation];
}

- (void)getLocation {
  _locationManager = [[CLLocationManager alloc] init];
  _locationManager.delegate = self;
  _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
  _locationManager.distanceFilter = 500; // meters
  [self.locationManager requestAlwaysAuthorization];
  
  if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
    [self.locationManager requestAlwaysAuthorization];
  }
  else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted
           || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
    [self.locationManager requestAlwaysAuthorization];
  }
  
  [self.locationManager startUpdatingLocation];
}

- (void)updateForecastData {
  [_forecastr getForecastForLocation:_currentLocation time:nil exclusions:nil extend:nil success:^(id JSON) {
    [self createWrapper:JSON];
    _JSON = JSON;
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"newData" object:nil];
  } failure:^(NSError *error, id response) {
    NSLog(@"Error while retrieving forecast: %@", [_forecastr messageForError:error withResponse:response]);
  }];
}

- (void)createWrapper:(NSDictionary*)JSON {
  _dataWrapper = [[Wrapper alloc] init];
  _dataWrapper = [_dataWrapper wrapData:JSON];
}

- (BOOL)isValidLocation:(CLLocation *)location {
  if ([location.timestamp timeIntervalSinceNow] < 15
      && (location.coordinate.latitude > 0.00001
          || location.coordinate.latitude < -0.00001)
      && (location.coordinate.longitude > 0.00001
          || location.coordinate.longitude < -0.00001)) {
        return YES;
      }
  else {
    return NO;
  }
}


# pragma mark - Core Location Delegate Methods

// **************************************************
// ------------------------------
// CORE LOCATION DELEGATE METHODS
// ------------------------------
// **************************************************

- (void)locationManager:(CLLocationManager *) manager
     didUpdateLocations:(NSArray *)locations{
  self.currentLocation = [locations lastObject];
  if ([self isValidLocation:self.currentLocation]) {
    //NSLog(@"\n***%f***\n", self.currentLocation.coordinate.latitude);
    //NSLog(@"\n***%f***\n", self.currentLocation.coordinate.longitude);
    [self updateForecastData];
    //[self.locationManager stopUpdatingLocation];
  }
}

- (void)locationManager:(CLLocationManager*)manager
       didFailWithError:(NSError *)error {
  if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted
      || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noLocation"
                                                        object:nil];
  }
  else {
    NSLog(@"Error: %@",error.description);
  }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusNotDetermined) {
    [self.locationManager requestAlwaysAuthorization];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noLocation"
                                                        object:nil];
  }
  else {
    [self.locationManager startUpdatingLocation];
  }
}


@end
