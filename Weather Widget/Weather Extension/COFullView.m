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
    [self addTopBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
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
    [self addTopBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
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
    [self addTopBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
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
    [self addTopBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
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




#pragma mark - Weekly Summary Module

/**
 * Initializes a weekly summary module.
 * @author Chase
 *
 * @param aRect A CGRect of the frame used to initialoze the view.
 * @param summary an NSString of the weekly summary.
 *
 * @return An instance of the COFullView class.
 */
- (instancetype)initWeeklySummaryModuleWithFrame:(CGRect)aRect
                                andWeeklySummary:(NSString*)summary {
  self = [super initWithFrame:aRect];
  if (self) {
    self.textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, aRect.size.width - 10, aRect.size.height - 15)];
    self.originalFrame = self.textView1.frame;
    self.textView1.textContainerInset = UIEdgeInsetsZero;
    [self.textView1 setBackgroundColor:[UIColor clearColor]];
    self.textView1.editable = NO;
    self.textView1.selectable = NO;
    self.textView1.scrollEnabled = NO;
    self.textView1.text = summary;
    self.textView1.textAlignment = NSTextAlignmentCenter;
    [self.textView1 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    [self.textView1 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightUltraLight]];
    self.textView1.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGRect fitFrame = [[self.textView1 layoutManager] usedRectForTextContainer:[self.textView1 textContainer]];
    CGRect newFrame = CGRectMake(0, 0, self.originalFrame.size.width, fitFrame.size.height);
    self.textView1.frame = newFrame;
    
    [self addSubview:self.textView1];
    [self.textView1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
    
    [self adjustFontSizeOfTextViewToFitData];
    
    [self addTopBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [self addBottomBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
  }
  return self;
}




/**
 * Edits the label of the weekly summary module.
 * @author Chase
 *
 * @param summary An NSString of the weekly summary.
 */
- (void)editInfoWithWeeklySummary:(NSString*)summary {
  self.textView1.frame = self.originalFrame;
  self.label1.text = summary;
  [self adjustFontSizeOfTextViewToFitData];
  
  CGRect fitFrame = [[self.textView1 layoutManager] usedRectForTextContainer:[self.textView1 textContainer]];
  CGRect newFrame = CGRectMake(0, 0, self.originalFrame.size.width, fitFrame.size.height);
  self.textView1.frame = newFrame;
  
  [self.textView1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
}




#pragma mark - Full Module

/**
 * Initializes a full module with an array of views.
 * @author Nate
 *
 * @param aRect A CGRect of the frame used to initialoze the view.
 * @param viewArray An NSArray of views (quarter and/or halves) to place in the module.
 * @return An instance of the COFullView class.
 */
- (instancetype)initFullModuleWithFrame:(CGRect)aRect
                        andArrayOfViews:(NSArray *)viewArray {
  self = [super initWithFrame:aRect];
  if (self) {
    UIView *view1;
    CGRect bRect;
    NSInteger xValue = 0;
    NSInteger totalWidth = 0;
    
    // Perform an error check to see if there are too many modules
    for (int i = 0; i < viewArray.count; i++) {
      view1 = [viewArray objectAtIndex:i];
      totalWidth += view1.frame.size.width;
    }
    if (totalWidth > aRect.size.width) {
      NSLog(@"Too many modules in this Full Module.");
    }
    
    for (int i = 0; i < viewArray.count; i++) {
      view1 = [viewArray objectAtIndex:i];
      bRect = CGRectMake(xValue, 0, view1.frame.size.width, view1.frame.size.height);
      view1.frame = bRect;
      [self addSubview:view1];
      
      xValue += view1.frame.size.width;
    }
  }
  [self addTopBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.1]];
  return self;
}




#pragma mark - Helper Methods

- (void)adjustFontSizeOfTextViewToFitData {
  CGSize myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.originalFrame.size.width, FLT_MAX)];
  if (myTextViewSize.height > self.originalFrame.size.height) {
    while (myTextViewSize.height > self.originalFrame.size.height)
    {
      self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize - 0.5];
      [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
      myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.originalFrame.size.width, FLT_MAX)];
    }
  }
  else {
    while (myTextViewSize.height < (self.originalFrame.size.height - 5) && self.textView1.font.pointSize < 85)
    {
      self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize + 0.5];
      [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
      myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.originalFrame.size.width, FLT_MAX)];
    }
    self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize - 0.5];
    [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
  }
}



@end
