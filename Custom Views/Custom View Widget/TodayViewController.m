//
//  TodayViewController.m
//  Custom View Widget
//
//  Created by Chase McCoy on 8/2/15.
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
  
  self.preferredContentSize = CGSizeMake(0, 300);
  
  self.tempView = [[currentTempView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 4, 100)];
  self.tempView.clipsToBounds = YES;
  [self.tempView setBackgroundColor:[UIColor clearColor]];
  [self.view addSubview:self.tempView];
  
  self.highLow = [[highLowTempView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 4) * 2, 0, self.view.frame.size.width / 4, 100)];
  self.highLow.clipsToBounds = YES;
  [self.highLow setBackgroundColor:[UIColor clearColor]];
  [self.view addSubview:self.highLow];
  
  CGRect viewFrame = CGRectMake(self.view.frame.size.width / 4, 0, self.view.frame.size.width / 4, 100);
  self.myCustomView = [[myView alloc] initWithFrame:viewFrame];
  self.myCustomView.clipsToBounds = YES;
  [self.view addSubview:self.myCustomView];
  
  self.customView3 = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 4) * 3, 0, self.view.frame.size.width / 4, 100)];
  self.customView3.backgroundColor = [UIColor orangeColor];
  [self.view addSubview:self.customView3];
  
//  self.customView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
//  self.customView4.backgroundColor = [UIColor purpleColor];
//  [self.view addSubview:self.customView4];
  
  viewFrame = CGRectMake(0, 100, self.view.frame.size.width, 100);
  self.fiveDayView = [[FiveModuleView alloc] initWithFrame:viewFrame
                                            dayStringArray:@[ @"Sat", @"Sun", @"Mon", @"Tue", @"Wed"]
                                           highStringArray:@[ @"99°", @"103°", @"1°", @"87°", @"145°"]
                                            lowStringArray:@[ @"67°", @"89°", @"86°", @"54°", @"2°"]
                                         precipStringArray:@[ @"90%", @"52%", @"0%", @"11%", @"45%"]];
  [self.view addSubview:self.fiveDayView];
  
  viewFrame = CGRectMake(0, 200, self.view.frame.size.width, 100);
  NSDateFormatter *df = [[NSDateFormatter alloc] init];
  [df setDateFormat:@"ha"];
  NSDate *date = [NSDate date];
  NSArray *hourStringArray = @[ [df stringFromDate:[date dateByAddingTimeInterval:3600]],
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 2]],
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 3]],
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 4]],
                                [df stringFromDate:[date dateByAddingTimeInterval:3600 * 5]],
                                ];
  self.fiveHourView = [[FiveModuleView alloc] initWithFrame:viewFrame
                                            hourStringArray:hourStringArray
                                            tempStringArray:@[ @"99°", @"103°", @"1°", @"87°", @"145°"]
                                          precipStringArray:@[ @"90%", @"52%", @"0%", @"11%", @"45%"]];
  [self.view addSubview:self.fiveHourView];
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
