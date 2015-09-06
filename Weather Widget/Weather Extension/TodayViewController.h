//
//  TodayViewController.h
//  Weather Extension
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateInfo.h"
#import "COFullView.h"
#import "COHalfView.h"
#import "COQuarterView.h"

@interface TodayViewController : UIViewController

@property (strong, nonatomic) NSUserDefaults *sharedDefaults;

@property (strong, nonatomic) UpdateInfo *updateInfo;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) COFullView *hourView;
@property (strong, nonatomic) COFullView *dayView;
@property (strong, nonatomic) COFullView *weeklySummaryView;
@property (strong, nonatomic) COHalfView *daySummaryView;
@property (strong, nonatomic) COHalfView *hourSummaryView;
@property (strong, nonatomic) COQuarterView *currentTempView;
@property (strong, nonatomic) COQuarterView *humidityView;
@property (strong, nonatomic) COQuarterView *dewPointView;
@property (strong, nonatomic) COFullView *SOFULLMODULE;
@property (strong, nonatomic) Wrapper *myWrapper;

- (void)createView;
- (void)updateView;
- (void)placeViewsFromArray:(NSArray *)viewArray;

@end
