//
//  Wrapper.m
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "Wrapper.h"

@implementation Wrapper

-(Wrapper*)wrapData:(NSDictionary*)JSON {
  _JSON = JSON;
  return self;
}

@end
