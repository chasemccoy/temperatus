//
//  COQuarterView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COQuarterView.h"

@implementation COQuarterView

- (instancetype)initCurrentTempModuleWithFrame:(CGRect)aRect
                                andTemperature:(NSString*)temp {
  self = [super initWithFrame:aRect];
  if (self) {
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    tempLabel.text = temp;
    tempLabel.textAlignment = NSTextAlignmentCenter;
    [tempLabel setTextColor:[UIColor whiteColor]];
    tempLabel.adjustsFontSizeToFitWidth = YES;
    [tempLabel setFont:[UIFont systemFontOfSize:40 weight:UIFontWeightThin]];
    [tempLabel sizeToFit];
    [self addSubview:tempLabel];
    [tempLabel setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
  }
  return  self;
}

- (instancetype)initHighLowTempModuleWithFrame:(CGRect)aRect
                                      highTemp:(NSString *)highTemp
                                       lowTemp:(NSString *)lowTemp {
  self = [super initWithFrame:aRect];
  if (self) {
    UILabel *highTempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    UILabel *lowTempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    highTempLabel.text = @"H: 80°";
    lowTempLabel.text = @"L: 67°";
    
    highTempLabel.text = [NSString stringWithFormat:@"H: %@", highTemp];
    lowTempLabel.text = [NSString stringWithFormat:@"L: %@", lowTemp];
    
    highTempLabel.textAlignment = NSTextAlignmentCenter;
    lowTempLabel.textAlignment = NSTextAlignmentCenter;
        
    [highTempLabel setTextColor:[UIColor whiteColor]];
    [lowTempLabel setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    
    highTempLabel.adjustsFontSizeToFitWidth = YES;
    lowTempLabel.adjustsFontSizeToFitWidth = YES;
    
    [highTempLabel setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightThin]];
    [lowTempLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    
    [highTempLabel sizeToFit];
    [lowTempLabel sizeToFit];
    
    highTempLabel.center = CGPointMake(self.frame.size.width / 2, 30);
    lowTempLabel.center = CGPointMake(self.frame.size.width / 2, highTempLabel.frame.size.height + 35);
    
    [self addSubview:highTempLabel];
    [self addSubview:lowTempLabel];
  }
  return self;
}

@end
