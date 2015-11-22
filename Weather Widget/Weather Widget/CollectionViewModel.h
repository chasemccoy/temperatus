//
//  CollectionViewModel.h
//  Weather Widget
//
//  Created by Nathan Ansel on 11/22/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionViewModel : NSObject

+ (NSArray *)viewArrayFromActiveModules:(NSArray *)enumArray;
+ (NSArray *)viewArrayFromActiveModules:(NSArray *)enumArray andWidth:(int)width;

@end
