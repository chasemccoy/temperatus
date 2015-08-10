//
//  COFifthView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Borders.h"

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

@end
