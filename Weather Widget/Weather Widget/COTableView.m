//
//  COTableView.m
//  Weather Widget
//
//  Created by Nathan Ansel on 9/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "COTableView.h"

@implementation COTableView

- (void)viewDidLoad {
  
  _sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.cosmicowl.weather"];
  
  _data = [[_sharedDefaults objectForKey:@"viewArray"] mutableCopy];
}










- (NSInteger)numberOfRowsInSection:(NSInteger)section {
  NSArray *tempArray = self.data[section];
  return tempArray.count;
}





- (NSInteger)numberOfSections {
  return self.data.count;
}



@end
