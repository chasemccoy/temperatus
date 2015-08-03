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
  
  self.preferredContentSize = CGSizeMake(0, 200);
  
  self.customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 4, 100)];
  self.customView.backgroundColor = [UIColor greenColor];
  [self.view addSubview:self.customView];
  
//  self.customView2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 4, 0, self.view.frame.size.width / 4, 100)];
//  self.customView2.backgroundColor = [UIColor greenColor];
//  [self.view addSubview:self.customView2];
  
  CGRect viewFrame = CGRectMake(self.view.frame.size.width / 4, 0, self.view.frame.size.width / 4, 100);
  self.myCustomView = [[myView alloc] initWithFrame:viewFrame];
  self.myCustomView.clipsToBounds = YES;
  [self.view addSubview:self.myCustomView];
  
  self.customView3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 2, 100)];
  self.customView3.backgroundColor = [UIColor orangeColor];
  [self.view addSubview:self.customView3];
  
  self.customView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
  self.customView4.backgroundColor = [UIColor purpleColor];
  [self.view addSubview:self.customView4];
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
