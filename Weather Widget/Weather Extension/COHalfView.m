//
//  COHalfView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COHalfView.h"

@implementation COHalfView

#pragma mark - Day Summary Module

/**
 * Initializes a day summary module.
 * @author Chase
 *
 * @param aRect The CGRect used to initialize the frame.
 * @param summary An NSString of the day summary.
 *
 * @return An instance of the COHalfView class.
 */
- (instancetype)initDaySummaryModuleWithFrame:(CGRect)aRect
                                andDaySummary:(NSString*)summary {
  self = [super initWithFrame:aRect];
  if (self) {
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, aRect.size.width - 10, aRect.size.height - 15)];
    self.label1.text = summary;
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.label1 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    self.label1.adjustsFontSizeToFitWidth = YES;
    [self.label1 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightThin]];
    self.label1.lineBreakMode = NSLineBreakByWordWrapping;
    self.label1.numberOfLines = 0;
    
    CGSize maxSize = CGSizeMake(self.label1.frame.size.width, aRect.size.height - 15);
    CGSize expectedSize = [self.label1 sizeThatFits:maxSize];
    self.label1.frame = CGRectMake(self.label1.frame.origin.x, self.label1.frame.origin.y, expectedSize.width, expectedSize.height);
    
    [self addSubview:self.label1];
    [self.label1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
  }
  return self;
}




/**
 * Edits the label of the day summary module.
 * @author Chase
 *
 * @param summary An NSString of the day summary.
 */
- (void)editInfoWithDaySummary:(NSString*)summary {
  self.label1.text = summary;
}




#pragma mark - Hour Summary Module

/**
 * Initializes an hour summary module.
 * @author Chase
 *
 * @param aRect The CGRect used to initialize the frame.
 * @param summary An NSString of the hour summary.
 *
 * @return An instance of the COHalfView class.
 */
- (instancetype)initHourSummaryModuleWithFrame:(CGRect)aRect
                                andHourSummary:(NSString*)summary {
  self = [super initWithFrame:aRect];
  if (self) {
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, aRect.size.width - 10, aRect.size.height - 15)];
    self.label1.text = summary;
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.label1 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    self.label1.adjustsFontSizeToFitWidth = YES;
    [self.label1 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightThin]];
    self.label1.lineBreakMode = NSLineBreakByWordWrapping;
    self.label1.numberOfLines = 0;
    
    CGSize maxSize = CGSizeMake(self.label1.frame.size.width, aRect.size.height - 15);
    CGSize expectedSize = [self.label1 sizeThatFits:maxSize];
    self.label1.frame = CGRectMake(self.label1.frame.origin.x, self.label1.frame.origin.y, expectedSize.width, expectedSize.height);
    
    [self addSubview:self.label1];
    [self.label1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
    
  }
  return self;
}




/**
 * Edits the label of the hour summary module.
 * @author Chase
 *
 * @param summary An NSString of the hour summary.
 */
- (void)editInfoWithHourSummary:(NSString*)summary {
  self.label1.text = summary;
}


@end
