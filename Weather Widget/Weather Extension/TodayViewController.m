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
  
  self.sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.cosmicowl.weather"];
  
  self.preferredContentSize = CGSizeMake(0, 400);
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"newData" object:nil];
  
  _updateInfo = [[UpdateInfo alloc] init];
  [_updateInfo update];
}




- (void)createView {
  CGRect viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, 80);
  self.currentTempView = [[COQuarterView alloc] initCurrentTempModuleWithFrame:viewFrame
                                                                andTemperature:self.myWrapper.currentTemp];
//  [self.view addSubview:self.currentTempView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 4, 0, self.view.frame.size.width / 4, 80);
  self.humidityView = [[COQuarterView alloc] initHumidityModuleWithFrame:viewFrame
                                                             andHumidity:self.myWrapper.currentHumidity];
//  [self.view addSubview:self.humidityView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 4, 80);
  self.dewPointView = [[COQuarterView alloc] initDewPointModuleWithFrame:viewFrame
                                                             andDewPoint:self.myWrapper.currentDewPoint];
//  [self.view addSubview:self.dewPointView];
  
  viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 2, 80);
  self.daySummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame
                                                                andSummary:self.myWrapper.todaySummary];
  
//  viewFrame = CGRectMake(0, 0, self.view.frame.size.width, 80);
//  self.SOFULLMODULE = [[COFullView alloc] initFullModuleWithFrame:viewFrame
//                                                  andArrayOfViews:@[ self.currentTempView,
//                                                                     self.daySummaryView,
//                                                                     self.humidityView,
//                                                                     self.dewPointView]];
//  [self.view addSubview:self.SOFULLMODULE];
  
  viewFrame = CGRectMake(0, 80, self.view.frame.size.width, 80);
  self.dayView = [[COFullView alloc] initDailyModuleWithFrame:viewFrame
                                            andDailyArray:_myWrapper.weekForecast];
//  [self.view addSubview:self.dayView];
  
  viewFrame = CGRectMake(0, 160, self.view.frame.size.width, 80);
  self.hourView = [[COFullView alloc] initHourlyModuleWithFrame:viewFrame
                                                   andHourArray:_myWrapper.hourlyForecast];
//  [self.view addSubview:self.hourView];
  
  viewFrame = CGRectMake(0, 240, self.view.frame.size.width, 80);
  self.weeklySummaryView = [[COFullView alloc] initWeeklySummaryModuleWithFrame:viewFrame
                                                               andWeeklySummary:self.myWrapper.weekSummary];
//  [self.view addSubview:self.weeklySummaryView];
  
//  viewFrame = CGRectMake(0, 320, self.view.frame.size.width / 2, 80);
//  self.daySummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame andSummary:self.myWrapper.todaySummary];
//  [self.view addSubview:self.daySummaryView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 2, 320, self.view.frame.size.width / 2, 80);
  self.hourSummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame andSummary:self.myWrapper.nextHourSummary];
//  [self.view addSubview:self.hourSummaryView];
  
  NSArray *viewArray = @[ self.dayView,             //full
                          self.weeklySummaryView,   //full
                          self.daySummaryView,      //half     /
                          self.currentTempView,     //quarter  /
                          self.hourSummaryView,     //half     //
                          self.humidityView,        //quarter  //
                          self.hourView,            //full
                          self.dewPointView];       //quarter  ///
  
  [self placeViewsFromArray:viewArray];
}




- (void)updateView {
  if (self.myWrapper == nil) {
    self.myWrapper = self.updateInfo.dataWrapper;
    [self createView];
  }
  else {
    self.myWrapper = self.updateInfo.dataWrapper;
    
    [self.dayView editInfoWithDayArray:self.myWrapper.weekForecast];
    [self.hourView editInfoWithHourArray:self.myWrapper.hourlyForecast];
    [self.currentTempView editInfoWithTemperature:self.myWrapper.currentTemp];
    [self.humidityView editInfoWithHumidity:self.myWrapper.currentHumidity];
    [self.dewPointView editInfoWithDewPoint:self.myWrapper.currentDewPoint];
    [self.weeklySummaryView editInfoWithWeeklySummary:self.myWrapper.weekSummary];
    [self.daySummaryView editInfoWithSummary:self.myWrapper.todaySummary];
    [self.hourSummaryView editInfoWithSummary:self.myWrapper.nextHourSummary];
  }
}





/**
 * Takes an array of views and places them in the widget in the correct placement
 *   based on size. Might not be how we use this in the future, but useful for now!
 * @author Nate
 *
 * @param viewArray An array of UIViews to place in the widget.
 */
- (void)placeViewsFromArray:(NSArray *)viewArray {
  NSInteger currentModuleWidth = 0;
  NSInteger currentViewWidth = 0;
  NSInteger yValue = 0;
  UIView *currentView;
  UIView *fullView;
  NSMutableArray *currentViewArray = [[NSMutableArray alloc] init];
  CGRect aRect;
  BOOL doesFit = YES;
  
  // Loop through all the views + 1 more time (in order to not repeat code)
  for (int i = 0; i <= viewArray.count; i++) {
    if (i < viewArray.count) {
      currentView = viewArray[i];  // Set the current view
      
      // Determine the width in terms of 4ths of the screen
      if ([currentView isKindOfClass:[COQuarterView class]]) {
        currentViewWidth = 1;
      }
      else if ([currentView isKindOfClass:[COHalfView class]]) {
        currentViewWidth = 2;
      }
      else if ([currentView isKindOfClass:[COFullView class]]) {
        currentViewWidth = 4;
      }
      doesFit = ((currentModuleWidth + currentViewWidth) <= 4);
      
      // If the current view will fit inside a module with the others, stick it in!
      if (doesFit) {
        // Haha I said stick it in
        [currentViewArray addObject:currentView];
        currentModuleWidth += currentViewWidth;
        // But really stick that view in the module
      }
    }
    
    // If the current module does not fit on the screen add the modules in the
    //   array to a full module and flush the array, then add current module to
    //   the array.
    if (i == viewArray.count || !doesFit) {
      aRect = CGRectMake(0, yValue, self.view.frame.size.width, 80);
      
      if ([currentViewArray[0] isKindOfClass:[COFullView class]]) {
        if (currentViewArray.count > 1) {
          NSLog(@"Something messed the fuck up");
          //descriptive error message is descriptive: http://static.giantbomb.com/uploads/original/17/179016/2570640-5353427362-thumb.gif
        }
        fullView = currentViewArray[0];
        fullView.frame = aRect;
      }
      else {
        fullView = [[COFullView alloc] initFullModuleWithFrame:aRect
                                               andArrayOfViews:currentViewArray];
      }
      
      // Add the new (or old?) FullModule to the widget, clear the current array,
      //   increase the y value, and change the current width of the module to
      //   the value of the current view's width.
      [self.view addSubview:fullView];
      [currentViewArray removeAllObjects];
      [currentViewArray addObject:currentView];
      currentModuleWidth = currentViewWidth;
      yValue += 80;
    }
  }
  
  // Use yValue to set the height of the widget (the number of FullModules * 80)
  self.preferredContentSize = CGSizeMake(0, yValue);
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
