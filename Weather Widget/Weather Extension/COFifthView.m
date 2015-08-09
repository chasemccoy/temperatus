//
//  COFifthView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COFifthView.h"

@implementation COFifthView

- (instancetype)initDayModuleWithFrame:(CGRect)aRect
                              dayString:(NSString *)dayString
                             highString:(NSString *)highString
                              lowString:(NSString *)lowString
                           precipString:(NSString *)precipString {
  self = [super initWithFrame:aRect];
  if (self) {
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label1.text = dayString;
    [label1 setTextColor:[UIColor whiteColor]];
    [label1 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    label1.textAlignment = NSTextAlignmentCenter;
    [label1 sizeToFit];
    [self addSubview:label1];
    [label1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 6)];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label2.text = highString;
    [label2 setTextColor:[UIColor whiteColor]];
    [label2 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    label2.textAlignment = NSTextAlignmentCenter;
    [label2 sizeToFit];
    [self addSubview:label2];
    [label2 setCenter:CGPointMake(self.frame.size.width / 4, (self.frame.size.height / 6) * 3)];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label3.text = lowString;
    [label3 setTextColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [label3 setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightThin]];
    label3.textAlignment = NSTextAlignmentCenter;
    [label3 sizeToFit];
    [self addSubview:label3];
    [label3 setCenter:CGPointMake((self.frame.size.width / 4) * 3, (self.frame.size.height / 6) * 3)];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label4.text = precipString;
    [label4 setTextColor:[UIColor whiteColor]];
    [label4 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    label4.textAlignment = NSTextAlignmentCenter;
    [label4 sizeToFit];
    [self addSubview:label4];
    [label4 setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 5)];
  }
  return self;
}

- (instancetype)initHourModuleWithFrame:(CGRect)aRect
                             hourString:(NSString *)hourString
                             tempString:(NSString *)tempString
                           precipString:(NSString *)precipString {
  self = [super initWithFrame:aRect];
  if (self) {
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label1.text = hourString;
    [label1 setTextColor:[UIColor whiteColor]];
    [label1 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    label1.textAlignment = NSTextAlignmentCenter;
    [label1 sizeToFit];
    [self addSubview:label1];
    [label1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 6)];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label2.text = tempString;
    [label2 setTextColor:[UIColor whiteColor]];
    [label2 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    label2.textAlignment = NSTextAlignmentCenter;
    [label2 sizeToFit];
    [self addSubview:label2];
    [label2 setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 3)];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label3.text = precipString;
    [label3 setTextColor:[UIColor whiteColor]];
    [label3 setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightThin]];
    label3.textAlignment = NSTextAlignmentCenter;
    [label3 sizeToFit];
    [self addSubview:label3];
    [label3 setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 5)];
  }
  return self;
}

@end
