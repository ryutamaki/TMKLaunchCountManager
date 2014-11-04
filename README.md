TMKLaunchCountManager
====================

For iOS. Count launch number. Use NSUserDefaults.

## Usage

## How to use
You call this wherever you want to count up launch count.

	[TMKLaunchCountManager launch];
	
## What can you do?
1. Previous versions you have launched.

		NSLog(@"%@", [[TMKLaunchCountManager sharedManager] versions]);
2. Launch count for any versions you have launched.
	-Configure version number

			TMKLaunchCountManager *manager = [TMKLaunchCountManager sharedManager];
			NSString *firstVersion = [manager.versions firstObject];
			NSLog(@"%ld", (long)[manager launchCountForVersion:firstVersion]);

	-Use current version
	
			TMKLaunchCountManager *manager = [TMKLaunchCountManager sharedManager];
			NSLog(@"%ld", (long)[managerlaunchCountForCurrentVersion]);

3. Check is first time to lanch

		TMKLaunchCountManager *manager = [TMKLaunchCountManager sharedManager];
		NSLog(@"%d", [manager isFirstLaunchForCurrentVersion]);
	
