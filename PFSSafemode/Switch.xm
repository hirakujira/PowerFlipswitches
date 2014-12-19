#import "../FSSwitchDataSource.h"
#import "../FSSwitchPanel.h"
#import <notify.h>

@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
- (void)reboot;
- (void)powerDown;
@end

@interface PFSSafemode : NSObject <FSSwitchDataSource, UIAlertViewDelegate>
@end

@implementation PFSSafemode
- (void)applyActionForSwitchIdentifier:(NSString *)switchIdentifier {
    [[[[UIAlertView alloc] initWithTitle:nil message:@"Confirm Safe Mode" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil] autorelease] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex])
        [(SpringBoard *)[%c(SpringBoard) sharedApplication] performSelector:@selector(enterSafeMode) withObject:nil afterDelay:0.0];
}
@end
