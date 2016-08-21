//
//  SAMediaCollectionViewCell.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 04/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

@import UIKit;
@import MediaPlayer;

@interface SAMediaCollectionViewCell : UICollectionViewCell

/**
 *  sets the url for movie player
 *
 *  @param url url address such as asset or file
 */
- (void)setMedia:(NSURL * __nonnull)url;

/**
 *  stops or paly movie depending on player status
 */
- (void)playStop;

@end
