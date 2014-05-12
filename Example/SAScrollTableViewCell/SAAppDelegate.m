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
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[SAViewController alloc] initWithStyle:UITableViewStylePlain];
    
    [self.window makeKeyWindow];
    [self.window makeKeyAndVisible];

    return YES;
}


@end
