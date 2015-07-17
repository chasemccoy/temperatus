//
//  UserLocation.h
//  forecast
//
//  Created by Chase McCoy on 7/16/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@import AddressBookUI;

@interface UserLocation : UIViewController <CLLocationManagerDelegate> {
  CLLocation *currentLocation;
  CLLocationManager *locationManager;
}

@property (retain, nonatomic) NSString *currentCity;

- (UserLocation *)init;
- (void)updateLocation;
- (void)stopUpdatingLocation;

- (void)locationManager:(CLLocationManager *) manager
     didUpdateLocations:(NSArray *)locations;
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status;


@end
