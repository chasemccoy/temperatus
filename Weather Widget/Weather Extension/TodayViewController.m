//
//  TodayViewController.m
//  Weather Extension
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#define HEIGHT (70)

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  self.sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.cosmicowl.weather"];
  
  //////////////////////
  // FOR TESTING PURPOSES ONLY
  //
  [self.sharedDefaults setObject:@[ @[@"dayView"],
                                    @[@"daySummaryView", @"currentTempView"],
                                    @[@"humidityView", @"dewPointView", @"hourSummaryView"],
                                    @[@"weeklySummaryView"],
                                    @[@"hourView"] ]
                          forKey:@"viewArray"];
  //
  /////////////////////
  
  self.preferredContentSize = CGSizeMake(0, 400);
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"newData" object:nil];
  
  _updateInfo = [[UpdateInfo alloc] init];
  [_updateInfo update];
}




- (void)createView {
  CGRect viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
  self.currentTempView = [[COQuarterView alloc] initCurrentTempModuleWithFrame:viewFrame
                                                                andTemperature:self.myWrapper.currentTemp];
//  [self.view addSubview:self.currentTempView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 4, 0, self.view.frame.size.width / 4, HEIGHT);
  self.humidityView = [[COQuarterView alloc] initHumidityModuleWithFrame:viewFrame
                                                             andHumidity:self.myWrapper.currentHumidity];
//  [self.view addSubview:self.humidityView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 4, HEIGHT);
  self.dewPointView = [[COQuarterView alloc] initDewPointModuleWithFrame:viewFrame
                                                             andDewPoint:self.myWrapper.currentDewPoint];
//  [self.view addSubview:self.dewPointView];
  
  viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 2, HEIGHT);
  self.daySummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame
                                                                andSummary:self.myWrapper.todaySummary];
  
//  viewFrame = CGRectMake(0, 0, self.view.frame.size.width, HEIGHT);
//  self.SOFULLMODULE = [[COFullView alloc] initFullModuleWithFrame:viewFrame
//                                                  andArrayOfViews:@[ self.currentTempView,
//                                                                     self.daySummaryView,
//                                                                     self.humidityView,
//                                                                     self.dewPointView]];
//  [self.view addSubview:self.SOFULLMODULE];
  
  viewFrame = CGRectMake(0, 80, self.view.frame.size.width, HEIGHT);
  self.dayView = [[COFullView alloc] initDailyModuleWithFrame:viewFrame
                                            andDailyArray:_myWrapper.weekForecast];
//  [self.view addSubview:self.dayView];
  
  viewFrame = CGRectMake(0, 160, self.view.frame.size.width, HEIGHT);
  self.hourView = [[COFullView alloc] initHourlyModuleWithFrame:viewFrame
                                                   andHourArray:_myWrapper.hourlyForecast];
//  [self.view addSubview:self.hourView];
  
  viewFrame = CGRectMake(0, 240, self.view.frame.size.width, HEIGHT);
  self.weeklySummaryView = [[COFullView alloc] initWeeklySummaryModuleWithFrame:viewFrame
                                                               andWeeklySummary:self.myWrapper.weekSummary];
//  [self.view addSubview:self.weeklySummaryView];
  
//  viewFrame = CGRectMake(0, 320, self.view.frame.size.width / 2, HEIGHT);
//  self.daySummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame andSummary:self.myWrapper.todaySummary];
//  [self.view addSubview:self.daySummaryView];
  
  viewFrame = CGRectMake(self.view.frame.size.width / 2, 320, self.view.frame.size.width / 2, HEIGHT);
  self.hourSummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame andSummary:self.myWrapper.nextHourSummary];
//  [self.view addSubview:self.hourSummaryView];
  
//  NSArray *viewArray = @[ self.dayView,             //full
//                          self.weeklySummaryView,   //full
//                          self.daySummaryView,      //half     /
//                          self.currentTempView,     //quarter  /
//                          self.hourSummaryView,     //half     //
//                          self.humidityView,        //quarter  //
//                          self.hourView,            //full
//                          self.dewPointView];       //quarter  ///

  NSArray *viewArray = @[ @[self.dayView],
                          @[self.daySummaryView, self.currentTempView],
                          @[self.humidityView, self.dewPointView, self.hourSummaryView],
                          @[self.weeklySummaryView],
                          @[self.hourView]];
  
  [self placeViewsFrom2DArray:viewArray];
}





