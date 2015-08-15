//
//  TodayViewController.m
//  Weather Extension
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  self.preferredContentSize = CGSizeMake(0, 400);
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"newData" object:nil];
  
  _updateInfo = [[UpdateInfo alloc] init];
  [_updateInfo update];
}




- (void)createView {
  _myWrapper = _updateInfo.dataWrapper;
  
  CGRect viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, 80);
  self.currentTempView = [[COQuarterView alloc] initCurrentTempModuleWithFrame:viewFrame
                                                                andTemperature:self.myWrapper.currentTemp];
  [self.view addSubview:self.currentTempView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 4, 0, self.view.frame.size.width / 4, 80);
  self.humidityView = [[COQuarterView alloc] initHumidityModuleWithFrame:viewFrame
                                                             andHumidity:self.myWrapper.currentHumidity];
  [self.view addSubview:self.humidityView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 4, 80);
  self.dewPointView = [[COQuarterView alloc] initDewPointModuleWithFrame:viewFrame
                                                             andDewPoint:self.myWrapper.currentDewPoint];
  [self.view addSubview:self.dewPointView];
  
  viewFrame = CGRectMake(0, 80, self.view.frame.size.width, 80);
  self.dayView = [[COFullView alloc] initDailyModuleWithFrame:viewFrame
                                            andDailyArray:_myWrapper.weekForecast];
  [self.view addSubview:self.dayView];
  
  viewFrame = CGRectMake(0, 160, self.view.frame.size.width, 80);
  self.hourView = [[COFullView alloc] initHourlyModuleWithFrame:viewFrame
                                                   andHourArray:_myWrapper.hourlyForecast];
  [self.view addSubview:self.hourView];
  
  viewFrame = CGRectMake(0, 240, self.view.frame.size.width, 80);
  self.weeklySummaryView = [[COFullView alloc] initWeeklySummaryModuleWithFrame:viewFrame
                                                               andWeeklySummary:self.myWrapper.weekSummary];
  [self.view addSubview:self.weeklySummaryView];
  
  viewFrame = CGRectMake(0, 320, self.view.frame.size.width / 2, 80);
  self.daySummaryView = [[COHalfView alloc] initDaySummaryModuleWithFrame:viewFrame andDaySummary:self.myWrapper.currentSummary];
  [self.view addSubview:self.daySummaryView];
}




- (void)updateView {
  if (_myWrapper == nil) {
    [self createView];
  }
  else {
    _myWrapper = _updateInfo.dataWrapper;
    
    [self.dayView editInfoWithDayArray:_myWrapper.weekForecast];
    [self.hourView editInfoWithHourArray:_myWrapper.hourlyForecast];
    [self.currentTempView editInfoWithTemperature:self.myWrapper.currentTemp];
    [self.humidityView editInfoWithHumidity:self.myWrapper.currentHumidity];
    [self.dewPointView editInfoWithDewPoint:self.myWrapper.currentDewPoint];
    [self.weeklySummaryView editInfoWithWeeklySummary:self.myWrapper.weekSummary];
    [self.daySummaryView editInfoWithDaySummary:self.myWrapper.currentSummary];
  }
}




- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
  return UIEdgeInsetsZero;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
  
  [self updateView];

  completionHandler(NCUpdateResultNewData);
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
