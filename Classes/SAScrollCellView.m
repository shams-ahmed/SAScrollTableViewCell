//
//  SAScrollCellView.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Modified by Passerbied on 11/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAScrollCellView.h"
#import "SAImageCollectionViewCell.h"
#import "SAMediaCollectionViewCell.h"
#import "SAScrollMedia.h"

static NSString *SACellImageIdentify = @"SAImageCollectionCell";
static NSString *SACellMediaIdentify = @"SAMediaCollectionCell";

@interface  SAScrollCellView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic, nonnull) NSArray *mediaContainer;
@property (strong, nonatomic) UIColor *textBackgroundColor;
@property (strong, nonatomic) UIColor *textColor;

@end

@implementation SAScrollCellView

#pragma mark -
#pragma mark - Init

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
    [self setup];
}

#pragma mark -
#pragma mark - Setup

- (void)setup {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(100.0, 110.0);
    flowLayout.sectionInset = UIEdgeInsetsMake(5,
                                               10,
                                               5,
                                               10);
    flowLayout.minimumLineSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[SAImageCollectionViewCell class] forCellWithReuseIdentifier:SACellImageIdentify];
    [self.collectionView registerClass:[SAMediaCollectionViewCell class] forCellWithReuseIdentifier:SACellMediaIdentify];
    
    [self addSubview:self.collectionView];

}

#pragma mark -
#pragma mark - Styles & Media

- (void)setData:(NSArray *)collectionImageData {
    self.mediaContainer = collectionImageData;
    [self.collectionView reloadData];

}

- (void)setBackgroundColor:(UIColor *)color {
    self.collectionView.backgroundColor = color;
}

#pragma mark -
#pragma mark - Override

- (void)setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor{
    self.textColor = textColor;
    self.textBackgroundColor = bgColor;
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mediaContainer.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SAScrollMedia *mediaObject = self.mediaContainer[indexPath.row];

    SAImageCollectionViewCell *cell = (SAImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:SACellImageIdentify
                                                                                                             forIndexPath:indexPath];
    if (!cell) {
        cell = [[SAImageCollectionViewCell alloc] init];
    }

    switch (mediaObject.type) {
        case SAScrollMediaTypeImageName:
            [cell setTitleTextColor:self.textColor withBackgroundColor:self.textBackgroundColor];
            [cell setTitle:mediaObject.title];

            [cell setImage:[UIImage imageNamed:mediaObject.object]];

            break;
        case SAScrollMediaTypeImageObject:
            [cell setTitleTextColor:self.textColor withBackgroundColor:self.textBackgroundColor];
            [cell setTitle:mediaObject.title];

            [cell setImage:mediaObject.object];

            break;
        case SAScrollMediaTypeRawImage:
            [cell setTitleTextColor:self.textColor withBackgroundColor:self.textBackgroundColor];
            [cell setTitle:mediaObject.title];

            [cell setImage:[UIImage imageWithData:mediaObject.object]];

            break;
        case SAScrollMediaTypeVideoAsset: {
            SAMediaCollectionViewCell *mediaCell = (SAMediaCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:SACellMediaIdentify
                                                                                                                          forIndexPath:indexPath];

            if (!mediaCell) {
                mediaCell = [[SAMediaCollectionViewCell alloc] init];
                
            }

            [mediaCell setMedia:mediaObject.object];

            return mediaCell;
        }
        case SAScrollMediaTypeImageURL:
            [cell setTitleTextColor:self.textColor withBackgroundColor:self.textBackgroundColor];
            [cell setTitle:mediaObject.title];
            
            [cell setImageWithURL:mediaObject.object];
            
            break;
        case SAScrollMediaTypeOther:
            // Unimplemented
            break;
        default:
            break;
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([[collectionView cellForItemAtIndexPath:indexPath] isMemberOfClass:[SAMediaCollectionViewCell class]]) {
        SAMediaCollectionViewCell *mediaCell = (SAMediaCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [mediaCell playStop];
    }
    
    [self.delegate collectionView:self didSelectItemAtIndexPath:indexPath];
}

@end
