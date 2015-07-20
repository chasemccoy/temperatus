//
//  ViewController.m
//  forecast
//
//  Created by Chase McCoy on 7/14/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

#define API_KEY "47b4c46a2eba602b069144b4b6310e09"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  [self updateForecastData];
  locationTest = [[UserLocation alloc] init];
  [locationTest updateLocation];
  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
}

- (void)updateView {
  cityLabel.text = [locationTest currentCity];
}


// ******************
// Forecast API Docs: https://developer.forecast.io/docs/v2
// ******************
- (void)updateForecastData {
  forecastr = [Forecastr sharedManager];
  forecastr.apiKey = @"47b4c46a2eba602b069144b4b6310e09";
  
  [forecastr getForecastForLatitude:33.4625 longitude:-88.82 time:nil exclusions:nil extend:nil success:^(id JSON) {
    //NSLog(@"JSON Response was: %@", JSON);
    NSLog(@"\n*****%@*****\n", JSON[kFCCurrentlyForecast][kFCTemperature]);
  } failure:^(NSError *error, id response) {
    NSLog(@"Error while retrieving forecast: %@", [forecastr messageForError:error withResponse:response]);
  }];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
