//
//  SAMediaObject.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAMediaObject.h"

@implementation SAMediaObject

#pragma mark -
#pragma mark - class method
+ (id)mediaWithType:(SAMediaType)type object:(id)object {
    SAMediaObject *mediaObject = [[SAMediaObject alloc] init];
    mediaObject.type = type;
    mediaObject.object = object;

    return mediaObject;

}

+ (id)mediaWithType:(SAMediaType)type title:(NSString *)title object:(id)object {
    SAMediaObject *mediaObject = [[SAMediaObject alloc] init];
    mediaObject.type = type;
    mediaObject.title = title;
    mediaObject.object = object;

    return mediaObject;
}

- (id)init {
    self = [super init];
    if (self) {

    }

    return self;
}

- (NSString *)description {
    NSString *type;

    switch (self.type) {
        case SAMediaTypeImage:
            type = @"image";
            break;
        case SAMediaTypeRawImage:
            type = @"raw image";
            break;
        case SAMediaTypeVideoAsset:
            type = @"video url";
            break;
        case SAMediaTypeOther:
            if (self.mediaClass) {
                type = NSStringFromClass(self.mediaClass);
            } else {
                type = @"unknown";
            }

            break;
        default:
            break;
    }

    return [NSString stringWithFormat:@"title:%@, type:%@, object:%@", self.title, type, [self.object class]];
}


@end
