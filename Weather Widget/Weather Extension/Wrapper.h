//
//  Wrapper.h
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wrapper : NSObject

@property (strong, nonatomic) NSDictionary *JSON;

-(Wrapper*)wrapData:(NSDictionary*)JSON;

@end
