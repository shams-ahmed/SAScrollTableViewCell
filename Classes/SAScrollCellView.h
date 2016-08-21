//
//  SAScrollCellView.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

@import UIKit;

@class SAScrollCellView;

@protocol SAScrollViewDelegate <NSObject>

- (void)collectionView:(SAScrollCellView * __nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * __nonnull)indexPath;

@end

@interface SAScrollCellView : UIView

@property (weak, nonatomic, nullable) id<SAScrollViewDelegate> delegate;
@property (strong, nonatomic, nonnull) UICollectionView *collectionView;

- (void)setTitleTextColor:(UIColor * __nonnull)textColor withBackgroundColor:(UIColor * __nonnull)bgColor;
- (void)setData:(NSArray * __nonnull)collectionImageData;

@end
