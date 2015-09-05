//
//  COHalfView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 8/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COHalfView.h"

@implementation COHalfView

#pragma mark - Half View Summary Module

/**
 * Initializes a half view summary module.
 * @author Chase
 *
 * @param aRect The CGRect used to initialize the frame.
 * @param summary An NSString of the summary.
 *
 * @return An instance of the COHalfView class.
 */
- (instancetype)initHalfSummaryModuleWithFrame:(CGRect)aRect
                                andSummary:(NSString*)summary {
  self = [super initWithFrame:aRect];
  if (self) {
    self.textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, aRect.size.width - 10, aRect.size.height - 15)];
    self.textView1.textContainerInset = UIEdgeInsetsZero;
    [self.textView1 setBackgroundColor:[UIColor clearColor]];
    self.textView1.editable = NO;
    self.textView1.selectable = NO;
    self.textView1.scrollEnabled = NO;
    self.textView1.text = summary;
    self.textView1.textAlignment = NSTextAlignmentCenter;
    [self.textView1 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    [self.textView1 setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightUltraLight]];
    self.textView1.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self addSubview:self.textView1];
    [self.textView1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
    
    [self adjustFontSizeOfTextViewToFitData];
  }
  return self;
}




/**
 * Edits the label of the half view summary module.
 * @author Chase
 *
 * @param summary An NSString of the summary.
 */
- (void)editInfoWithSummary:(NSString*)summary {
  self.textView1.text = summary;
  [self adjustFontSizeOfTextViewToFitData];
}




#pragma mark - Helper Methods

- (void)adjustFontSizeOfTextViewToFitData {
  CGSize myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.textView1.frame.size.width, FLT_MAX)];
  if (myTextViewSize.height > self.textView1.frame.size.height) {
    while (myTextViewSize.height > self.textView1.frame.size.height)
    {
      self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize - 1];
      [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
      myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.textView1.frame.size.width, FLT_MAX)];
    }
  }
  else {
    while (myTextViewSize.height < (self.textView1.frame.size.height - 10) && self.textView1.font.pointSize < 85)
    {
      self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize + 1];
      [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
      myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.textView1.frame.size.width, FLT_MAX)];
    }
    
  }
}


@end
