//
//  SAViewController.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAViewController.h"

@implementation SAViewController

#pragma mark - 
#pragma mark - class method
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
        [self.tableView registerClass:[SAScrollTableViewCell class] forCellReuseIdentifier:@"Cell"];

    }

    return self;
}


#pragma mark - UITableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const cellIdentifier = @"Cell";
    SAScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[SAScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

    }

    /**
     *  set cell delegate to get events of selected media
     */
    cell.delegate = self;

    /**
     *  returned a array of SAMediaObject objects that holds all information about a media file.
     */
    [cell setMedia:@[
                     [SAMediaObject mediaWithType:SAMediaTypeVideoAsset
                                           object:[[NSBundle mainBundle] URLForResource:@"sample1" withExtension:@"mov"]],
                     [SAMediaObject mediaWithType:SAMediaTypeImage title:@"Title" object:@"sample1.jpg"],
                     [SAMediaObject mediaWithType:SAMediaTypeImage title:@"Title" object:@"sample2.jpg"],
                     [SAMediaObject mediaWithType:SAMediaTypeImage title:@"Title" object:@"sample3.jpg"]
                     ]];

    return cell;
}


#pragma mark - SAScrollTableViewCellDelegate
- (void)scrollTableViewCell:(SAScrollTableViewCell *)scrollTableViewCell didSelectMediaAtIndexPath:(NSIndexPath *)indexPath atRow:(NSInteger)row {
    NSLog(@"cell media: %@, %@", indexPath, @(row));

}


@end
