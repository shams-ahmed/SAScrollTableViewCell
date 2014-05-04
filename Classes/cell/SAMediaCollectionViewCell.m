//
//  SAMediaCollectionViewCell.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 04/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAMediaCollectionViewCell.h"

static CGFloat padding = 5.0;
static CGFloat iconSize = 35.0;

@interface SAMediaCollectionViewCell ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property (nonatomic, strong) UIImageView *controls;

@end

@implementation SAMediaCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.moviePlayerController = [[MPMoviePlayerController alloc] init];
        self.moviePlayerController.shouldAutoplay = NO;
        self.moviePlayerController.controlStyle = MPMovieControlStyleNone;
        self.moviePlayerController.allowsAirPlay = NO;
        self.moviePlayerController.view.frame = CGRectMake(0.0,
                                                           0.0,
                                                           CGRectGetWidth(frame),
                                                           CGRectGetHeight(frame));

        self.controls = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) - (iconSize + padding),
                                                                     CGRectGetHeight(frame) - (iconSize + padding),
                                                                     iconSize,
                                                                     iconSize)];

        [self.controls setImage:[UIImage imageNamed:@"SAPlayControl"]];
        [self.moviePlayerController.view addSubview:self.controls];

    }

    return self;
}

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
