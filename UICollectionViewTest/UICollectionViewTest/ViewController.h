//
//  ViewController.h
//  UICollectionViewTest
//
//  Created by Chase McCoy on 10/18/15.
//  Copyright © 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGR;
@property (strong, nonatomic) NSIndexPath *movingIndexPath;
@property (strong, nonatomic) NSMutableArray *items;

@end



@interface ReorderableFlowLayout : UICollectionViewFlowLayout

@end


@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView* imageView;
@property (strong, nonatomic) UILabel* nameLabel;
@property (strong, nonatomic) UIStackView* stackView;
@property (strong, nonatomic) NSLayoutConstraint* imageViewHeightConstraint;

@end

