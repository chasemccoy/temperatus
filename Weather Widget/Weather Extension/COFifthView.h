//
//  COFifthView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Borders.h"
#import "Hour.h"
#import "Day.h"

@interface COFifthView : UIView

#pragma mark - Day Module

- (instancetype)initDayModuleWithFrame:(CGRect)aRect
                             dayObject:(Day *)dayObject
                     withborderOnRight:(BOOL)borderOnRight;
- (instancetype)initDayModuleWithFrame:(CGRect)aRect
                             dayString:(NSString *)dayString
                            highString:(NSString *)highString
                             lowString:(NSString *)lowString
                          precipString:(NSString *)precipString
                     withBorderOnRight:(BOOL)borderOnRight;
- (void)editInfoWithDayObject:(Day *)dayObject;

# pragma mark - Hour Module

- (instancetype)initHourModuleWithFrame:(CGRect)aRect
                             hourObject:(Hour *)hourObject
                      withborderOnRight:(BOOL)borderOnRight;
- (instancetype)initHourModuleWithFrame:(CGRect)aRect
                             hourString:(NSString *)hourString
                             tempString:(NSString *)tempString
                           precipString:(NSString *)precipString
                      withBorderOnRight:(BOOL)borderOnRight;
- (void)editInfoWithHourObject:(Hour *)hourObject;

# pragma mark - Properties

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UILabel *label3;
@property (strong, nonatomic) UILabel *label4;

@end
