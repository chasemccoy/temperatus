//
//  FiveModuleView.m
//  Custom Views
//
//  Created by Nathan Ansel on 8/6/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "FiveModuleView.h"

@implementation FiveModuleView

- (instancetype)initWithFrame:(CGRect)aRect {
  self = [super initWithFrame:aRect];
  if (self) {
    int width = aRect.size.width / 5;
    
    CGRect viewFrame = CGRectMake(0, 0, width, 100);
    self.view1 = [[OneFifthView alloc] initWithFrame:viewFrame];
    self.view1.clipsToBounds = YES;
    [self addSubview:self.view1];
    
    viewFrame = CGRectMake(width, 0, width, 100);
    self.view2 = [[OneFifthView alloc] initWithFrame:viewFrame];
    self.view2.clipsToBounds = YES;
    [self addSubview:self.view2];
    
    viewFrame = CGRectMake(width * 2, 0, width, 100);
    self.view3 = [[OneFifthView alloc] initWithFrame:viewFrame];
    self.view3.clipsToBounds = YES;
    [self addSubview:self.view3];
    
    viewFrame = CGRectMake(width * 3, 0, width, 100);
    self.view4 = [[OneFifthView alloc] initWithFrame:viewFrame];
    self.view4.clipsToBounds = YES;
    [self addSubview:self.view4];
    
    viewFrame = CGRectMake(width * 4, 0, width, 100);
    self.view5 = [[OneFifthView alloc] initWithFrame:viewFrame];
    self.view5.clipsToBounds = YES;
    [self addSubview:self.view5];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)aRect
               dayStringArray:(NSArray *)dayStringArray
              highStringArray:(NSArray *)highStringArray
               lowStringArray:(NSArray *)lowStringArray
            precipStringArray:(NSArray *)precipStringArray {
  self = [super initWithFrame:aRect];
  if (self) {
    self.views = [[NSMutableArray alloc] init];
    int width = aRect.size.width / 5;
    CGRect viewFrame;
    UIView *view;
    
    for (int i = 0; i < 5; i++) {
      viewFrame = CGRectMake(width * i, 0, width, 100);
      view = [[OneFifthView alloc] initWithFrame:viewFrame
                                       dayString:[dayStringArray objectAtIndex:i]
                                      highString:[highStringArray objectAtIndex:i]
                                       lowString:[lowStringArray objectAtIndex:i]
                                    precipString:[precipStringArray objectAtIndex:i]];
      view.clipsToBounds = YES;
      [self.views addObject:view];
      [self addSubview:[self.views objectAtIndex:i]];
//      switch (i) {
//        case 1:
//          [[self.views objectAtIndex:i] setBackgroundColor:[UIColor blueColor]];
//          break;
//        case 2:
//          [[self.views objectAtIndex:i] setBackgroundColor:[UIColor redColor]];
//          break;
//        case 3:
//          [[self.views objectAtIndex:i] setBackgroundColor:[UIColor orangeColor]];
//          break;
//        case 4:
//          [[self.views objectAtIndex:i] setBackgroundColor:[UIColor greenColor]];
//          break;
//        default:
//          break;
//      }
    }
  }
  return self;
}

//- (void)drawRect:(CGRect)rect {
//  [[UIColor redColor] setFill];
//  UIRectFill(self.bounds);
//  
//  [[UIColor blueColor] setFill];
//  CGRect topLine = CGRectMake(0,0,self.bounds.size.width, 5);
//  UIRectFill(topLine);
//  CGRect bottomLine = CGRectMake(0,self.bounds.origin.y + self.bounds.size.height - 5, self.bounds.size.width, 5);
//  UIRectFill(bottomLine);
//}

@end
