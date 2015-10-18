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
    self.textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, aRect.size.width - 10, aRect.size.height - 10)];
    self.originalFrame = self.textView1.frame;
    self.textView1.textContainerInset = UIEdgeInsetsZero;
    [self.textView1 setBackgroundColor:[UIColor clearColor]];
    self.textView1.editable = NO;
    self.textView1.selectable = NO;
    self.textView1.scrollEnabled = YES;
    self.textView1.text = summary;
    self.textView1.scrollEnabled = NO;
    self.textView1.textAlignment = NSTextAlignmentCenter;
    [self.textView1 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    [self.textView1 setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightUltraLight]];
    self.textView1.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self adjustFontSizeOfTextViewToFitData];
    
    // This sort of works maybe kinda not really stop asking me http://stackoverflow.com/questions/18859637/setting-uitextview-frame-to-content-size-no-longer-works-in-xcode-5
    CGRect fitFrame = [[self.textView1 layoutManager] usedRectForTextContainer:[self.textView1 textContainer]];
    CGRect newFrame = CGRectMake(0, 0, self.originalFrame.size.width, fitFrame.size.height);
    self.textView1.frame = newFrame;
    
    [self addSubview:self.textView1];
    [self.textView1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
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
  self.textView1.frame = self.originalFrame;
  self.textView1.scrollEnabled = YES;
  self.textView1.text = summary;
  self.textView1.scrollEnabled = NO;
  
  [self adjustFontSizeOfTextViewToFitData];
  
  CGRect fitFrame = [[self.textView1 layoutManager] usedRectForTextContainer:[self.textView1 textContainer]];
  CGRect newFrame = CGRectMake(0, 0, self.originalFrame.size.width, fitFrame.size.height);
  self.textView1.frame = newFrame;
  
  [self.textView1 setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
}




# pragma mark - Half View Current Condition Image With Temps Module

/**
 * Initializes a half view with the current condition icon and current, high, and low temperatures.
 * @author Nate
 *
 * @param aRect a CGRect to build the view with
 * @param imageName NSString of the icon name
 * @param currentTemp NSString of the current temperature
 * @param highTemp NSString of the high temperature
 * @param lowTemp NSString of the low temperature
 * @return An instance of the COHalfView class
 */
- (instancetype)initCurrentConditionImageWithTemperaturesModuleWithFrame:(CGRect)aRect
                                                               imageName:(NSString *)imageName
                                                             currentTemp:(NSString *)currentTemp
                                                                highTemp:(NSString *)highTemp
                                                                 lowTemp:(NSString *)lowTemp {
  self = [super initWithFrame:aRect];
  if (self) {
    CGRect bRect = CGRectMake(0, 0, aRect.size.width / 2, aRect.size.height);
    self.imageView1 = [[COQuarterView alloc] initCurrentConditionModuleWithFrame:bRect
                                                                         andIcon:imageName];
    [self addSubview:self.imageView1];
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(aRect.size.width * 0.5, 0, aRect.size.width * 0.5, aRect.size.height * 0.7)];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(aRect.size.width * 0.5, aRect.size.height * 0.7, aRect.size.width * 0.25, aRect.size.height * 0.3)];
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(aRect.size.width * 0.75, aRect.size.height * 0.7, aRect.size.width * 0.25, aRect.size.height * 0.3)];
    
    self.label1.text = currentTemp;
    self.label2.text = highTemp;
    self.label3.text = lowTemp;
    
    [self.label1 setTextColor:[UIColor whiteColor]];
    [self.label2 setTextColor:[UIColor whiteColor]];
    [self.label3 setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    
    [self.label1 setBackgroundColor:[UIColor purpleColor]];
    [self.label2 setBackgroundColor:[UIColor blueColor]];
    [self.label3 setBackgroundColor:[UIColor redColor]];
    
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label3.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    [self addSubview:self.label3];
  }
  return self;
}





/**
 * Edits the half view with a new icon, current, high, and low temperatures.
 * @author Nate
 *
 * @param imageName NSString of the icon name
 * @param currentTemp NSString of the current temperature
 * @param highTemp NSString of the high temperature
 * @param lowTemp NSString of the low temperature
 */
- (void)editInfoWithImageName:(NSString *)imageName
                  currentTemp:(NSString *)currentTemp
                     highTemp:(NSString *)highTemp
                      lowTemp:(NSString *)lowTemp {
  [self.imageView1 editInfoWithCurrentConditionIcon:imageName];
  self.label1.text = currentTemp;
  NSString *labelText = lowTemp;//[NSString stringWithFormat:@"%@/%@", highTemp, lowTemp];
  self.label2.text = labelText;
  NSLog(self.label2.text);
}




#pragma mark - Helper Methods

- (void)adjustFontSizeOfTextViewToFitData {
  CGSize myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.originalFrame.size.width, FLT_MAX)];
  if (myTextViewSize.height > self.originalFrame.size.height) {
    while (myTextViewSize.height > self.originalFrame.size.height)
    {
      self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize - 0.5];
      [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
      myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.originalFrame.size.width, FLT_MAX)];
    }
  }
  else {
    while (myTextViewSize.height < (self.originalFrame.size.height - 5) && self.textView1.font.pointSize < 85)
    {
      self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize + 0.5];
      [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
      myTextViewSize = [self.textView1 sizeThatFits:CGSizeMake(self.originalFrame.size.width, FLT_MAX)];
    }
    self.textView1.font = [self.textView1.font fontWithSize:self.textView1.font.pointSize - 0.5];
    [self.textView1 setFont:[UIFont systemFontOfSize:self.textView1.font.pointSize weight:UIFontWeightThin]];
  }
}


@end
