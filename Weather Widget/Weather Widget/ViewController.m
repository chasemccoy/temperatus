//
//  ViewController.m
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.cosmicowl.weather"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
