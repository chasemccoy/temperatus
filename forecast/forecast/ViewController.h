//
//  ViewController.h
//  forecast
//
//  Created by Chase McCoy on 7/14/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserLocation.h"
#import "Forecastr.h"

@interface ViewController : UIViewController {
  UserLocation *locationTest;
  __weak IBOutlet UILabel *cityLabel;
  Forecastr *forecastr;
}

- (void)updateForecastData;
- (void)updateView;

@end

