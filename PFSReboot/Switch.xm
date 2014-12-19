#import "../FSSwitchDataSource.h"
#import "../FSSwitchPanel.h"
#import <notify.h>

@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
- (void)reboot;
- (void)powerDown;
@end

@interface PFSReboot : NSObject <FSSwitchDataSource, UIAlertViewDelegate>
@end

@implementation PFSReboot
- (void)applyActionForSwitchIdentifier:(NSString *)switchIdentifier {
    [[[[UIAlertView alloc] initWithTitle:nil message:@"Confirm Reboot" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil] autorelease] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex])
        [(SpringBoard *)[%c(SpringBoard) sharedApplication] reboot];
}
@end
