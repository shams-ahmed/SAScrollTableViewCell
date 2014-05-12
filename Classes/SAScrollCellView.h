//
//  SAScrollCellView.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SAScrollCellView;

@protocol SAScrollViewDelegate <NSObject>

- (void)collectionView:(SAScrollCellView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface SAScrollCellView : UIView

@property (weak, nonatomic) id<SAScrollViewDelegate> delegate;
@property (strong, nonatomic) UICollectionView *collectionView;

- (void)setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor;
- (void)setData:(NSArray *)collectionImageData;
- (void)setBackgroundColor:(UIColor *)color;


@end
