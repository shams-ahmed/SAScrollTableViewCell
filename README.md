# SAScrollTableViewCell

[![Version](http://cocoapod-badges.herokuapp.com/v/SAScrollTableViewCell/badge.png)](http://cocoadocs.org/docsets/SAScrollTableViewCell)
[![Platform](http://cocoapod-badges.herokuapp.com/p/SAScrollTableViewCell/badge.png)](http://cocoadocs.org/docsets/SAScrollTableViewCell)

## Purpose

An easy-to-use UITableViewCell subclass that implements a scrolling effect cell with media content such as images, video sound etc...  

##### Let's see a tableview examole 

![Screenshot:](Assets/exmple.gif)

## Usage

To run the example project; clone the repo and open example project

## How to use?

import class `#import "SAScrollTableViewCell.h"` and add its delegate `SAScrollTableViewCellDelegate`.

Register class inside init or viewDidLoad method `[self.tableView registerClass:[SAScrollTableViewCell class] forCellReuseIdentifier:@"Cell"];`. Set height of cell to 140 in heightForRowAtIndexPath. 


```objc
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const cellIdentifier = @"Cell";
    SAScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[SAScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

    }

    cell.delegate = self;

    [cell setMedia:@[
                     [SAMediaObject mediaWithType:SAMediaTypeVideoAsset
                                            title:@"title"
                                           object:[[NSBundle mainBundle] URLForResource:@"sample1" withExtension:@"mov"]],
                     [SAMediaObject mediaWithType:SAMediaTypeImage title:@"title" object:@"sample1.jpg"],
                     [SAMediaObject mediaWithType:SAMediaTypeImage title:@"title" object:@"sample2.jpg"],
                     [SAMediaObject mediaWithType:SAMediaTypeImage title:@"title" object:@"sample3.jpg"]
                     ]];

    return cell;
}
```

### Adding media content:
`SAScrollTableViewCell` expects `SAMediaObject` which holds each media content such as images, video and sound. Use factory method to create object `mediaWithType:(SAMediaType)type title:(NSString *)title object:(id)object;`. At present only four media type are supported use the keys below:

    `SAMediaTypeImage` takes the name of a image,
    `SAMediaTypeRawImage` take NSData of a image,
    `SAMediaTypeVideoAsset` takes url of video such as from the web or a asset file,
    `SAMediaTypeOther` custom solution for subclassing




## Requirements
iOS 7,
Portait only supported

## Installation

SAScrollTableViewCell is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "SAScrollTableViewCell"

## Author

shams ahmed, shamsahmed@me.com

## License

SAScrollTableViewCell is available under the MIT license. See the LICENSE file for more info.

