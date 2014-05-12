//
//  SAImageCollectionViewCell.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAImageCollectionViewCell : UICollectionViewCell

/**
 *  set image for imageview
 *
 *  @param image image file
 */
- (void)setImage:(UIImage *)image;

/**
 *  set image downloaded from web
 *
 *  @param image url
 */
- (void)setImageWithURL:(NSURL *)url;

/**
 *  add title to image
 *
 *  @param title title string
 */
- (void)setTitle:(NSString *)title;

/**
 *  change text and background color
 *
 *  @param textColor text color
 *  @param bgColor   background color
 */
- (void)setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor;


@end
