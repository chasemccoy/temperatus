//
//  myView.m
//  Custom Views
//
//  Created by Chase McCoy on 8/1/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "myView.h"

@implementation myView

- (instancetype)initWithFrame:(CGRect)aRect {
  self = [super initWithFrame:aRect];
  if (self) {
    self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.myLabel.text = @"Hello World!";
    self.myLabel.textAlignment = NSTextAlignmentCenter;
    [self.myLabel sizeToFit];
    [self addSubview:self.myLabel];
    [self.myLabel setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  [[UIColor redColor] setFill];
  UIRectFill(self.bounds);
  
  [[UIColor blueColor] setFill];
  CGRect topLine = CGRectMake(0,0,self.bounds.size.width, 5);
  UIRectFill(topLine);
  CGRect bottomLine = CGRectMake(0,self.bounds.origin.y + self.bounds.size.height - 5, self.bounds.size.width, 5);
  UIRectFill(bottomLine);
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
//  self.myLabel.text = @"Hello World!";
//  self.myLabel.textAlignment = NSTextAlignmentCenter;
//  [self.myLabel sizeToFit];
//  [self addSubview:self.myLabel];
//  [self.myLabel setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
}

@end
