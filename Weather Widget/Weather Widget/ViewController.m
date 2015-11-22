//
//  ViewController.m
//  Weather Widget
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.activeModules = [[NSMutableArray alloc] init];
    [self.activeModules addObject:[NSNumber numberWithInt:QUARTER_CURRENT_TEMP]];
    [self.activeModules addObject:[NSNumber numberWithInt:HALF_DAY_SUMMARY]];
    [self.activeModules addObject:[NSNumber numberWithInt:FULL_WEEKLY_SUMMARY]];
  }
  return self;
}




- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
    
  self.title = @"Weather Widget";
  self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  UICollectionViewLeftAlignedLayout *flowLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
  flowLayout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
  flowLayout.minimumInteritemSpacing = 0.0;
  flowLayout.minimumLineSpacing = 0.0;
  
  self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
  
  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  
  self.longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
  [self.collectionView addGestureRecognizer:self.longPressGR];
  self.longPressGR.minimumPressDuration = 0.3;
  
  self.collectionView.alwaysBounceVertical = YES;
  self.collectionView.backgroundColor = [UIColor blackColor];
  [self.collectionView registerClass:CollectionViewCell.classForCoder forCellWithReuseIdentifier:@"CollectionViewCell"];
  
  [self.view addSubview:self.collectionView];
}




- (CollectionViewCell*)pickedUpCell {
  NSIndexPath *indexPath = self.movingIndexPath;
  return (CollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
}




- (void)longPressed:(UILongPressGestureRecognizer*)gesture {
  CGPoint location = [gesture locationInView:self.collectionView];
  NSIndexPath *movingIndexPath = [self.collectionView indexPathForItemAtPoint:location];
  
  if (gesture.state == UIGestureRecognizerStateBegan) {
    NSIndexPath *indexPath = movingIndexPath;
    
    [self setEditing:YES animated:YES];
    [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
    [[self pickedUpCell] stopWiggling];
    //[self animatePickingUpCell:[self pickedUpCell]];
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
    //[self animatePuttingDownCell:[self pickedUpCell]];
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
  return self.activeModules.count;
}




- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
  
  NSNumber *cellType = self.activeModules[indexPath.item];
  [cell configureForItem:cellType andIndex:indexPath.item];
  
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
  NSNumber *item = [[NSNumber alloc] init];
  item = [self.activeModules objectAtIndex:sourceIndexPath.item];
  [self.activeModules removeObjectAtIndex:sourceIndexPath.item];
  [self.activeModules insertObject:item atIndex:destinationIndexPath.item];
  
  [CollectionViewModel viewArrayFromActiveModules:self.activeModules];
}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CollectionViewCell *cell = (CollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
  
  if (!cell) {
    if ([self.activeModules[indexPath.item] integerValue] > FULL_START) {
      return CGSizeMake(self.view.frame.size.width, HEIGHT);
    }
    else if ([self.activeModules[indexPath.item] integerValue] > HALF_START) {
      return CGSizeMake(self.view.frame.size.width / 2, HEIGHT);
    }
    else {
      return CGSizeMake(self.view.frame.size.width / 4, HEIGHT);
    }
  }
  else {
    if ([cell.cellType integerValue] > FULL_START) {
      return CGSizeMake(self.view.frame.size.width, HEIGHT);
    }
    else if ([cell.cellType integerValue] > HALF_START) {
      return CGSizeMake(self.view.frame.size.width / 2, HEIGHT);
    }
    else {
      return CGSizeMake(self.view.frame.size.width / 4, HEIGHT);
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
    self.cellType = [[NSNumber alloc] init];
  }
  return self;
}




- (void)configureForItem:(NSNumber*)cellType andIndex:(NSInteger)index {
  self.cellType = cellType;
  long type = [self.cellType integerValue];
  
  switch (type) {
    case QUARTER_CURRENT_TEMP: {
      COQuarterView *currentTemp = [[COQuarterView alloc] initCurrentTempModuleWithFrame:self.frame andTemperature:@"70°"];
      [self.contentView addSubview:currentTemp];
      [currentTemp setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
      break;
    }
    case HALF_DAY_SUMMARY: {
      COHalfView *daySummary = [[COHalfView alloc] initHalfSummaryModuleWithFrame:self.frame andSummary:@"Clear throughout the day"];
      [self.contentView addSubview:daySummary];
      [daySummary setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
      break;
    }
    case FULL_WEEKLY_SUMMARY: {
      COFullView *weekSummary = [[COFullView alloc] initWeeklySummaryModuleWithFrame:self.frame andWeeklySummary:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore."];
      [self.contentView addSubview:weekSummary];
      [weekSummary setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
      break;
    }
  }
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
  wiggle.duration = [self randomInterval:0.13 andVariance:0.020];
  wiggle.repeatCount = INFINITY;
  
  [self.contentView.layer addAnimation:wiggle forKey:@"wiggle"];
  
  NSNumber *bounceHigh = [NSNumber numberWithFloat:2.0];
  NSNumber *bounceLow = [NSNumber numberWithFloat:0.0];
  CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
  bounce.values = [NSArray arrayWithObjects:bounceHigh, bounceLow, nil];
  bounce.autoreverses = YES;
  bounce.duration = [self randomInterval:0.13 andVariance:0.020];
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

