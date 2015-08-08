//
//  TodayViewController.h
//  Custom View Widget
//
//  Created by Chase McCoy on 8/2/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myView.h"
#import "currentTempView.h"
#import "FiveModuleView.h"
#import "highLowTempView.h"

@interface TodayViewController : UIViewController

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIView *customView2;
@property (nonatomic, strong) UIView *customView3;
@property (nonatomic, strong) UIView *customView4;
@property (nonatomic, strong) UIView *myCustomView;
@property (nonatomic, strong) currentTempView *tempView;
@property (nonatomic, strong) UIView *fiveDayView;
@property (nonatomic, strong) UIView *fiveHourView;
@property (nonatomic, strong) highLowTempView *highLow;

@end
