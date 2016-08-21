//
//  SAScrollTableViewCell.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

@import UIKit;

#import "SAScrollCellView.h"
#import "SAScrollMedia.h"

@class SAScrollTableViewCell;

@protocol SAScrollTableViewCellDelegate <NSObject>

@optional

/**
 *  get selected information of a media
 *
 *  @param scrollTableViewCell self
 *  @param indexPath           postion of media which got selected
 *  @param Row                 table row
 */
- (void)scrollTableViewCell:(SAScrollTableViewCell * __nonnull)scrollTableViewCell didSelectMediaAtIndexPath:(NSIndexPath * __nonnull)indexPath atRow:(NSInteger)row;

@end

@interface SAScrollTableViewCell : UITableViewCell

/**
 *  media cell delegate
 */
@property (weak, nonatomic, nullable) id<SAScrollTableViewCellDelegate> delegate;

/**
 *  collection view used in cell
 */
@property (strong, nonatomic, nonnull) SAScrollCellView *scrollView;

/**
 *  Set all media object i.e images, video etc..
 *
 *  @param media array of SAMediaObject's
 */
- (void)setMedia:(NSArray * __nonnull)media;

/**
 *  background color of cell
 *
 *  @param color UIColor object, always default to white
 */
- (void)setScrollBackgroundColor:(UIColor * __nonnull)color;

/**
 *  title color and background
 *
 *  @param textColor text color, default is white
 *  @param bgColor   text background color, default is dark grey
 */
- (void)setTitleTextColor:(UIColor * __nonnull)textColor withBackgroundColor:(UIColor *__nonnull)bgColor;

@end
