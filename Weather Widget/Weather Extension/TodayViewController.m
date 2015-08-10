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
  
  self.preferredContentSize = CGSizeMake(0, 160);
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"newData" object:nil];
  
  _updateInfo = [[UpdateInfo alloc] init];
  [_updateInfo update];
}




- (void)createView {
  _myWrapper = _updateInfo.dataWrapper;
  
  CGRect viewFrame = CGRectMake(0, 0, self.view.frame.size.width, 80);
  self.dayView = [[COFullView alloc] initDailyModuleWithFrame:viewFrame
                                            andDailyArray:_myWrapper.weekForecast];
  [self.view addSubview:self.dayView];
  
  viewFrame = CGRectMake(0, 80, self.view.frame.size.width, 80);
  self.hourView = [[COFullView alloc] initHourlyModuleWithFrame:viewFrame
                                                   andHourArray:_myWrapper.hourlyForecast];
  [self.view addSubview:self.hourView];
}




- (void)updateView {
  if (_myWrapper == nil) {
    [self createView];
  }
  else {
    _myWrapper = _updateInfo.dataWrapper;
    
    [self.dayView editInfoWithDayArray:_myWrapper.weekForecast];
    [self.hourView editInfoWithHourArray:_myWrapper.hourlyForecast];
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

    completionHandler(NCUpdateResultNewData);
}

@end
