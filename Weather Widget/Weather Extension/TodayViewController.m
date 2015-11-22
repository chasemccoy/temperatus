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
//  [self.sharedDefaults setObject:@[ @[@"dayView"],
//                                    @[@"daySummaryView", @"currentCondition", @"currentTempView"],
//                                    @[@"humidityView", @"windDirectionView", @"hourSummaryView"],
//                                    @[@"weeklySummaryView"],
//                                    @[@"hourView"],
//                                    @[@"currentConditionWithTemp"]]
//                          forKey:@"viewArray"];
  //
  /////////////////////
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"newData" object:nil];
  
  _updateInfo = [[UpdateInfo alloc] init];
  [_updateInfo update];
}





/**
 * Updates the view if instantiated, creates the view otherwise.
 *
 * @author Nate
 */
- (void)updateView {
  if (self.myWrapper == nil) {
    self.myWrapper = self.updateInfo.dataWrapper;
    [self placeViewsFrom2DArray:[self arrayOfViewsFromSettings]];
  }
  else {
    self.myWrapper = self.updateInfo.dataWrapper;
    
    if (self.dayView) {
      [self.dayView editInfoWithDayArray:self.myWrapper.weekForecast];
    }
    if (self.hourView) {
      [self.hourView editInfoWithHourArray:self.myWrapper.hourlyForecast];
    }
    if (self.currentTempView) {
      [self.currentTempView editInfoWithTemperature:self.myWrapper.currentTemp];
    }
    if (self.humidityView) {
      [self.humidityView editInfoWithHumidity:self.myWrapper.currentHumidity];
    }
    if (self.dewPointView) {
      [self.dewPointView editInfoWithDewPoint:self.myWrapper.currentDewPoint];
    }
    if (self.weeklySummaryView) {
      [self.weeklySummaryView editInfoWithWeeklySummary:self.myWrapper.weekSummary];
    }
    if (self.daySummaryView) {
      [self.daySummaryView editInfoWithSummary:self.myWrapper.todaySummary];
    }
    if (self.hourSummaryView) {
      [self.hourSummaryView editInfoWithSummary:self.myWrapper.nextHourSummary];
    }
    if (self.currentConditionView) {
      [self.currentConditionView editInfoWithCurrentConditionIcon:self.myWrapper.currentIcon];
    }
    if (self.windDirectionView) {
      Hour *nextHour = self.myWrapper.hourlyForecast[0];
      [self.windDirectionView editInfoWithWindDirectionIcon:[HelperClass cardinalDirectionFromBearingString:nextHour.windBearing]];
    }
    if (self.currentConditionWithTempView) {
      [self.currentConditionWithTempView editInfoWithImageName:self.myWrapper.currentIcon
                                                   currentTemp:self.myWrapper.currentTemp
                                                      highTemp:self.myWrapper.todayHighTemp
                                                       lowTemp:self.myWrapper.todayLowTemp];
    }
  }
}




/**
 * Takes a 2D array of views and places them in the widget in the correct placement
 *   based on size. Might not be how we use this in the future, but useful for now!
 *
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
 * Creates a 2D array of views from a 2D array of View Enums in NSUserDefaults.
 *
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
    if (tempArray.count == 0) {
      break;
    }
    tempViewArray = [[NSMutableArray alloc] init];  // reallocate rather than remove the objects in the current array so as not
                                                    // to delete everything held in viewArray's arrays (2D remember?)
                                                    // Hasn't been tested yet so please don't nag me too hard if it explodes and burns (I'm talking to future me b.t.dubs)
                                                    // NOTE: I have tested it. It totally works. And yes it is magic. Love me! I am a magician!!!
    
    for (int j = 0; j < tempArray.count; j++) {
      // Pretty much: https://www.dropbox.com/s/u95dihq6qqgo49s/jake%20do%20this%20thing%20with%20magic.gif?dl=0
      [tempViewArray addObject:[self createViewFromEnum:[tempArray[j] longLongValue]]];
    }
    [viewArray addObject:tempViewArray];
  }
  
  return viewArray;
}





/**
 * Creates a UIView from a string description of the view.
 *
 * @author Nate
 *
 * @param string An NSString description of the view to be created.
 * @return A UIView that was created from the string.
 */
