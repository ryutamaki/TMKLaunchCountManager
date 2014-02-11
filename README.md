TMLaunchCountManager
====================

For iOS. Count launch number. Use NSUserDefaults.

## Usage

## How to use
You call this wherever you want to count up launch count.

	[TMLaunchCountManager launch];
	
## What can you do?
1. Previous versions you have launched.

		NSLog(@"%@", [[TMLaunchCountManager sharedManager] versions]);
2. Launch count for any versions you have launched.
	- Configure version number

			TMLaunchCountManager *manager = [TMLaunchCountManager sharedManager];
			NSString *firstVersion = [manager.versions firstObject];
			NSLog(@"%ld", (long)[manager launchCountForVersion:firstVersion]);

	- Use current version
	
			TMLaunchCountManager *manager = [TMLaunchCountManager sharedManager];
			NSLog(@"%ld", (long)[managerlaunchCountForCurrentVersion]);

3. Check is first time to lanch

		TMLaunchCountManager *manager = [TMLaunchCountManager sharedManager];
		NSLog(@"%d", [manager isFirstLaunchForCurrentVersion]);
	