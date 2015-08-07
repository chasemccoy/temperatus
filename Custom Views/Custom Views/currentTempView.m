//
//  currentTempView.m
//  Custom Views
//
//  Created by Chase McCoy on 8/6/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "currentTempView.h"

@implementation currentTempView

- (instancetype)initWithFrame:(CGRect)aRect {
  self = [super initWithFrame:aRect];
  if (self) {
    self.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.tempLabel.text = @"70°";
    self.tempLabel.textAlignment = NSTextAlignmentCenter;
    [self.tempLabel setTextColor:[UIColor whiteColor]];
    self.tempLabel.adjustsFontSizeToFitWidth = YES;
    [self.tempLabel setFont:[UIFont systemFontOfSize:40]];
    [self.tempLabel sizeToFit];
    [self addSubview:self.tempLabel];
    [self.tempLabel setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
    
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
