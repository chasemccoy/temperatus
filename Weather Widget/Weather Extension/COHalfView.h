//
//  COHalfView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COQuarterView.h"

@interface COHalfView : UIView

#pragma mark - Properties

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UILabel *label3;
@property (strong, nonatomic) UITextView *textView1;
@property (strong, nonatomic) COQuarterView *imageView1;
@property CGRect originalFrame;


#pragma mark - Half View Summary Module

- (instancetype)initHalfSummaryModuleWithFrame:(CGRect)aRect
                                andSummary:(NSString *)summary;
- (void)editInfoWithSummary:(NSString *)summary;

# pragma mark - Half View Current Condition Image With Temps Module

- (instancetype)initCurrentConditionImageWithTemperaturesModuleWithFrame:(CGRect)aRect
                                                               imageName:(NSString *)imageName
                                                             currentTemp:(NSString *)currentTemp
                                                                highTemp:(NSString *)highTemp
                                                                 lowTemp:(NSString *)lowTemp;
- (void)editInfoWithImageName:(NSString *)imageName
                  currentTemp:(NSString *)currentTemp
                     highTemp:(NSString *)highTemp
                      lowTemp:(NSString *)lowTemp;


#pragma mark - Helper Methods

- (void)adjustFontSizeOfTextViewToFitData;


@end
