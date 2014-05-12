//
//  SAMediaObject.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Modified by Passerbied on 11/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAScrollMedia.h"

@implementation SAScrollMedia

#pragma mark -
#pragma mark - class method
+ (id)mediaWithType:(SAScrollMediaType)type object:(id)object {
    SAScrollMedia *mediaObject = [[SAScrollMedia alloc] init];
    mediaObject.type = type;
    mediaObject.object = object;

    return mediaObject;
}

+ (id)mediaWithType:(SAScrollMediaType)type title:(NSString *)title object:(id)object {
    SAScrollMedia *mediaObject = [[SAScrollMedia alloc] init];
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
        case SAScrollMediaTypeImageName:
        case SAScrollMediaTypeImageObject:
            type = @"image";
            break;
        case SAScrollMediaTypeRawImage:
            type = @"raw image";
            break;
        case SAScrollMediaTypeVideoAsset:
            type = @"video url";
            break;
        case SAScrollMediaTypeImageURL:
            type = @"image url";
            break;
        case SAScrollMediaTypeOther:
            if (self.mediaClass) {
                type = NSStringFromClass(self.mediaClass);
            } else {
                type = @"unknown";
            }

            break;
        default:
            break;
    }

    return [NSString stringWithFormat:@"Title:%@, Type:%@, Object:%@", self.title, type, [self.object class]];
}


@end
