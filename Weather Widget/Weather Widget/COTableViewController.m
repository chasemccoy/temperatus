//
//  COTableViewController.m
//  Weather Widget
//
//  Created by Nathan Ansel on 9/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COTableViewController.h"

@implementation COTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.cosmicowl.weather"];
}



@end
