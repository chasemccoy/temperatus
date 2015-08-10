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

- (instancetype)initDayModuleWithFrame:(CGRect)aRect
                             dayString:(NSString *)dayString
                            highString:(NSString *)highString
                             lowString:(NSString *)lowString
                          precipString:(NSString *)precipString
                     withBorderOnRight:(BOOL)borderOnRight;

- (instancetype)initHourModuleWithFrame:(CGRect)aRect
                             hourString:(NSString *)hourString
                             tempString:(NSString *)tempString
                           precipString:(NSString *)precipString
                      withBorderOnRight:(BOOL)borderOnRight;

- (instancetype)initDayModuleWithFrame:(CGRect)aRect
                             DayObject:(Day *)dayObject
                     withborderOnRight:(BOOL)borderOnRight;

- (instancetype)initHourModuleWithFrame:(CGRect)aRect
                             HourObject:(Hour *)hourObject
                      withborderOnRight:(BOOL)borderOnRight;

- (void)editInfoWithDayObject:(Day *)dayObject;
- (void)editInfoWithHourObject:(Hour *)hourObject;

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;

@end
