//
//  COQuarterView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COQuarterView : UIView

- (instancetype)initCurrentTempModuleWithFrame:(CGRect)aRect
                                andTemperature:(NSString *)temp;
- (instancetype)initHighLowTempModuleWithFrame:(CGRect)aRect
                                      highTemp:(NSString *)highTemp
                                       lowTemp:(NSString *)lowTemp;
- (instancetype)initHumidityModuleWithFrame:(CGRect)aRect
                                andHumidity:(NSString *)humidity;
- (instancetype)initDewPointModuleWithFrame:(CGRect)aRect
                                andDewPoint:(NSString *)dewPoint;

@end
