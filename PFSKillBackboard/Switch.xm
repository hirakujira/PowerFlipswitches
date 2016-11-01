#import "../FSSwitchDataSource.h"
#import "../FSSwitchPanel.h"
#import <notify.h>

@interface PFSKillBackboard : NSObject <FSSwitchDataSource, UIAlertViewDelegate>
@end

@implementation PFSKillBackboard
- (void)applyActionForSwitchIdentifier:(NSString *)switchIdentifier {
    system("killall backboardd");
}
@end
