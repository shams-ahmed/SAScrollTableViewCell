//
//  SAImageCollectionViewCell.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface SAImageCollectionViewCell ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleView;

@end

@implementation SAImageCollectionViewCell

#pragma mark -
#pragma mark - Class Method
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
        
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


#pragma mark - Setup
- (void)setup {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0,
                                                                   0.0,
                                                                   CGRectGetWidth(self.frame),
                                                                   CGRectGetHeight(self.frame))];
    
    self.titleView = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                               CGRectGetHeight(self.imageView.frame)-30,
                                                               CGRectGetWidth(self.frame),
                                                               20)];
    
    self.titleView.userInteractionEnabled = NO;
    self.titleView.textColor = [UIColor whiteColor];
    self.titleView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.3];
    self.titleView.adjustsFontSizeToFitWidth = YES;
    self.titleView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    self.titleView.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleView];
    
}


#pragma mark - Styles & Media
- (void)setImage:(UIImage *)image {
    self.imageView.image = image;

}

- (void)setImageWithURL:(NSURL *)url {
    [self.imageView sd_setImageWithURL:url];
    
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
    self.titleView.text = title;

}


@end
