//
//  SAImageCollectionViewCell.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

@import UIKit;

@interface SAImageCollectionViewCell : UICollectionViewCell

/**
 *  set image for imageview
 *
 *  @param image image file
 */
- (void)setImage:(UIImage * __nonnull)image;

/**
 *  set image downloaded from web
 *
 *  @param image url
 */
- (void)setImageWithURL:(NSURL * __nonnull)url;

/**
 *  add title to image
 *
 *  @param title title string
 */
- (void)setTitle:(NSString * __nonnull)title;

/**
 *  change text and background color
 *
 *  @param textColor text color
 *  @param bgColor   background color
 */
- (void)setTitleTextColor:(UIColor * __nonnull)textColor withBackgroundColor:(UIColor * __nonnull)bgColor;

@end
