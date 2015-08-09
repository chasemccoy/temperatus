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
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"newData" object:nil];
  
  _updateInfo = [[UpdateInfo alloc] init];
  [_updateInfo update];
  
  self.preferredContentSize = CGSizeMake(0, 200);
  
  CGRect viewFrame = CGRectMake(0, 0, self.view.frame.size.width, 100);
  UIView *fiveDayView = [[COFullView alloc] initDaylyModuleWithFrame:viewFrame
                                                      dayStringArray:@[ @"Sat", @"Sun", @"Mon", @"Tue", @"Wed"]
                                                     highStringArray:@[ @"99°", @"103°", @"1°", @"87°", @"145°"]
                                                      lowStringArray:@[ @"67°", @"89°", @"86°", @"54°", @"2°"]
                                                   precipStringArray:@[ @"90%", @"52%", @"0%", @"11%", @"45%"]];
  [self.view addSubview:fiveDayView];
  
  viewFrame = CGRectMake(0, 100, self.view.frame.size.width, 100);
  NSDateFormatter *df = [[NSDateFormatter alloc] init];
  [df setDateFormat:@"ha"];
  NSDate *date = [NSDate date];
  NSArray *hourStringArray = @[ [df stringFromDate:[date dateByAddingTimeInterval:3600]].lowercaseString,
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 2]].lowercaseString,
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 3]].lowercaseString,
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 4]].lowercaseString,
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 5]].lowercaseString];
  UIView *fiveHourView = [[COFullView alloc] initHourlyModuleWithFrame:viewFrame
                                            hourStringArray:hourStringArray
                                            tempStringArray:@[ @"99°", @"103°", @"1°", @"87°", @"145°"]
                                          precipStringArray:@[ @"90%", @"52%", @"0%", @"11%", @"45%"]];
  [self.view addSubview:fiveHourView];
}

- (void)updateView {
  Wrapper *myWrapper = [[Wrapper alloc] init];
  myWrapper = _updateInfo.dataWrapper;
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
