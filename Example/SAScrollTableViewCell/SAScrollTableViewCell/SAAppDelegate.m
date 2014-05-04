//
//  SAAppDelegate.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAAppDelegate.h"
#import "SAViewController.h"

@implementation SAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = [[SAViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.window makeKeyAndVisible];
    [self.window makeKeyWindow];

    return YES;
}


@end
