//
//  COHalfView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COHalfView : UIView

#pragma mark - Properties

@property (strong, nonatomic) UILabel *label1;


#pragma mark - Day Summary Module

- (instancetype)initDaySummaryModuleWithFrame:(CGRect)aRect
                                andDaySummary:(NSString*)summary;
- (void)editInfoWithDaySummary:(NSString*)summary;


#pragma mark - Hour Summary Module

- (instancetype)initHourSummaryModuleWithFrame:(CGRect)aRect
                                andHourSummary:(NSString*)summary;
- (void)editInfoWithHourSummary:(NSString*)summary;


@end
