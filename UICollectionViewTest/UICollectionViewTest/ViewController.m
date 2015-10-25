//
//  ViewController.m
//  UICollectionViewTest
//
//  Created by Chase McCoy on 10/18/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

@implementation CollectionViewCell : UICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.textColor = [UIColor whiteColor];
    
    NSArray *subviews = [[NSArray alloc] initWithObjects:self.imageView, self.nameLabel, nil];
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:subviews];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.spacing = 10.0;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:self.stackView];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:85.0]];
    
    NSArray *objects = [[NSArray alloc] initWithObjects:self.stackView, nil];
    NSArray *keys = [[NSArray alloc] initWithObjects:@"stackView", nil];
    NSDictionary *views = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"|[stackView]|" options:NSLayoutFormatAlignmentMask metrics:nil views:views];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[stackView]|" options:NSLayoutFormatAlignmentMask metrics:nil views:views];
    
    for (int x = 0; x < constraint1.count; x++) {
      [self.contentView addConstraint:constraint1[x]];
    }
    
    for (int x = 0; x < constraint2.count; x++) {
      [self.contentView addConstraint:constraint2[x]];
    }
  }
  return self;
}

- (void)configureForPerson:(NSString*)person andIndex:(NSInteger)index {
  self.nameLabel.text = person;
  self.imageView.image = [UIImage imageNamed:person];
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






@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.items = [[NSMutableArray alloc] init];
    [self.items addObject:@"sam-carter"];
    [self.items addObject:@"dana-scully"];
    [self.items addObject:@"rose-tyler"];
    [self.items addObject:@"sarah-connor"];
    [self.items addObject:@"starbuck"];
    [self.items addObject:@"river-tam"];
    [self.items addObject:@"sarah-jane"];
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"UICollectionView Test";
  self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  ReorderableFlowLayout *flowLayout = [[ReorderableFlowLayout alloc] init];
  flowLayout.sectionInset = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0);
  flowLayout.minimumInteritemSpacing = 20.0;
  flowLayout.minimumLineSpacing = 20.0;
  flowLayout.itemSize = CGSizeMake(85.0, 100.0);
  
  self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];

  self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
  
  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  
  self.longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
  [self.collectionView addGestureRecognizer:self.longPressGR];
  self.longPressGR.minimumPressDuration = 0.3;
  
  self.collectionView.alwaysBounceVertical = YES;
  self.collectionView.backgroundColor = [UIColor blueColor];
  [self.collectionView registerClass:CollectionViewCell.classForCoder forCellWithReuseIdentifier:@"CollectionViewCell"];
  
  [self.view addSubview:self.collectionView];
  
  NSArray *objects = [[NSArray alloc] initWithObjects:self.collectionView, nil];
  NSArray *keys = [[NSArray alloc] initWithObjects:@"collectionView", nil];
  NSDictionary *views = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
  
  NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"|[collectionView]|" options:NSLayoutFormatAlignmentMask metrics:nil views:views];
  
  NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[collectionView]|" options:NSLayoutFormatAlignmentMask metrics:nil views:views];
  
  for (int x = 0; x < constraint1.count; x++) {
    [self.view addConstraint:constraint1[x]];
  }
  
  for (int x = 0; x < constraint2.count; x++) {
    [self.view addConstraint:constraint2[x]];
  }
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
  
  NSString *person = self.items[indexPath.item];
  [cell configureForPerson:person andIndex:indexPath.item];
  
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


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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


