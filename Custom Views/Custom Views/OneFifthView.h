//
//  OneFifthView.h
//  Custom Views
//
//  Created by Nathan Ansel on 8/6/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneFifthView : UIView

- (instancetype)initWithFrame:(CGRect)aRect
                    dayString:(NSString *)dayString
                   highString:(NSString *)highString
                    lowString:(NSString *)lowString
                 precipString:(NSString *)precipString;

- (instancetype)initWithFrame:(CGRect)aRect
                   hourString:(NSString *)hourString
                   tempString:(NSString *)tempString
                 precipString:(NSString *)precipString;

@property (nonatomic, strong) UILabel *temp;
@property (nonatomic, strong) UILabel *high;
@property (nonatomic, strong) UILabel *low;
@property (nonatomic, strong) UILabel *precip;

@end
