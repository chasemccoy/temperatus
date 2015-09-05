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
@property (strong, nonatomic) UITextView *textView1;


#pragma mark - Half View Summary Module

- (instancetype)initHalfSummaryModuleWithFrame:(CGRect)aRect
                                andSummary:(NSString*)summary;
- (void)editInfoWithSummary:(NSString*)summary;


#pragma mark - Helper Methods

- (void)adjustFontSizeOfTextViewToFitData;


@end
