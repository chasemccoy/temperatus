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
  
  [self setNeedsStatusBarAppearanceUpdate];
  
  forecastr = [Forecastr sharedManager];
  forecastr.apiKey = @"47b4c46a2eba602b069144b4b6310e09";
  [forecastr flushCache];
  forecastr.cacheExpirationInMinutes = 10;
  
  NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
  [notificationCenter addObserver:self selector:@selector(updateForecastData) name:UIApplicationWillEnterForegroundNotification object:nil];
  
  
  [self updateForecastData];
  // locationTest = [[UserLocation alloc] init];
  // [locationTest updateLocation];
  // [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
}

- (void)updateView:(NSDictionary*)JSON {
  NSLog(@"\n*****%@*****\n", JSON[kFCCurrentlyForecast][kFCTemperature]);
  if (JSON[kFCCurrentlyForecast][kFCSummary]) {
    _textView.selectable = YES;
    
    NSString *minutelySummary = JSON[kFCMinutelyForecast][kFCSummary];
    NSString *hourlySummary = JSON[kFCHourlyForecast][kFCSummary];
    NSString *dailySummary = JSON[kFCDailyForecast][kFCSummary];
    
    _textView.text = minutelySummary ? [NSString stringWithFormat:@"%@\n\n", minutelySummary] : @"";
    _textView.text = hourlySummary ? [_textView.text stringByAppendingString:[NSString stringWithFormat:@"%@\n\n", hourlySummary]] : [_textView.text stringByAppendingString:@""];
    _textView.text = dailySummary ? [_textView.text stringByAppendingString:[NSString stringWithFormat:@"%@", dailySummary]] : [_textView.text stringByAppendingString:@""];
    
    [self adjustFontSizeOfTextViewToFitData];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *temperature = [formatter numberFromString:[NSString stringWithFormat:@"%@", JSON[kFCCurrentlyForecast][kFCTemperature]]];
    _tempLabel.text = [NSString stringWithFormat:@"%.0f°", [temperature floatValue]];
    _textView.selectable = NO;
  }
  else {
    _textView.text = @"No Summary";
  }

}


// ******************
// Forecast API Docs: https://developer.forecast.io/docs/v2
// ******************
- (void)updateForecastData {
  [forecastr getForecastForLatitude:33.4625 longitude:-88.82 time:nil exclusions:nil extend:nil success:^(id JSON) {
    //NSLog(@"JSON Response was: %@", JSON);
    [self updateView:JSON];
  } failure:^(NSError *error, id response) {
    NSLog(@"Error while retrieving forecast: %@", [forecastr messageForError:error withResponse:response]);
  }];
}

- (void)adjustFontSizeOfTextViewToFitData {
  CGSize myTextViewSize = [_textView sizeThatFits:CGSizeMake(_textView.frame.size.width, FLT_MAX)];
  if (myTextViewSize.height > _textView.frame.size.height) {
    while (myTextViewSize.height > _textView.frame.size.height)
    {
      _textView.font = [_textView.font fontWithSize:_textView.font.pointSize - 1];
      myTextViewSize = [_textView sizeThatFits:CGSizeMake(_textView.frame.size.width, FLT_MAX)];
    }
  }
  else {
    while (myTextViewSize.height < (_textView.frame.size.height - 100) && _textView.font.pointSize < 45)
    {
      _textView.font = [_textView.font fontWithSize:_textView.font.pointSize + 1];
      myTextViewSize = [_textView sizeThatFits:CGSizeMake(_textView.frame.size.width, FLT_MAX)];
    }

  }
}

- (IBAction)refreshButton:(id)sender {
  [forecastr flushCache];
  [self updateForecastData];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}

@end
