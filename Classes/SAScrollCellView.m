//
//  SAScrollCellView.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAScrollCellView.h"
#import "SAImageCollectionViewCell.h"
#import "SAMediaCollectionViewCell.h"
#import "SAMediaObject.h"

@interface  SAScrollCellView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) SAImageCollectionViewCell *myCollectionViewCell;
@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (strong, nonatomic) NSArray *collectionImageData;
@property (strong, nonatomic) UIColor *imageTilteBackgroundColor;
@property (strong, nonatomic) UIColor *imageTilteTextColor;

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


        self.myCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        self.myCollectionView.delegate = self;
        self.myCollectionView.dataSource = self;
        self.myCollectionView.showsHorizontalScrollIndicator = NO;

        [self.myCollectionView registerClass:[SAImageCollectionViewCell class] forCellWithReuseIdentifier:@"SAImageCollectionCell"];
        [self.myCollectionView registerClass:[SAMediaCollectionViewCell class] forCellWithReuseIdentifier:@"SAMediaCollectionCell"];

        [self addSubview:self.myCollectionView];
    }

    return self;
}

- (void)setData:(NSArray *)collectionImageData {
    _collectionImageData = collectionImageData;
    [_myCollectionView reloadData];

}

- (void)setBackgroundColor:(UIColor*)color {
    self.myCollectionView.backgroundColor = color;
    [_myCollectionView reloadData];
}

- (void)setTitleTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)bgColor{
    _imageTilteTextColor = textColor;
    _imageTilteBackgroundColor = bgColor;

}


#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionImageData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SAMediaObject *mediaObject = self.collectionImageData[indexPath.row];

    static NSString *cellImageIdentify = @"SAImageCollectionCell";
    static NSString *cellMediaIdentify = @"SAMediaCollectionCell";

    SAImageCollectionViewCell *cell = (SAImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellImageIdentify forIndexPath:indexPath];

    if (!cell) {
        cell = [[SAImageCollectionViewCell alloc] init];
    }

    switch (mediaObject.type) {
        case SAMediaTypeImage:
            [cell setTitleTextColor:_imageTilteTextColor withBackgroundColor:_imageTilteBackgroundColor];
            [cell setTitle:mediaObject.title];

            [cell setImage:[UIImage imageNamed:mediaObject.object]];

            break;

        case SAMediaTypeRawImage:
            [cell setTitleTextColor:_imageTilteTextColor withBackgroundColor:_imageTilteBackgroundColor];
            [cell setTitle:mediaObject.title];

            [cell setImage:[UIImage imageWithData:mediaObject.object]];

            break;
        case SAMediaTypeVideoAsset: {
            SAMediaCollectionViewCell *mediaCell = (SAMediaCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellMediaIdentify forIndexPath:indexPath];

            if (!mediaCell) {
                mediaCell = [[SAMediaCollectionViewCell alloc] init];
            }

            [mediaCell setMedia:mediaObject.object];

            return mediaCell;
        }
        case SAMediaTypeOther:
            NSAssert(nil, @"not complete yet...");

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