- (void)updateView {
  if (self.myWrapper == nil) {
    self.myWrapper = self.updateInfo.dataWrapper;
    [self placeViewsFrom2DArray:[self arrayOfViewsFromSettings]];
//    [self createView];
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
 * Takes a 2D array of views and places them in the widget in the correct placement
 *   based on size. Might not be how we use this in the future, but useful for now!
 * @author Nate
 *
 * @param viewArray An array of UIViews to place in the widget.
 */
- (void)placeViewsFrom2DArray:(NSArray *)viewArray {
  UIView *fullView;
  NSInteger yValue = 0;
  CGRect aRect;
  NSArray *currentViewArray;
  
  for (int i = 0; i < viewArray.count; i++) {
    aRect = CGRectMake(0, yValue, self.view.frame.size.width, HEIGHT);
    currentViewArray = viewArray[i];
    // If the view is a FullModule (such as the hourly and daily modules) don't
    //   place it inside another FullModule, because that's a bit redundant
    if (currentViewArray.count == 1 && [currentViewArray[0] isKindOfClass:[COFullView class]]) {
      fullView = currentViewArray[0];
      fullView.frame = aRect;
    }
    // Otherwise throw them into a FullModule!
    else {
      fullView = [[COFullView alloc] initFullModuleWithFrame:aRect andArrayOfViews:currentViewArray];
    }
    
    // Add the view and increase the value of y
    [self.view addSubview:fullView];
    yValue += HEIGHT;
  }
  
  // Set the size of the widget
  self.preferredContentSize = CGSizeMake(0, yValue);
}






/**
 * Creates a 2D array of views held in NSUserDefaults
 * @author Nate
 *
 * @return NSArray of NSArrays of UIViews.
 */
- (NSArray *)arrayOfViewsFromSettings {
  NSArray *toBeConvertedArray = [self.sharedDefaults objectForKey:@"viewArray"];
  NSArray *tempArray;
  NSMutableArray *tempViewArray = [[NSMutableArray alloc] init];
  NSMutableArray *viewArray = [[NSMutableArray alloc] init];
  
  for (int i = 0; i < toBeConvertedArray.count; i++) {
    tempArray = toBeConvertedArray[i];
    tempViewArray = [[NSMutableArray alloc] init];  // reallocate rather than remove the objects in the current array so as not
                                                    // to delete everything held in viewArray's arrays (2D remember?)
                                                    // Hasn't been tested yet so please don't nag me too hard if it explodes and burns (I'm talking to future me b.t.dubs)
    
    for (int j = 0; j < tempArray.count; j++) {
      // Pretty much: https://www.dropbox.com/s/u95dihq6qqgo49s/jake%20do%20this%20thing%20with%20magic.gif?dl=0
      [tempViewArray addObject:[self createViewFromString:tempArray[j]]];
    }
    [viewArray addObject:tempViewArray];
  }
  
  return viewArray;
}





/**
 * Creates a UIView from a string delimiter.
 * @author Nate
 *
 * @param string An NSString.             I'm tired okay? I'll finish these later.
 * @return A UIView.
 */
- (UIView *)createViewFromString:(NSString *)string {
  CGRect viewFrame;
  if ([string isEqualToString:@"hourView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width, HEIGHT);
    self.hourView = [[COFullView alloc] initHourlyModuleWithFrame:viewFrame
                                                     andHourArray:_myWrapper.hourlyForecast];
    return self.hourView;
  }
  else if ([string isEqualToString:@"dayView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width, HEIGHT);
    self.dayView = [[COFullView alloc] initDailyModuleWithFrame:viewFrame
                                                  andDailyArray:_myWrapper.weekForecast];
    return self.dayView;
  }
  else if ([string isEqualToString:@"weeklySummaryView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width, HEIGHT);
    self.weeklySummaryView = [[COFullView alloc] initWeeklySummaryModuleWithFrame:viewFrame
                                                                 andWeeklySummary:self.myWrapper.weekSummary];
    return self.weeklySummaryView;
  }
  else if ([string isEqualToString:@"daySummaryView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 2, HEIGHT);
    self.daySummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame
                                                   andSummary:self.myWrapper.todaySummary];
    return self.daySummaryView;
  }
  else if ([string isEqualToString:@"hourSummaryView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 2, HEIGHT);
    self.hourSummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame
                                                                   andSummary:self.myWrapper.nextHourSummary];
    return self.hourSummaryView;
  }
  else if ([string isEqualToString:@"currentTempView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
    self.currentTempView = [[COQuarterView alloc] initCurrentTempModuleWithFrame:viewFrame
                                                                  andTemperature:self.myWrapper.currentTemp];
    return self.currentTempView;
  }
  else if ([string isEqualToString:@"humidityView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
    self.humidityView = [[COQuarterView alloc] initHumidityModuleWithFrame:viewFrame
                                                               andHumidity:self.myWrapper.currentHumidity];
    return self.humidityView;
  }
  else if ([string isEqualToString:@"dewPointView"]) {
    viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
    self.dewPointView = [[COQuarterView alloc] initDewPointModuleWithFrame:viewFrame
                                                               andDewPoint:self.myWrapper.currentDewPoint];
    return self.dewPointView;
  }
  
  // if you get here then you're pretty much screwed
  // FLAWED LOGIC BRO
  NSLog(@"Something messed the fuck up");
  //descriptive error message is descriptive: http://static.giantbomb.com/uploads/original/17/179016/2570640-5353427362-thumb.gif
  return [[UIView alloc] init];
  
  /*            Pikachu wants you to enjoy your day!
  
   
         ix.                            _.;
          xxx.                       ,,xx"
           "xxxb,                  .;xxxx'
            "xxxxx,              ,;xxxxx'
             "x    ',--""""""-_,;    xx'
               :   '          ."             _-----------------------_
                i'                ,^'      ,'       PIKA!!!           ',
               :                   ;       |      PICKACHU!!!          |
               |                   |        '-._____________________.-'
               |  .-.       .--,   |        /
               | '  '      '    '  |      /
                --      -      --  {
               |  |   (_^__J  |  | ;
               '--'    '--'   '--',,
                '-..___________..-'
   
   
   */
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
