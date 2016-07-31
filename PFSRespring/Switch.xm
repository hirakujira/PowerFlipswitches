#import "../FSSwitchDataSource.h"
#import "../FSSwitchPanel.h"
#import <notify.h>

@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
- (void)reboot;
- (void)powerDown;
@end

@interface FBSystemApp : NSObject
+ (id)sharedApplication;
- (void)sendActionsToBackboard:(NSSet *)actions;
@end

@interface BKSRestartAction : NSObject
+ (id)actionWithOptions:(NSInteger)options;
@end

@interface PFSRespring : NSObject <FSSwitchDataSource, UIAlertViewDelegate>
@end

@implementation PFSRespring
- (void)applyActionForSwitchIdentifier:(NSString *)switchIdentifier {
    [[[[UIAlertView alloc] initWithTitle:nil message:@"Confirm Respring" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil] autorelease] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        SpringBoard *sb = (SpringBoard *)[%c(SpringBoard) sharedApplication];
        if ([sb respondsToSelector:@selector(relaunchSpringBoard)]) {
            [sb _relaunchSpringBoardNow];
        }
    	else {
        	[(FBSystemApp *)[objc_getClass("FBSystemApp") sharedApplication] sendActionsToBackboard:[NSSet setWithObject:[objc_getClass("BKSRestartAction") actionWithOptions:1]]];
    	}	
    }
}
@end
