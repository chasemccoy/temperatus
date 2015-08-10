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

- (instancetype)initDailyModuleWithFrame:(CGRect)aRect
                          dayStringArray:(NSArray *)dayStringArray
                         highStringArray:(NSArray *)highStringArray
                          lowStringArray:(NSArray *)lowStringArray
                       precipStringArray:(NSArray *)precipStringArray;

- (instancetype)initHourlyModuleWithFrame:(CGRect)aRect
                          hourStringArray:(NSArray *)hourStringArray
                          tempStringArray:(NSArray *)tempStringArray
                        precipStringArray:(NSArray *)precipStringArray;

- (instancetype)initDailyModuleWithFrame:(CGRect)aRect
                           andDaylyArray:(NSArray *)daylyArray;

- (instancetype)initHourlyModuleWithFrame:(CGRect)aRect
                             andHourArray:(NSArray *)hourArray;

- (void)editInfoWithDayArray:(NSArray *)dayArray;
- (void)editInfoWithHourArray:(NSArray *)hourArray;

@property (nonatomic, strong) NSMutableArray *views;

@end
