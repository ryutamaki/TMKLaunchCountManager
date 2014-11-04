//
//  TMExampleViewViewController.m
//  TMLaunchCountManager
//
//  Created by ryutamaki on 2014/02/11.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import "TMKExampleViewViewController.h"

#import "TMKLaunchCountManager.h"

@interface TMKExampleViewViewController ()

@property (nonatomic) UILabel *currentVersionLabel;
@property (nonatomic) UILabel *launchCountForCurrentVersionLabel;
@property (nonatomic) UILabel *isFirstLaunchForCurrentVersionLabel;
@property (nonatomic) UILabel *versionsLabel;

@end

@implementation TMKExampleViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [[UILabel appearance] setTextColor:[UIColor blackColor]];
        [[UILabel appearance] setTextAlignment:NSTextAlignmentCenter];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    _currentVersionLabel = [[UILabel alloc] init];
    [self.view addSubview:_currentVersionLabel];
    
    _launchCountForCurrentVersionLabel = [[UILabel alloc] init];
    [self.view addSubview:_launchCountForCurrentVersionLabel];
    
    _isFirstLaunchForCurrentVersionLabel = [[UILabel alloc] init];
    [self.view addSubview:_isFirstLaunchForCurrentVersionLabel];
    
    _versionsLabel = [[UILabel alloc] init];
    _versionsLabel.numberOfLines = 0;
    [self.view addSubview:_versionsLabel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    TMKLaunchCountManager *manager = [TMKLaunchCountManager sharedManager];
    _currentVersionLabel.text = [NSString stringWithFormat:@"Current Version : %@", [manager currentVersion]];
    _launchCountForCurrentVersionLabel.text = [NSString stringWithFormat:@"Launch Count : %lu", (unsigned long)[manager launchCountForCurrentVersion]];
    _isFirstLaunchForCurrentVersionLabel.text = [NSString stringWithFormat:@"Is first time : %lu", (unsigned long)[manager isFirstLaunchForCurrentVersion]];
    _versionsLabel.text = [NSString stringWithFormat:@"versions : %@", [manager versions]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGSize frameSize = self.view.frame.size;
    
    [_currentVersionLabel sizeToFit];
    [_currentVersionLabel setFrame:CGRectMake(0.0f, frameSize.height * 1.0f/10.0f, frameSize.width, _currentVersionLabel.frame.size.height)];
    
    [_launchCountForCurrentVersionLabel sizeToFit];
    [_launchCountForCurrentVersionLabel setFrame:CGRectMake(0.0f, frameSize.height * 2.0f/10.0f, frameSize.width, _launchCountForCurrentVersionLabel.frame.size.height)];
    
    [_isFirstLaunchForCurrentVersionLabel sizeToFit];
    [_isFirstLaunchForCurrentVersionLabel setFrame:CGRectMake(0.0f, frameSize.height * 3.0f/10.0f, frameSize.width, _isFirstLaunchForCurrentVersionLabel.frame.size.height)];
    
    [_versionsLabel sizeToFit];
    [_versionsLabel setFrame:CGRectMake(0.0f, frameSize.height * 4.0f/10.0f, frameSize.width, _versionsLabel.frame.size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
