//
//  COQuarterView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COQuarterView : UIView

#pragma mark - Properties

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UIImageView *imageView;


#pragma mark - Blank Module

- (instancetype)initBlankModuleWithFrame:(CGRect)aRect;


#pragma mark - Current Temperature Module

- (instancetype)initCurrentTempModuleWithFrame:(CGRect)aRect
                                andTemperature:(NSString *)temp;
- (void)editInfoWithTemperature:(NSString *)temp;


#pragma mark - Current Condition Module

- (instancetype)initCurrentConditionModuleWithFrame:(CGRect)aRect
                                andIcon:(NSString *)iconName;
- (void)editInfoWithIcon:(NSString *)iconName;


#pragma mark - High/Low Temperature Module

- (instancetype)initHighLowTempModuleWithFrame:(CGRect)aRect
                                      highTemp:(NSString *)highTemp
                                       lowTemp:(NSString *)lowTemp;
- (void)editInfoWithHighTemp:(NSString *)highTemp
                  andLowTemp:(NSString *)lowTemp;


#pragma mark - Humidity Module

- (instancetype)initHumidityModuleWithFrame:(CGRect)aRect
                                andHumidity:(NSString *)humidity;
- (void)editInfoWithHumidity:(NSString *)humidity;


#pragma mark - Dew Point Module
- (instancetype)initDewPointModuleWithFrame:(CGRect)aRect
                                andDewPoint:(NSString *)dewPoint;
- (void)editInfoWithDewPoint:(NSString *)dewPoint;

@end
