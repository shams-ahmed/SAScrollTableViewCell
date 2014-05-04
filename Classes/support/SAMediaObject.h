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

/**
 *  factory method without a title
 *
 *  @param type   SAMediaType
 *  @param object object such as NSData, NSURL, bundle file name
 *
 *  @return self
 */
+ (id)mediaWithType:(SAMediaType)type object:(id)object;

/**
 *  factory method with title
 *
 *  @param type   SAMediaType
 *  @param title  title of image
 *  @param object object such as NSData, NSURL, bundle file name
 *
 *  @return self
 */
+ (id)mediaWithType:(SAMediaType)type title:(NSString *)title object:(id)object;


@end
