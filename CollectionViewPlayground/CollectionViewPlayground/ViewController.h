//
//  ViewController.h
//  CollectionViewPlayground
//
//  Created by Chase McCoy on 10/19/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionViewLeftAlignedLayout.h"

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGR;
@property (strong, nonatomic) NSIndexPath *movingIndexPath;
@property (strong, atomic) NSMutableArray *items;

@property (strong, nonatomic) NSMutableArray *oldItemSizes;

@end


@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView* imageView;
@property (strong, nonatomic) NSString* name;

- (void)configureForItem:(NSString*)imageName andIndex:(NSInteger)index;
- (NSTimeInterval)randomInterval:(NSTimeInterval)interval andVariance:(double)variance;
- (void)startWiggling;
- (void)stopWiggling;
- (void)prepareForReuse;

@end



@interface ReorderableFlowLayout : UICollectionViewFlowLayout

@end
