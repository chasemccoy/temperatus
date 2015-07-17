//
//  ViewController.h
//  forecast
//
//  Created by Chase McCoy on 7/14/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserLocation.h"

@interface ViewController : UIViewController <NSURLConnectionDelegate> {
  NSURLConnection *currentConnection;
  UserLocation *locationTest;
  __weak IBOutlet UILabel *cityLabel;
}

@property (retain, nonatomic) NSMutableData *xmlData;
@property (strong, nonatomic) NSDictionary *currently;
@property (strong, nonatomic) NSDictionary *daily;

- (void)updateForecastData;
- (void)updateView;

@end

