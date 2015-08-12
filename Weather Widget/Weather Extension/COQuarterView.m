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
    
//    CGRect myFrame = tempLabel.frame;
//    myFrame = CGRectMake(myFrame.origin.x, myFrame.origin.y, aRect.size.width, myFrame.size.height);
//    tempLabel.frame = myFrame;
    
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
    
//    CGRect highTempFrame = highTempLabel.frame;
//    highTempFrame = CGRectMake(highTempFrame.origin.x, highTempFrame.origin.y, aRect.size.width, highTempFrame.size.height);
//    highTempLabel.frame = highTempFrame;
//    CGRect lowTempFrame = lowTempLabel.frame;
//    lowTempFrame = CGRectMake(lowTempFrame.origin.x, lowTempFrame.origin.y, aRect.size.width, lowTempFrame.size.height);
//    lowTempLabel.frame = lowTempFrame;
    
    highTempLabel.center = CGPointMake(self.frame.size.width / 2, 30);
    lowTempLabel.center = CGPointMake(self.frame.size.width / 2, highTempLabel.frame.size.height + 35);
    
    [self addSubview:highTempLabel];
    [self addSubview:lowTempLabel];
  }
  return self;
}

- (instancetype)initHumidityModuleWithFrame:(CGRect)aRect
                                andHumidity:(NSString *)humidity {
  self = [super initWithFrame:aRect];
  if (self) {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    UILabel *humidityLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    titleLabel.text = @"Humidity";
    humidityLabel.text = humidity;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    humidityLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    humidityLabel.adjustsFontSizeToFitWidth = YES;
    
    [titleLabel setTextColor:[UIColor whiteColor]];
    [humidityLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    [humidityLabel setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightLight]];
    [titleLabel sizeToFit];
    [humidityLabel sizeToFit];
    
    [self addSubview:titleLabel];
    [self addSubview:humidityLabel];
    
    [titleLabel setCenter:CGPointMake(self.frame.size.width / 2, 20)];
    [humidityLabel setCenter:CGPointMake(self.frame.size.width / 2, titleLabel.frame.size.height + 35)];
  }
  return  self;
}

- (instancetype)initDewPointModuleWithFrame:(CGRect)aRect
                                andDewPoint:(NSString *)dewPoint {
  self = [super initWithFrame:aRect];
  if (self) {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    UILabel *dewPointLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    titleLabel.text = @"Dew Point";
    dewPointLabel.text = dewPoint;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    dewPointLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    dewPointLabel.adjustsFontSizeToFitWidth = YES;
    
    [titleLabel setTextColor:[UIColor whiteColor]];
    [dewPointLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    [dewPointLabel setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightLight]];
    [titleLabel sizeToFit];
    [dewPointLabel sizeToFit];
    
    [self addSubview:titleLabel];
    [self addSubview:dewPointLabel];
    
    [titleLabel setCenter:CGPointMake(self.frame.size.width / 2, 20)];
    [dewPointLabel setCenter:CGPointMake(self.frame.size.width / 2, titleLabel.frame.size.height + 35)];
  }
  return  self;
}

@end
