//
//  ViewController.m
//  forecast
//
//  Created by Chase McCoy on 7/14/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

#define API_KEY 47b4c46a2eba602b069144b4b6310e09

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  //[self updateForecastData];
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
  NSString *callString = @"https://api.forecast.io/forecast/47b4c46a2eba602b069144b4b6310e09/33.4625,-88.8200";
  NSURL *requestURL = [NSURL URLWithString:callString];
  NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
  if(currentConnection)
  {
    [currentConnection cancel];
    currentConnection = nil;
    self.xmlData = nil;
  }
  currentConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  self.xmlData = [NSMutableData data];
}



// ***************************************
// DELEGATE METHODS FOR NSURLConnection
// Following this tutorial: http://blog.strikeiron.com/bid/63338/Integrate-a-REST-API-into-an-iPhone-App-in-less-than-15-minutes
// ***************************************

- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
  [self.xmlData setLength:0];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
  [self.xmlData appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error {
  NSLog(@"URL Connection Failed!");
  currentConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  currentConnection = nil;
  // Uncomment this to print all raw JSON data:
  // NSString *strData = [[NSString alloc]initWithData:_xmlData encoding:NSUTF8StringEncoding];
  // NSLog(strData);
  
  NSError *error;
  NSMutableDictionary *forecastData = [NSJSONSerialization
                                       JSONObjectWithData:_xmlData
                                       options:NSJSONReadingMutableContainers
                                       error:&error];
  _currently = forecastData[@"currently"];
  _daily = forecastData[@"daily"];
  NSLog(@"\nSummary: %@\nTemperature: %@\n", _currently[@"summary"], _currently[@"temperature"]);
  NSLog(@"\nWeekly Summary: %@\n", _daily[@"summary"]);
}

// ***************************************
// END DELEGATE METHODS
// ***************************************




- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
