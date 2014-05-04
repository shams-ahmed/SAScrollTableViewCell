//
//  SAScrollTableViewCell.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAMediaObject.h"

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
- (void)scrollTableViewCell:(SAScrollTableViewCell *)scrollTableViewCell didSelectMediaAtIndexPath:(NSIndexPath *)indexPath atRow:(NSInteger)Row;

@end

@interface SAScrollTableViewCell : UITableViewCell

@property (weak, nonatomic) id<SAScrollTableViewCellDelegate> delegate;

/**
 *  Set all media object i.e images, video etc..
 *
 *  @param media array of SAMediaObject's
 */
- (void)setMedia:(NSArray *)media;

/**
 *  background color of cell
 *
 *  @param color uicolor object, always default to white
 */
- (void)setBackgroundColor:(UIColor *)color;

/**
 *  title color and background
 *
 *  @param textColor text color, default is white
 *  @param bgColor   text background color, default is dark grey
 */
- (void)setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor;


@end