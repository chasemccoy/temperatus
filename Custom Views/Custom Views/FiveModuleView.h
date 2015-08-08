//
//  FiveModuleView.h
//  Custom Views
//
//  Created by Nathan Ansel on 8/6/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneFifthView.h"

@interface FiveModuleView : UIView

- (instancetype)initWithFrame:(CGRect)aRect
               dayStringArray:(NSArray *)dayStringArray
              highStringArray:(NSArray *)highStringArray
               lowStringArray:(NSArray *)lowStringArray
            precipStringArray:(NSArray *)precipStringArray;

- (instancetype)initWithFrame:(CGRect)aRect
              hourStringArray:(NSArray *)hourStringArray
              tempStringArray:(NSArray *)tempStringArray
            precipStringArray:(NSArray *)precipStringArray;

@property (nonatomic, strong) NSMutableArray *views;

@end
