//
//  SAViewController.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAViewController.h"

@interface SAViewController ()

@end

@implementation SAViewController

#pragma mark - 
#pragma mark - class method
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[SAScrollTableViewCell class] forCellReuseIdentifier:@"Cell"];

    }

    return self;
}


#pragma mark - UITableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
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


#pragma mark - SAScrollTableViewCellDelegate
- (void)scrollTableViewCell:(SAScrollTableViewCell *)scrollTableViewCell didSelectMediaAtIndexPath:(NSIndexPath *)indexPath atRow:(NSInteger)Row {
    NSLog(@"cell media: %@", indexPath);

}


@end
