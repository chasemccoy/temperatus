//
//  COFullView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COFullView.h"

@implementation COFullView

- (instancetype)initDaylyModuleWithFrame:(CGRect)aRect
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
    [self addBottomBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.3]];
  }
  return self;
}

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
    [self addBottomBorderWithHeight:1 andColor:[UIColor colorWithWhite:1 alpha:0.3]];
  }
  return self;
}

@end
