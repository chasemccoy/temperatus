//
//  ViewController.h
//  forecast
//
//  Created by Chase McCoy on 7/14/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserLocation.h"
#import "Forecastr.h"

@interface ViewController : UIViewController {
  UserLocation *locationTest;
  Forecastr *forecastr;
}

@property(nonatomic, strong) IBOutlet UITextView* textView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;

- (void)updateForecastData;
- (void)updateView:(NSDictionary*)JSON;
- (void)adjustFontSizeOfTextViewToFitData;

@end

