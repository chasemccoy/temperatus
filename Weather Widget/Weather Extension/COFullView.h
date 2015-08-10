//
//  COFullView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COFifthView.h"

@interface COFullView : UIView

# pragma mark - Daily Module

- (instancetype)initDailyModuleWithFrame:(CGRect)aRect
                           andDailyArray:(NSArray *)dailyArray;
- (instancetype)initDailyModuleWithFrame:(CGRect)aRect
                          dayStringArray:(NSArray *)dayStringArray
                         highStringArray:(NSArray *)highStringArray
                          lowStringArray:(NSArray *)lowStringArray
                       precipStringArray:(NSArray *)precipStringArray;
- (void)editInfoWithDayArray:(NSArray *)dayArray;

#pragma mark - Hourly Module

- (instancetype)initHourlyModuleWithFrame:(CGRect)aRect
                             andHourArray:(NSArray *)hourArray;
- (instancetype)initHourlyModuleWithFrame:(CGRect)aRect
                          hourStringArray:(NSArray *)hourStringArray
                          tempStringArray:(NSArray *)tempStringArray
                        precipStringArray:(NSArray *)precipStringArray;
- (void)editInfoWithHourArray:(NSArray *)hourArray;

#pragma mark - Properties

@property (strong, nonatomic) NSMutableArray *views;

@end
