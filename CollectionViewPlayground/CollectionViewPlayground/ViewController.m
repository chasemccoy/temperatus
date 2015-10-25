//
//  ViewController.m
//  CollectionViewPlayground
//
//  Created by Chase McCoy on 10/19/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.items = [[NSMutableArray alloc] init];
    [self.items addObject:@"red"];
    [self.items addObject:@"purple"];
    [self.items addObject:@"orange"];
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"UICollectionView Test";
  self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  UICollectionViewLeftAlignedLayout *flowLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
  flowLayout.sectionInset = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0);
  flowLayout.minimumInteritemSpacing = 0.0;
  flowLayout.minimumLineSpacing = 0.0;
  //flowLayout.itemSize = CGSizeMake(100, 100.0);
  
  self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
  
  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  
  self.longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
  [self.collectionView addGestureRecognizer:self.longPressGR];
  self.longPressGR.minimumPressDuration = 0.3;
  
  self.collectionView.alwaysBounceVertical = YES;
  self.collectionView.backgroundColor = [UIColor blueColor];
  [self.collectionView registerClass:CollectionViewCell.classForCoder forCellWithReuseIdentifier:@"CollectionViewCell"];
  
  [self.view addSubview:self.collectionView];
}

- (CollectionViewCell*)pickedUpCell {
  NSIndexPath *indexPath = self.movingIndexPath;
  
  return (CollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
}

- (void)animatePickingUpCell:(CollectionViewCell*)cell {
  [UIView animateWithDuration:0.1
                        delay:0.0
                      options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                   animations:^{
                     cell.alpha = 0.7;
                     cell.transform = CGAffineTransformMakeScale(1.3, 1.3);
                   }
                   completion:nil];
}

- (void)animatePuttingDownCell:(CollectionViewCell*)cell {
  [UIView animateWithDuration:0.1
                        delay:0.0
                      options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                   animations:^{
                     cell.alpha = 1.0;
                     cell.transform = CGAffineTransformIdentity;
                   }
                   completion:^(BOOL finished) {
                     [cell startWiggling];
                   }];
}


- (void)longPressed:(UILongPressGestureRecognizer*)gesture {
  CGPoint location = [gesture locationInView:self.collectionView];
  NSIndexPath *movingIndexPath = [self.collectionView indexPathForItemAtPoint:location];
  
  if (gesture.state == UIGestureRecognizerStateBegan) {
    NSIndexPath *indexPath = movingIndexPath;
    
    [self setEditing:YES animated:YES];
    [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
    [[self pickedUpCell] stopWiggling];
    [self animatePickingUpCell:[self pickedUpCell]];
  }
  else if (gesture.state == UIGestureRecognizerStateChanged) {
    [self.collectionView updateInteractiveMovementTargetPosition:location];
  }
  else {
    if (gesture.state == UIGestureRecognizerStateEnded) {
      [self.collectionView endInteractiveMovement];
    }
    else {
      [self.collectionView cancelInteractiveMovement];
    }
    [self animatePuttingDownCell:[self pickedUpCell]];
    movingIndexPath = nil;
  }
}

- (void)startWigglingAllVisibleCells {
  NSArray *cells = [self.collectionView visibleCells];
  
  for (int x = 0; x < cells.count; x++) {
    if (self.editing) {
      [cells[x] startWiggling];
    }
    else {
      [cells[x] stopWiggling];
    }
  }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
  [super setEditing:editing animated:YES];
  [self startWigglingAllVisibleCells];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.items.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
  
  NSString *imageName = self.items[indexPath.item];
  [cell configureForItem:imageName andIndex:indexPath.item];
  
  if (self.editing) {
    [cell startWiggling];
  }
  else {
    [cell stopWiggling];
  }
  
  if (indexPath == self.movingIndexPath) {
    cell.alpha = 0.7;
    cell.transform = CGAffineTransformMakeScale(1.3, 1.3);
  }
  else {
    cell.alpha = 1.0;
    cell.transform = CGAffineTransformIdentity;
  }
  
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
  NSString *item = [[NSString alloc] initWithString:[self.items objectAtIndex:sourceIndexPath.item]];
  [self.items removeObjectAtIndex:sourceIndexPath.item];
  [self.items insertObject:item atIndex:destinationIndexPath.item];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CollectionViewCell *cell = (CollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
  
  if (!cell) {
    if ([self.items[indexPath.item] isEqualToString:@"red"]) {
      return CGSizeMake(self.view.frame.size.width / 2, 100);
    }
    else if ([self.items[indexPath.item] isEqualToString:@"orange"]) {
      return CGSizeMake(self.view.frame.size.width, 100);
    }
    else {
      return CGSizeMake(self.view.frame.size.width / 4, 100);
    }
  }
  else {
    if ([cell.name isEqualToString:@"red"]) {
      return CGSizeMake(self.view.frame.size.width / 2, 100);
    }
    else if ([cell.name isEqualToString:@"orange"]) {
      return CGSizeMake(self.view.frame.size.width, 100);
    }
    else {
      return CGSizeMake(self.view.frame.size.width / 4, 100);
    }
  }
}



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end



//******************************************
// COLLECTION VIEW CELL
//******************************************

@implementation CollectionViewCell : UICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    self.name = [[NSString alloc] init];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self.contentView addSubview:self.imageView];
  }
  return self;
}

- (void)configureForItem:(NSString*)imageName andIndex:(NSInteger)index {
  self.name = imageName;
  self.imageView.image = [UIImage imageNamed:imageName];
}

- (NSTimeInterval)randomInterval:(NSTimeInterval)interval andVariance:(double)variance {
  return interval + variance * (arc4random_uniform(1000) - 500.0) / 500.0;
}

- (void)startWiggling {
  NSNumber* angle = [NSNumber numberWithFloat:0.02];
  NSNumber* negativeAngle = [NSNumber numberWithFloat:-0.02];
  CAKeyframeAnimation *wiggle = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
  wiggle.values = [NSArray arrayWithObjects:negativeAngle, angle, nil];
  wiggle.autoreverses = YES;
  wiggle.duration = [self randomInterval:0.1 andVariance:0.025];
  wiggle.repeatCount = INFINITY;
  
  [self.contentView.layer addAnimation:wiggle forKey:@"wiggle"];
  
  NSNumber *bounceHigh = [NSNumber numberWithFloat:2.0];
  NSNumber *bounceLow = [NSNumber numberWithFloat:0.0];
  CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
  bounce.values = [NSArray arrayWithObjects:bounceHigh, bounceLow, nil];
  bounce.autoreverses = YES;
  bounce.duration = [self randomInterval:0.12 andVariance:0.025];
  bounce.repeatCount = INFINITY;
  
  [self.contentView.layer addAnimation:bounce forKey:@"bounce"];
}

- (void)stopWiggling {
  [self.contentView.layer removeAllAnimations];
}

- (void)prepareForReuse {
  [super prepareForReuse];
  [self stopWiggling];
}

@end











@implementation ReorderableFlowLayout

- (UICollectionViewLayoutAttributes*)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath*)indexPath withTargetPosition:(CGPoint)position {
  UICollectionViewLayoutAttributes* attributes = [super layoutAttributesForInteractivelyMovingItemAtIndexPath:indexPath withTargetPosition:position];
  attributes.alpha = 0.7;
  attributes.transform = CGAffineTransformMakeScale(1.3, 1.3);
  return attributes;
}

@end

