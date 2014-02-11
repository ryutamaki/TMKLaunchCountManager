//
//  TMLaunchCountManager.h
//  TMLaunchCountManager
//
//  Created by ryutamaki on 2014/02/11.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMLaunchCountManager : NSObject

@property (nonatomic) NSMutableArray *versions;


+ (TMLaunchCountManager *)sharedManager;
+ (void)launch;


- (void)launch;

- (BOOL)isFirstLaunchForCurrentVersion;
- (BOOL)isFirstLaunchForVersion:(NSString *)version;

// 1 is the first time to launch, not 0.
- (NSInteger)launchCountForCurrentVersion;
- (NSInteger)launchCountForVersion:(NSString *)version;


// Check CFBundleShortVersionString for version number.
- (NSString *)currentVersion;


@end
