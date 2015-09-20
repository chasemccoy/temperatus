//
//  COTableView.h
//  Weather Widget
//
//  Created by Nathan Ansel on 9/8/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSUserDefaults *sharedDefaults;
@property (strong, nonatomic) NSMutableArray *data;

@end
