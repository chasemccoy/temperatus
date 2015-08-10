//
//  COFullView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COFullView.h"

@implementation COFullView

# pragma mark - Daily Module

/**
 * Initializes a daily module (full view) with an instance of the day class.
 * @author Nate
 *
 * @param aRect a CGRect of the frame to make the view with
 * @param dailyArray an NSArray of Day objects to create this view with
 * @return an instance of a COFullView object created by this init
 */
- (instancetype)initDailyModuleWithFrame:(CGRect)aRect
                           andDailyArray:(NSArray *)dailyArray {
  NSLog(@"init daily");
  self = [super initWithFrame:aRect];
  if (self) {
    _views = [[NSMutableArray alloc] init];
    NSInteger width = aRect.size.width / 5;
    CGRect viewFrame;
    UIView *view;
    
    for (int i = 0; i < 5; i++) {
      viewFrame = CGRectMake(width * i, 0, width, aRect.size.height);
      view = [[COFifthView alloc] initDayModuleWithFrame:viewFrame
                                               dayObject:[dailyArray objectAtIndex:i]
                                       withborderOnRight:(i < 4) ? YES : NO];
      view.clipsToBounds = YES;
      [_views addObject:view];
      [self addSubview:view];
    }
    [self addBottomBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.3]];
  }
  return self;
}




/**
 * Initializes a daily module (full view) with an instance of the day class.
 * @author Nate
 *
 * @param aRect a CGRect of the frame to make the view with
 * @param dayStringArray an NSArray of NSStrings of the names of the days
 * @param highStringArray an NSArray of NSStrings of the high temperatures
 * @param lowStringArray an NSArray of NSStrings of the low temperatures
 * @param precipStringArray an NSArray of NSStrings of the precipitation percents
 * @return an instance of a COFullView object created by this init
 */
- (instancetype)initDailyModuleWithFrame:(CGRect)aRect
                          dayStringArray:(NSArray *)dayStringArray
                         highStringArray:(NSArray *)highStringArray
                          lowStringArray:(NSArray *)lowStringArray
                       precipStringArray:(NSArray *)precipStringArray {
  self = [super initWithFrame:aRect];
  if (self) {
    NSInteger width = aRect.size.width / 5;
    CGRect viewFrame;
    UIView *view;
    
    for (int i = 0; i < 5; i++) {
      viewFrame = CGRectMake(width * i, 0, width, aRect.size.height);
      view = [[COFifthView alloc] initDayModuleWithFrame:viewFrame
                                               dayString:[dayStringArray objectAtIndex:i]
                                              highString:[highStringArray objectAtIndex:i]
                                               lowString:[lowStringArray objectAtIndex:i]
                                            precipString:[precipStringArray objectAtIndex:i]
                                       withBorderOnRight:(i < 4) ? YES : NO];
      view.clipsToBounds = YES;
      [self addSubview:view];
    }
    [self addBottomBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
  }
  return self;
}




/**
 * Edits the info in this view with the information in the array of Day objects passed in.
 * @author Nate
 *
 * @param dayArray an NSArray of Day objects used to edit the info in the view
 */
- (void)editInfoWithDayArray:(NSArray *)dayArray {
  for (int i = 0; i < 5; i++) {
    [[_views objectAtIndex:i] editInfoWithDayObject:[dayArray objectAtIndex:i]];
  }
}




# pragma mark - Hourly Module

/**
 * Initializes an hourly module (full view) with an instance of the day class.
 * @author Nate
 *
 * @param aRect a CGRect of the frame to make the view with
 * @param hourlyArray an NSArray of Hour objects to create this view with
 * @return an instance of a COFullView object created by this init
 */
- (instancetype)initHourlyModuleWithFrame:(CGRect)aRect
                             andHourArray:(NSArray *)hourArray {
  NSLog(@"init hourly");
  self = [super initWithFrame:aRect];
  if (self) {
    _views = [[NSMutableArray alloc] init];
    NSInteger width = aRect.size.width / 5;
    CGRect viewFrame;
    UIView *view;
    
    for (int i = 0; i < 5; i++) {
      viewFrame = CGRectMake(width * i, 0, width, aRect.size.height);
      view = [[COFifthView alloc] initHourModuleWithFrame:viewFrame
                                               hourObject:[hourArray objectAtIndex:i]
                                        withborderOnRight:(i < 4) ? YES : NO];
      view.clipsToBounds = YES;
      [_views addObject:view];
      [self addSubview:view];
    }
    [self addBottomBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
  }
  return self;
}




/**
 * Initializes an hourly module (full view) with an instance of the day class.
 * @author Nate
 *
 * @param aRect a CGRect of the frame to make the view with
 * @param hourStringArray an NSArray of NSStrings of the names of the days
 * @param tempStringArray an NSArray of NSStrings of the temperatures
 * @param precipStringArray an NSArray of NSStrings of the precipitation percents
 * @return an instance of a COFullView object created by this init
 */
- (instancetype)initHourlyModuleWithFrame:(CGRect)aRect
                          hourStringArray:(NSArray *)hourStringArray
                          tempStringArray:(NSArray *)tempStringArray
                        precipStringArray:(NSArray *)precipStringArray {
  self = [super initWithFrame:aRect];
  if (self) {
    NSInteger width = aRect.size.width / 5;
    CGRect viewFrame;
    UIView *view;
    
    for (int i = 0; i < 5; i++) {
      viewFrame = CGRectMake(width * i, 0, width, aRect.size.height);
      view = [[COFifthView alloc] initHourModuleWithFrame:viewFrame
                                               hourString:[hourStringArray objectAtIndex:i]
                                               tempString:[tempStringArray objectAtIndex:i]
                                             precipString:[precipStringArray objectAtIndex:i]
                                        withBorderOnRight:(i < 4) ? YES : NO];
      view.clipsToBounds = YES;
      [self addSubview:view];
    }
    [self addBottomBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
  }
  return self;
}




/**
 * Edits the info in this view with the information in the array of Hour objects passed in.
 * @author Nate
 *
 * @param hourArray an NSArray of Hour objects used to edit the info in the view
 */
- (void)editInfoWithHourArray:(NSArray *)hourArray {
  for (int i = 0; i < 5; i++) {
    [[_views objectAtIndex:i] editInfoWithHourObject:[hourArray objectAtIndex:i]];
  }
}

@end
