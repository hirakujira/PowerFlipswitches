#import "../FSSwitchDataSource.h"
#import "../FSSwitchPanel.h"
#import <notify.h>

@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
- (void)reboot;
- (void)powerDown;
@end

@interface PFSRespring : NSObject <FSSwitchDataSource, UIAlertViewDelegate>
@end

@implementation PFSRespring
- (void)applyActionForSwitchIdentifier:(NSString *)switchIdentifier {
    [[[[UIAlertView alloc] initWithTitle:nil message:@"Confirm Respring" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil] autorelease] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex])
        [(SpringBoard *)[%c(SpringBoard) sharedApplication] _relaunchSpringBoardNow];
}
@end
