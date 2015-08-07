//
//  highLowTempView.m
//  Custom Views
//
//  Created by Chase McCoy on 8/6/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "highLowTempView.h"

@implementation highLowTempView

- (instancetype)initWithFrame:(CGRect)aRect {
  self = [super initWithFrame:aRect];
  if (self) {
    self.highTemp = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.lowTemp = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    self.highTemp.text = @"80°";
    self.lowTemp.text = @"67°";
    
    self.highTemp.textAlignment = NSTextAlignmentCenter;
    self.lowTemp.textAlignment = NSTextAlignmentCenter;
    
    [self.highTemp setTextColor:[UIColor whiteColor]];
    [self.lowTemp setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
    
    self.highTemp.adjustsFontSizeToFitWidth = YES;
    self.lowTemp.adjustsFontSizeToFitWidth = YES;
    
    [self.highTemp setFont:[UIFont systemFontOfSize:28 weight:UIFontWeightThin]];
    [self.lowTemp setFont:[UIFont systemFontOfSize:22 weight:UIFontWeightThin]];
    
    [self.highTemp sizeToFit];
    [self.lowTemp sizeToFit];
    
    self.highTemp.center = CGPointMake(self.frame.size.width / 2, 30);
    self.lowTemp.center = CGPointMake(self.frame.size.width / 2, self.highTemp.frame.size.height + 35);
    
    [self addSubview:self.highTemp];
    [self addSubview:self.lowTemp];    
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  [super drawRect:rect];
}

- (void)layoutSubviews {
  [super layoutSubviews];
}


@end
