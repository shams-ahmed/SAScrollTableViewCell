//
//  SAMediaObject.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SAMediaType) {
    SAMediaTypeImage,
    SAMediaTypeRawImage,
    SAMediaTypeVideoAsset,
    SAMediaTypeOther
};

@interface SAMediaObject : NSObject

@property (nonatomic) SAMediaType type;
@property (nonatomic) Class mediaClass;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) id object;

+ (id)mediaWithType:(SAMediaType)type title:(NSString *)title object:(id)object;


@end
