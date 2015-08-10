//
//  TodayViewController.h
//  Weather Extension
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateInfo.h"
#import "COFullView.h"
#import "COHalfView.h"
#import "COQuarterView.h"

@interface TodayViewController : UIViewController

@property (strong, nonatomic) UpdateInfo *updateInfo;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) COFullView *hourView;
@property (strong, nonatomic) COFullView *dayView;
@property (strong, nonatomic) Wrapper *myWrapper;

- (void)updateView;
- (void)createView;

@end
