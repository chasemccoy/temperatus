//
//  ViewController.h
//  forecast
//
//  Created by Chase McCoy on 7/14/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate> {
  NSURLConnection *currentConnection;
}

@property (retain, nonatomic) NSMutableData *xmlData;
@property (strong, nonatomic) NSDictionary *currently;

- (void)updateForecastData;

@end

