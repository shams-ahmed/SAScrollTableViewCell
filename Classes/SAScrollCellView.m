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

@interface  SAScrollCellView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *mediaContainer;
@property (strong, nonatomic) UIColor *textBackgroundColor;
@property (strong, nonatomic) UIColor *textColor;

@end

@implementation SAScrollCellView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
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

        [self.collectionView registerClass:[SAImageCollectionViewCell class] forCellWithReuseIdentifier:@"SAImageCollectionCell"];
        [self.collectionView registerClass:[SAMediaCollectionViewCell class] forCellWithReuseIdentifier:@"SAMediaCollectionCell"];

        [self addSubview:self.collectionView];

    }

    return self;
}

- (void)setData:(NSArray *)collectionImageData {
    self.mediaContainer = collectionImageData;
    [self.collectionView reloadData];

}

- (void)setBackgroundColor:(UIColor*)color {
    self.collectionView.backgroundColor = color;

}

- (void)setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor{
    self.textColor = textColor;
    self.textBackgroundColor = bgColor;

}


#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mediaContainer.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SAScrollMedia *mediaObject = self.mediaContainer[indexPath.row];

    static NSString *cellImageIdentify = @"SAImageCollectionCell";
    static NSString *cellMediaIdentify = @"SAMediaCollectionCell";

    SAImageCollectionViewCell *cell = (SAImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellImageIdentify forIndexPath:indexPath];

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
            SAMediaCollectionViewCell *mediaCell = (SAMediaCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellMediaIdentify forIndexPath:indexPath];

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
            NSAssert(nil, @"not complete yet..., for subclassing");

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
