//
//  COFifthView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COFifthView.h"

double const ALPHAVALUE = 0.3;

@implementation COFifthView

- (instancetype)initDayModuleWithFrame:(CGRect)aRect
                             dayString:(NSString *)dayString
                            highString:(NSString *)highString
                             lowString:(NSString *)lowString
                          precipString:(NSString *)precipString
                     withBorderOnRight:(BOOL)borderOnRight {
  self = [super initWithFrame:aRect];
  if (self) {
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _label1.text = dayString;
    [_label1 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.6]];
    [_label1 setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightThin]];
    _label1.textAlignment = NSTextAlignmentCenter;
    [_label1 sizeToFit];
    [self addSubview:_label1];
    [_label1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 6)];
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _label2.text = highString;
    [_label2 setTextColor:[UIColor whiteColor]];
    [_label2 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightLight]];
    _label2.textAlignment = NSTextAlignmentCenter;
    [_label2 sizeToFit];
    [self addSubview:_label2];
    [_label2 setCenter:CGPointMake(self.frame.size.width / 4, (self.frame.size.height / 6) * 3)];
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _label3.text = lowString;
    [_label3 setTextColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [_label3 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightLight]];
    _label3.textAlignment = NSTextAlignmentCenter;
    [_label3 sizeToFit];
    [self addSubview:_label3];
    [_label3 setCenter:CGPointMake((self.frame.size.width / 4) * 3, (self.frame.size.height / 6) * 3)];
    
    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _label4.text = precipString;
    [_label4 setTextColor:[UIColor colorWithRed:0.444 green:0.698 blue:1 alpha:1]];
    [_label4 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightLight]];
    _label4.textAlignment = NSTextAlignmentCenter;
    [_label4 sizeToFit];
    [self addSubview:_label4];
    [_label4 setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 5)];
    
    if (borderOnRight) {
      CALayer *layer = [self createRightBorderWithWidth:1
                                                  color:[UIColor colorWithWhite:1 alpha:ALPHAVALUE]
                                            rightOffset:0
                                              topOffset:10
                                        andBottomOffset:10];
      [self.layer insertSublayer:layer atIndex:0];
    }
  }
  return self;
}




- (instancetype)initHourModuleWithFrame:(CGRect)aRect
                             hourString:(NSString *)hourString
                             tempString:(NSString *)tempString
                           precipString:(NSString *)precipString
                      withBorderOnRight:(BOOL)borderOnRight {
  self = [super initWithFrame:aRect];
  if (self) {
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _label1.text = hourString;
    [_label1 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.6]];
    [_label1 setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightThin]];
    _label1.textAlignment = NSTextAlignmentCenter;
    [_label1 sizeToFit];
    [self addSubview:_label1];
    [_label1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 6)];
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _label2.text = tempString;
    [_label2 setTextColor:[UIColor whiteColor]];
    [_label2 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightLight]];
    _label2.textAlignment = NSTextAlignmentCenter;
    [_label2 sizeToFit];
    [self addSubview:_label2];
    [_label2 setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 3)];
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _label3.text = precipString;
    [_label3 setTextColor:[UIColor colorWithRed:0.444 green:0.698 blue:1 alpha:1]];
    [_label3 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightLight]];
    _label3.textAlignment = NSTextAlignmentCenter;
    [_label3 sizeToFit];
    [self addSubview:_label3];
    [_label3 setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 5)];
    
    if (borderOnRight) {
      CALayer *layer = [self createRightBorderWithWidth:1
                                                  color:[UIColor colorWithWhite:1 alpha:ALPHAVALUE]
                                            rightOffset:0
                                              topOffset:10
                                        andBottomOffset:10];
      [self.layer insertSublayer:layer atIndex:0];
    }
  }
  return self;
}




- (instancetype)initHourModuleWithFrame:(CGRect)aRect
                             HourObject:(Hour *)hourObject
                      withborderOnRight:(BOOL)borderOnRight {
  return [self initHourModuleWithFrame:aRect
                            hourString:hourObject.stringVersion
                            tempString:hourObject.temperature
                          precipString:hourObject.precipPercent
                     withBorderOnRight:borderOnRight];
}




- (instancetype)initDayModuleWithFrame:(CGRect)aRect
                             DayObject:(Day *)dayObject
                     withborderOnRight:(BOOL)borderOnRight {
  return [self initDayModuleWithFrame:aRect
                            dayString:dayObject.dayOfWeek
                           highString:dayObject.highTemp
                            lowString:dayObject.lowTemp
                         precipString:dayObject.precipPercent
                    withBorderOnRight:borderOnRight];
}




- (void)editInfoWithDayObject:(Day *)dayObject {
  NSLog(@"edit dayly");
  _label1.text = dayObject.dayOfWeek;
  _label2.text = dayObject.highTemp;
  _label3.text = dayObject.lowTemp;
  _label4.text = dayObject.precipPercent;
}




- (void)editInfoWithHourObject:(Hour *)hourObject {
  NSLog(@"edit hourly");
  _label1.text = hourObject.stringVersion;
  _label2.text = hourObject.temperature;
  _label3.text = hourObject.precipPercent;
}

@end
