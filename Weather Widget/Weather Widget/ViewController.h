//
//  ViewController.h
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionViewLeftAlignedLayout.h"
#import "HelperClass.h"
#import "COQuarterView.h"
#import "COHalfView.h"

#define HEIGHT (70)

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSUserDefaults *sharedDefaults;

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGR;
@property (strong, nonatomic) NSIndexPath *movingIndexPath;
@property (strong, nonatomic) NSMutableArray *activeModules;

@end


@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSNumber* cellType;

- (void)configureForItem:(NSNumber*)cellType andIndex:(NSInteger)index;
- (NSTimeInterval)randomInterval:(NSTimeInterval)interval andVariance:(double)variance;
- (void)startWiggling;
- (void)stopWiggling;
- (void)prepareForReuse;

@end