//
//  ViewController.m
//  Custom Views
//
//  Created by Chase McCoy on 8/1/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  CGRect viewFrame = CGRectMake(20, 30, self.view.bounds.size.width - 40, 200);
  self.customView = [[myView alloc] initWithFrame:viewFrame];
  [self.view addSubview:self.customView];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self updateText];
}

- (void)updateText {
  [NSThread sleepForTimeInterval: 5];
  
  self.customView.myLabel.text = @"New Text";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
