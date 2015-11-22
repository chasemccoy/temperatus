//
//  CollectionViewModel.m
//  Weather Widget
//
//  Created by Nathan Ansel on 11/22/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import "CollectionViewModel.h"
#import "HelperClass.h"
@import UIKit;

@implementation CollectionViewModel

/**
 * Calculates and returns a 2D array of the view layout for the widget from a
 *   1D array of View Enums from the UICollectionView in the app. Calls 
 *   viewArrayFromActiveModules: andWidth: to do the heavylifting. Passes in the
 *   device screen width as width.
 * @author Nate
 *
 * @param enumArray An NSArray object of a 1D array of View Enums to be used to
 *          calculate the 2D View Array for the widget
 * @return An NSArray object that is the 2D calculation of the View Enums array
 *          passed in.
 */
+ (NSArray *)viewArrayFromActiveModules:(NSArray *)enumArray {
  return [self viewArrayFromActiveModules:enumArray andWidth:[UIScreen mainScreen].bounds.size.width];
}






/**
 * Calculates and returns a 2D array of the view layout for the widget from a
 *   1D array of View Enums from the UICollectionView in the app.
 * @author Nate
 *
 * @param enumArray An NSArray object of a 1D array of View Enums to be used to
 *          calculate the 2D View Array for the widget
 * @param width The width of the frame that the collection is bounded to
 * @return An NSArray object that is the 2D calculation of the View Enums array
 *          passed in.
 */
+ (NSArray *)viewArrayFromActiveModules:(NSArray *)enumArray andWidth:(int)width {
  int i = 0;
  int j = 0;
  int quarterWidth = width / 4;
  int halfWidth = width / 2;
  int fullWidth = width;
  int currentWidth = 0;
  int currentModuleWidth = 0;
  NSMutableArray *toReturnArray = [[NSMutableArray alloc] init];
  
  for (i = 0; i < 6; i++) {
    [toReturnArray addObject:[[NSMutableArray alloc] init]];
  }
  
  for (i = 0; i < enumArray.count; i++) {
    
    if ([enumArray[i] integerValue] < HALF_START) {
      currentModuleWidth = quarterWidth;
    }
    else if ([enumArray[i] integerValue] < FULL_START) {
      currentModuleWidth = halfWidth;
    }
    else {
      currentModuleWidth = fullWidth;
    }
    
    if ((currentWidth + currentModuleWidth) <= width) {
      currentWidth += currentModuleWidth;
      [toReturnArray[j] addObject:enumArray[i]];
    }
    else {
      j++;
      if (j == 6) {
        toReturnArray[0][0] = [NSNumber numberWithInt:-1];
        return toReturnArray;
      }
      currentWidth = currentModuleWidth;
      [toReturnArray[j] addObject:enumArray[i]];
    }
  }
  
  NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.cosmicowl.weather"];
  [sharedDefaults setObject:toReturnArray forKey:@"viewArray"];
  [sharedDefaults synchronize];
  
  return toReturnArray;
}

@end
