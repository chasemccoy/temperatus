//
//  COQuarterView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COQuarterView.h"

@implementation COQuarterView

#pragma mark - Current Temperature Module

/**
 * Initializes a current temperature module.
 * @author Chase
 *
 * @param aRect A CGRect of the frame used to initialize the view.
 * @param temp An NSString of the current temperature.
 *
 * @return An instance of the COQuarterView type.
 */
- (instancetype)initCurrentTempModuleWithFrame:(CGRect)aRect
                                andTemperature:(NSString*)temp {
  // label1 = The current temperature.
  self = [super initWithFrame:aRect];
  if (self) {
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.label1.text = temp;
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.label1 setTextColor:[UIColor whiteColor]];
    self.label1.adjustsFontSizeToFitWidth = YES;
    [self.label1 setFont:[UIFont systemFontOfSize:40 weight:UIFontWeightThin]];
    [self.label1 sizeToFit];
    
//    CGRect myFrame = self.label1.frame;
//    myFrame = CGRectMake(myFrame.origin.x, myFrame.origin.y, aRect.size.width, myFrame.size.height);
//    self.label1.frame = myFrame;
    
    [self addSubview:self.label1];
    [self.label1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
  }
  return  self;
}



/**
 * Changes the data displayed in the current temperature module.
 * @author Chase
 *
 * @param temp An NSString of the new temperature.
 */
- (void)editInfoWithTemperature:(NSString *)temp {
  self.self.label1.text = temp;
  [self.label1 sizeToFit];
}




#pragma mark - High/Low Temperature Module

/**
 * Initializes a high/low temperature module.
 * @author Chase
 *
 * @param aRect A CGRect of the frame used to initialize the view.
 * @param highTemp An NSString of the high temperature.
 * @param lowTemp An NSString of the low temperature.
 *
 * @return An instance of the COQuarterView type.
 */
- (instancetype)initHighLowTempModuleWithFrame:(CGRect)aRect
                                      highTemp:(NSString *)highTemp
                                       lowTemp:(NSString *)lowTemp {
  // label1 = The high temperature.
  // label2 = The low temperature.
  self = [super initWithFrame:aRect];
  if (self) {
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    self.label1.text = [NSString stringWithFormat:@"H: %@", highTemp];
    self.label2.text = [NSString stringWithFormat:@"L: %@", lowTemp];
    
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label2.textAlignment = NSTextAlignmentCenter;
        
    [self.label1 setTextColor:[UIColor whiteColor]];
    [self.label2 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    
    self.label1.adjustsFontSizeToFitWidth = YES;
    self.label2.adjustsFontSizeToFitWidth = YES;
    
    [self.label1 setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightThin]];
    [self.label2 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    
    [self.label1 sizeToFit];
    [self.label2 sizeToFit];
    
//    CGRect highTempFrame = self.label1.frame;
//    highTempFrame = CGRectMake(highTempFrame.origin.x, highTempFrame.origin.y, aRect.size.width, highTempFrame.size.height);
//    self.label1.frame = highTempFrame;
//    CGRect lowTempFrame = self.label2.frame;
//    lowTempFrame = CGRectMake(lowTempFrame.origin.x, lowTempFrame.origin.y, aRect.size.width, lowTempFrame.size.height);
//    self.label2.frame = lowTempFrame;
    
    self.label1.center = CGPointMake(self.frame.size.width / 2, 30);
    self.label2.center = CGPointMake(self.frame.size.width / 2, self.label1.frame.size.height + 35);
    
    [self addSubview:self.label1];
    [self addSubview:self.label2];
  }
  return self;
}



/**
 * Changes the data displayed in the high/low temperature module.
 * @author Chase
 *
 * @param highTemp An NSString of the new high temperature.
 * @param lowTemp An NSString of the new low temperature.
 */
- (void)editInfoWithHighTemp:(NSString *)highTemp
                  andLowTemp:(NSString *)lowTemp {
  self.label1.text = highTemp;
  self.label2.text = lowTemp;
  [self.label1 sizeToFit];
  [self.label2 sizeToFit];
}




#pragma mark - Humidity Module

/**
 * Initializes a humidity module.
 * @author Chase
 *
 * @param aRect A CGRect of the frame used to initialize the view.
 * @param humidity An NSString of the current humidity.
 *
 * @return An instance of the COQuarterView type.
 */
- (instancetype)initHumidityModuleWithFrame:(CGRect)aRect
                                andHumidity:(NSString *)humidity {
  // self.label1 = The title.
  // self.label2 = The humidity.
  self = [super initWithFrame:aRect];
  if (self) {
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    self.label1.text = @"Humidity";
    self.label2.text = humidity;
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label1.adjustsFontSizeToFitWidth = YES;
    self.label2.adjustsFontSizeToFitWidth = YES;
    
    [self.label1 setTextColor:[UIColor whiteColor]];
    [self.label2 setTextColor:[UIColor whiteColor]];
    [self.label1 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightThin]];
    [self.label2 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightLight]];
    [self.label1 sizeToFit];
    [self.label2 sizeToFit];
    
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    
    [self.label1 setCenter:CGPointMake(self.frame.size.width / 2, 25)];
    [self.label2 setCenter:CGPointMake(self.frame.size.width / 2, self.label1.frame.size.height + 30)];
  }
  return  self;
}



/**
 * Changes the data displayed in the humidity module.
 * @author Chase
 *
 * @param temp An NSString of the new humidity.
 */
- (void)editInfoWithHumidity:(NSString *)humidity {
  self.label2.text = humidity;
  [self.label2 sizeToFit];
}




#pragma mark - Dew Point Module

/**
 * Initializes a dew point module.
 * @author Chase
 *
 * @param aRect A CGRect of the frame used to initialize the view.
 * @param dewPoint An NSString of the current dew point.
 *
 * @return An instance of the COQuarterView type.
 */
- (instancetype)initDewPointModuleWithFrame:(CGRect)aRect
                                andDewPoint:(NSString *)dewPoint {
  // self.label1 = The title.
  // self.label2 = The dew point.
  self = [super initWithFrame:aRect];
  if (self) {
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    self.label1.text = @"Dew Point";
    self.label2.text = dewPoint;
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label1.adjustsFontSizeToFitWidth = YES;
    self.label2.adjustsFontSizeToFitWidth = YES;
    
    [self.label1 setTextColor:[UIColor whiteColor]];
    [self.label2 setTextColor:[UIColor whiteColor]];
    [self.label1 setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    [self.label2 setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightLight]];
    [self.label1 sizeToFit];
    [self.label2 sizeToFit];
    
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    
    [self.label1 setCenter:CGPointMake(self.frame.size.width / 2, 20)];
    [self.label2 setCenter:CGPointMake(self.frame.size.width / 2, self.label1.frame.size.height + 35)];
  }
  return  self;
}



/**
 * Changes the data displayed in the dew point module.
 * @author Chase
 *
 * @param temp An NSString of the new dew point.
 */
- (void)editInfoWithDewPoint:(NSString *)dewPoint {
  self.label2.text = dewPoint;
  [self.label2 sizeToFit];
}

@end
