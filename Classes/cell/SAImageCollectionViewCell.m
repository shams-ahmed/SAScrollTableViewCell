//
//  SAImageCollectionViewCell.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAImageCollectionViewCell.h"

@interface SAImageCollectionViewCell ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UITextView *titleView;

@end

@implementation SAImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0,
                                                                       0.0,
                                                                       CGRectGetWidth(frame),
                                                                       CGRectGetHeight(frame))];

        self.titleView = [[UITextView alloc] initWithFrame:CGRectMake(0.0,
                                                                      CGRectGetHeight(self.imageView.frame)-30,
                                                                      CGRectGetWidth(frame),
                                                                      20)];

        self.titleView.userInteractionEnabled = NO;
        self.titleView.textColor = [UIColor whiteColor];
        self.titleView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.3];

    }

    return self;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;

}

- (void)setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor {
    if (textColor) {
        self.titleView.textColor = textColor;
    }

    if (bgColor) {
        self.titleView.backgroundColor = bgColor;
    }

}

- (void)setTitle:(NSString *)title {
//    if ([self.contentView subviews]){
//        for (UILabel *subview in [self.contentView subviews]) {
//            [subview removeFromSuperview];
//        }
//    }

    [self.contentView addSubview:self.imageView];

    self.titleView.text = title;
    [self.contentView addSubview:self.titleView];
    
}


@end
