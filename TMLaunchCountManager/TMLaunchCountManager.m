//
//  TMLaunchCountManager.m
//  TMLaunchCountManager
//
//  Created by ryutamaki on 2014/02/11.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import "TMLaunchCountManager.h"

static NSString *const VERSIONS = @"versions";

@interface TMLaunchCountManager ()

@property (nonatomic) NSUserDefaults *defaults;

@end

@implementation TMLaunchCountManager

static TMLaunchCountManager *sharedManager;
+ (TMLaunchCountManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[TMLaunchCountManager alloc] init];
    });
    return sharedManager;
}

+ (void)launch
{
    TMLaunchCountManager *manager = [TMLaunchCountManager sharedManager];
    [manager launch];
}

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        _defaults = [NSUserDefaults standardUserDefaults];
        _versions = [_defaults arrayForKey:VERSIONS].count ? [[_defaults arrayForKey:VERSIONS] mutableCopy] : [NSMutableArray array];
    }
    return self;
}


- (void)launch
{
    NSString *currentVersion = [self currentVersion];

//    first, count up
    NSInteger count = [self.defaults integerForKey:currentVersion];
    [self.defaults setInteger:++count forKey:currentVersion];
//    second, check is first time
    if ([self isFirstLaunchForCurrentVersion]) {
        [self.versions addObject:currentVersion];
        [self.defaults setObject:self.versions forKey:VERSIONS];
    }
    
//    last, you should synchronize
    [self.defaults synchronize];
}

#pragma mark -
- (BOOL)isFirstLaunchForCurrentVersion
{
    return [self isFirstLaunchForVersion:[self currentVersion]];
}

- (BOOL)isFirstLaunchForVersion:(NSString *)version
{
    if ([self launchCountForVersion:version] == 1) {
        return YES;
    } else {
        return NO;
    }
}


- (NSInteger)launchCountForCurrentVersion
{
    return [self launchCountForVersion:[self currentVersion]];
}

- (NSInteger)launchCountForVersion:(NSString *)version
{
    return [self.defaults integerForKey:version];
}

- (NSString *)currentVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
