//
//  SAMediaObject.h
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Modified by Passerbied on 11/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  list of supported media
 */
typedef NS_ENUM(NSUInteger, SAScrollMediaType) {
    /**
     *  UIImage object
     */
    SAScrollMediaTypeImageObject,
    /**
     *  name of image within main bundle i.e sample1.png
     */
    SAScrollMediaTypeImageName,
    /**
     *  NSData representation of image
     */
    SAScrollMediaTypeRawImage,
    /**
     *  NSURL link of video
     */
    SAScrollMediaTypeVideoAsset,
    /**
     *  NSURL link of image on the web i.e http://lorempixel.com/250/250/
     */
    SAScrollMediaTypeImageURL,
    /**
     *  for subclassing
     */
    SAScrollMediaTypeOther
};

@interface SAScrollMedia : NSObject

@property (nonatomic) SAScrollMediaType type;
@property (nonatomic) Class mediaClass;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) id object;

/**
 *  factory method without a title
 *
 *  @param type   SAMediaType
 *  @param object object such as NSData, NSURL etc...
 *
 *  @return self
 */
+ (id)mediaWithType:(SAScrollMediaType)type object:(id)object;

/**
 *  factory method with title
 *
 *  @param type   SAMediaType
 *  @param title  title of image
 *  @param object object such as NSData, NSURL etc...
 *
 *  @return self
 */
+ (id)mediaWithType:(SAScrollMediaType)type title:(NSString *)title object:(id)object;


@end
