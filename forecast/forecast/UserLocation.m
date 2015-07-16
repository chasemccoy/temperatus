//
//  UserLocation.m
//  forecast
//
//  Created by Chase McCoy on 7/16/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import "UserLocation.h"

@implementation UserLocation

- (UserLocation *)init {
  self = [super init];
  return self;
}

- (void)updateLocation {
  locationManager = [[CLLocationManager alloc] init];
  locationManager.delegate = self;
  locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
  [locationManager requestAlwaysAuthorization];
  
  if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
    [locationManager requestAlwaysAuthorization];
  }
}

- (void)locationManager:(CLLocationManager *) manager
     didUpdateLocations:(NSArray *)locations{
  currentLocation = [locations lastObject];
  [self reverseGeocode:currentLocation];
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusNotDetermined) {
    [locationManager requestAlwaysAuthorization];
  }
  else if (status == kCLAuthorizationStatusAuthorizedAlways) {
    [locationManager startUpdatingLocation];
  }
}


- (void)locationManager:(CLLocationManager*)manager
       didFailWithError:(NSError *)error {
  // Display error message as a popup alert
  UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                       message:@"There was an error retrieving your location"
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles: nil];
  [errorAlert show];
  NSLog(@"Error: %@",error.description);
}




// ******************
// Tutorial: http://www.devfright.com/clgeocoder-and-clplacemark-tutorial-how-to-find-location-information/
// ******************
- (void)reverseGeocode:(CLLocation *)location {
  CLGeocoder *geocoder = [[CLGeocoder alloc] init];
  [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
    NSLog(@"Finding address");
    if (error) {
      NSLog(@"Error %@", error.description);
    } else {
      CLPlacemark *placemark = [placemarks lastObject];
      NSLog([NSString stringWithFormat:@"\n%@\n", ABCreateStringWithAddressDictionary(placemark.addressDictionary, NO)]);
    }
  }];
}

@end
