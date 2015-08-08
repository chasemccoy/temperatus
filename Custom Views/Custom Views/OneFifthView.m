//
//  OneFifthView.m
//  Custom Views
//
//  Created by Nathan Ansel on 8/6/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "OneFifthView.h"

@implementation OneFifthView

- (instancetype)initWithFrame:(CGRect)aRect
                    dayString:(NSString *)dayString
                   highString:(NSString *)highString
                    lowString:(NSString *)lowString
                 precipString:(NSString *)precipString {
  self = [super initWithFrame:aRect];
  if (self) {
    self.temp = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.temp.text = dayString;
    [self.temp setTextColor:[UIColor whiteColor]];
    [self.temp setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    self.temp.textAlignment = NSTextAlignmentCenter;
    [self.temp sizeToFit];
    [self.temp adjustsFontSizeToFitWidth];
    [self addSubview:self.temp];
    [self.temp setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 6)];
    
    self.high = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.high.text = highString;
    [self.high setTextColor:[UIColor whiteColor]];
    [self.high setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightThin]];
    self.high.textAlignment = NSTextAlignmentCenter;
    [self.high sizeToFit];
    [self.high adjustsFontSizeToFitWidth];
    [self.high setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:self.high];
    [self.high setCenter:CGPointMake(self.frame.size.width / 4, (self.frame.size.height / 6) * 3)];
    
    self.low = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.low.text = lowString;
    [self.low setTextColor:[UIColor whiteColor]];
    [self.low setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightThin]];
    self.low.textAlignment = NSTextAlignmentCenter;
    [self.low sizeToFit];
    [self.low adjustsFontSizeToFitWidth];
    [self.low setBackgroundColor:[UIColor darkGrayColor]];
    [self addSubview:self.low];
    [self.low setCenter:CGPointMake((self.frame.size.width * 3) / 4, (self.frame.size.height / 6) * 3)];
    
    self.precip = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.precip.text = precipString;
    [self.precip setTextColor:[UIColor blueColor]];
    [self.precip setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    self.precip.textAlignment = NSTextAlignmentCenter;
    [self.precip sizeToFit];
    [self.precip adjustsFontSizeToFitWidth];
    [self addSubview:self.precip];
    [self.precip setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 5)];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)aRect
                   hourString:(NSString *)hourString
                   tempString:(NSString *)tempString
                 precipString:(NSString *)precipString {
  self = [super initWithFrame:aRect];
  if (self) {
    self.temp = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.temp.text = hourString;
    [self.temp setTextColor:[UIColor whiteColor]];
    [self.temp setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    self.temp.textAlignment = NSTextAlignmentCenter;
    [self.temp sizeToFit];
    [self.temp adjustsFontSizeToFitWidth];
    [self addSubview:self.temp];
    [self.temp setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 6)];
    
    self.high = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.high.text = tempString;
    [self.high setTextColor:[UIColor whiteColor]];
    [self.high setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightThin]];
    self.high.textAlignment = NSTextAlignmentCenter;
    [self.high sizeToFit];
    [self.high adjustsFontSizeToFitWidth];
    [self.high setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:self.high];
    [self.high setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 3)];
    
    self.precip = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.precip.text = precipString;
    [self.precip setTextColor:[UIColor blueColor]];
    [self.precip setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    self.precip.textAlignment = NSTextAlignmentCenter;
    [self.precip sizeToFit];
    [self.precip adjustsFontSizeToFitWidth];
    [self addSubview:self.precip];
    [self.precip setCenter:CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 6) * 5)];
  }
  return self;
}

//- (void)drawRect:(CGRect)rect {
//  UIRectFill(self.bounds);
//}

@end
