//
//  SAScrollTableViewCell.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAScrollTableViewCell.h"
#import "SAScrollCellView.h"

#define kScrollViewHieght 120
#define kStartPointY 15

@interface SAScrollTableViewCell() <SAScrollViewDelegate>

@property (strong, nonatomic) SAScrollCellView *scrollView;

@end

@implementation SAScrollTableViewCell

#pragma mark -
#pragma mark - SAScrollTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initialize];

    }

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];

}

- (void)initialize {
    // Set ScrollImageTableCellView
    self.scrollView = [[SAScrollCellView alloc] initWithFrame:CGRectMake(0,
                                                                        kStartPointY,
                                                                        CGRectGetWidth(self.frame),
                                                                        kScrollViewHieght)];

    self.scrollView.delegate = self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];    

}

- (void)setMedia:(NSArray *)media {
    [self.scrollView setData:media];

}

- (void) setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor {
    [self.scrollView setTitleTextColor:textColor withBackgroundColor:bgColor];

}

- (void)setBackgroundColor:(UIColor *)color {
    if (color) {
        self.scrollView.backgroundColor = color;
    }

    [self.contentView addSubview:self.scrollView];

}


#pragma mark - SAImageScrollViewDelegate
- (void)collectionView:(SAScrollCellView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(scrollTableViewCell:didSelectMediaAtIndexPath:atRow:)]) {
        [self.delegate scrollTableViewCell:self didSelectMediaAtIndexPath:indexPath atRow:self.tag];

    }

}


@end
