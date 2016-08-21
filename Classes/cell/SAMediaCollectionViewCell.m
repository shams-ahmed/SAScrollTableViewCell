//
//  SAMediaCollectionViewCell.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 04/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

@import AVKit;

#import "SAMediaCollectionViewCell.h"

static CGFloat padding = 5.0;
static CGFloat iconSize = 35.0;

@interface SAMediaCollectionViewCell ()

@property (nonatomic, strong, nonnull) MPMoviePlayerController *moviePlayerController;
@property (nonatomic, strong, nonnull) AVPlayer *moviePlayerController1;
@property (nonatomic, strong, nonnull) UIImageView *controls;

@end

@implementation SAMediaCollectionViewCell

#pragma mark - 
#pragma mark - Class Method

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
   
    if (self) {
        [self setup];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark - Setup

- (void)setup {
    self.moviePlayerController = [[MPMoviePlayerController alloc] init];
    self.moviePlayerController.shouldAutoplay = NO;
    self.moviePlayerController.controlStyle = MPMovieControlStyleNone;
    self.moviePlayerController.allowsAirPlay = NO;
    self.moviePlayerController.view.frame = CGRectMake(0.0,
                                                       0.0,
                                                       CGRectGetWidth(self.frame),
                                                       CGRectGetHeight(self.frame));
    
    self.controls = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - (iconSize + padding),
                                                                  CGRectGetHeight(self.frame) - (iconSize + padding),
                                                                  iconSize,
                                                                  iconSize)];
    
    [self.controls setImage:[UIImage imageNamed:@"SAPlayControl"]];
    [self.moviePlayerController.view addSubview:self.controls];
}

#pragma mark -
#pragma mark - Media

- (void)setMedia:(NSURL *)url {
    self.moviePlayerController.contentURL = url;

    [self.contentView addSubview:self.moviePlayerController.view];
}

- (void)playStop {
    if (self.moviePlayerController.playbackState == MPMoviePlaybackStateStopped) {
        [self.moviePlayerController play];
        [self.controls setHidden:YES];
    } else if (self.moviePlayerController.playbackState == MPMoviePlaybackStatePlaying) {
        [self.moviePlayerController stop];
        [self.controls setHidden:NO];
    }
}

@end