- (UIView *)createViewFromEnum:(long)number {
  CGRect viewFrame;
  switch (number) {
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Quarter Blank
    //        A blank quarter cell
    //
    ////////////////////////////////////////////////////////////////////////////
    case QUARTER_BLANK: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
      return [[COQuarterView alloc] initBlankModuleWithFrame:viewFrame];
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Quarter Current Condition
    //        The current condition in an icon
    //
    ////////////////////////////////////////////////////////////////////////////
    case QUARTER_CURRENT_CONDITION: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
      self.currentConditionView = [[COQuarterView alloc] initCurrentConditionModuleWithFrame:viewFrame
                                                                                     andIcon:self.myWrapper.currentIcon];
      return self.currentConditionView;
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Quarter Current Temperature
    //        The current temperature in ºF or ºC
    //
    ////////////////////////////////////////////////////////////////////////////
    case QUARTER_CURRENT_TEMP: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
      self.currentTempView = [[COQuarterView alloc] initCurrentTempModuleWithFrame:viewFrame
                                                                    andTemperature:self.myWrapper.currentTemp];
      return self.currentTempView;
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Quarter Dew Point
    //        The dew point in ºF or ºC
    //
    ////////////////////////////////////////////////////////////////////////////
    case QUARTER_DEW_POINT: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
      self.dewPointView = [[COQuarterView alloc] initDewPointModuleWithFrame:viewFrame
                                                                 andDewPoint:self.myWrapper.currentDewPoint];
      return self.dewPointView;
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Quarter Humidity
    //        The current humidity in percent
    //
    ////////////////////////////////////////////////////////////////////////////
    case QUARTER_HUMIDITY: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
      self.humidityView = [[COQuarterView alloc] initHumidityModuleWithFrame:viewFrame
                                                                 andHumidity:self.myWrapper.currentHumidity];
      return self.humidityView;
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Quarter Wind Direction
    //        The wind direction displayed with a compass icon
    //
    ////////////////////////////////////////////////////////////////////////////
    case QUARTER_WIND_DIRECTION: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 4, HEIGHT);
      Hour *nextHour = self.myWrapper.hourlyForecast[0];
      self.windDirectionView = [[COQuarterView alloc] initWindDirectionModuleWithFrame:viewFrame
                                                                               andIcon:[HelperClass cardinalDirectionFromBearingString:nextHour.windBearing]];
      return self.windDirectionView;
    }
      
    
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Half Current Condition with Temperature
    //        The current condition icon with the current, high, and low
    //        temperatures in ºF or ºC
    //
    ////////////////////////////////////////////////////////////////////////////
    case HALF_CURRENT_CONDITION_WITH_TEMP: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 2, HEIGHT);
      self.currentConditionWithTempView = [[COHalfView alloc] initCurrentConditionImageWithTemperaturesModuleWithFrame:viewFrame
                                                                                                             imageName:self.myWrapper.currentIcon
                                                                                                           currentTemp:self.myWrapper.currentTemp
                                                                                                              highTemp:self.myWrapper.todayHighTemp
                                                                                                               lowTemp:self.myWrapper.todayLowTemp];
      return self.currentConditionWithTempView;
    }
      
    
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Half Day Summary
    //        The day's weather summary in text form
    //
    ////////////////////////////////////////////////////////////////////////////
    case HALF_DAY_SUMMARY: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 2, HEIGHT);
      self.daySummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame
                                                                    andSummary:self.myWrapper.todaySummary];
      return self.daySummaryView;
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Half Hour Summary
    //        The hour's weather summary in text form
    //
    ////////////////////////////////////////////////////////////////////////////
    case HALF_HOUR_SUMMARY: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width / 2, HEIGHT);
      self.hourSummaryView = [[COHalfView alloc] initHalfSummaryModuleWithFrame:viewFrame
                                                                     andSummary:self.myWrapper.nextHourSummary];
      return self.hourSummaryView;
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Full Day
    //        The next 5 days in an array format. Contains the high, low, and
    //        percent chance of rain
    //
    ////////////////////////////////////////////////////////////////////////////
    case FULL_DAY: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width, HEIGHT);
      self.dayView = [[COFullView alloc] initDailyModuleWithFrame:viewFrame
                                                    andDailyArray:_myWrapper.weekForecast];
      return self.dayView;
    }
      
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Full Hour
    //        The next 5 hours in an array format. Contains the high, low, and
    //        percent chance of rain
    //
    ////////////////////////////////////////////////////////////////////////////
    case FULL_HOUR: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width, HEIGHT);
      self.hourView = [[COFullView alloc] initHourlyModuleWithFrame:viewFrame
                                                       andHourArray:_myWrapper.hourlyForecast];
      return self.hourView;
    }
      
    ////////////////////////////////////////////////////////////////////////////
    //
    //      Full Weekly Summary
    //        The next 7 day's weather summary in text format
    //
    ////////////////////////////////////////////////////////////////////////////
    case FULL_WEEKLY_SUMMARY: {
      viewFrame = CGRectMake(0, 0, self.view.frame.size.width, HEIGHT);
      self.weeklySummaryView = [[COFullView alloc] initWeeklySummaryModuleWithFrame:viewFrame
                                                                   andWeeklySummary:self.myWrapper.weekSummary];
      return self.weeklySummaryView;
    }
      
      
    default:
      break;
  }
  
  // if you get here then you're pretty much screwed
  // FLAWED LOGIC BRO
  return [[UIView alloc] init];
  
  /*            Pikachu wants you to enjoy your day!
  
   
         ix.                            _.;
          xxx.                       ,,xx"
           "xxxb,                  .;xxxx'
            "xxxxx,              ,;xxxxx'
             "x    ',--""""""-_,;    xx'
               :   '          ."     /       _-----------------------_
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
