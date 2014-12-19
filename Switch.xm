#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#import <notify.h>
NSString *path = @"/var/mobile/Library/Preferences/tw.hiraku.linenolastseen.toggle.plist";
static NSString * const kSwitchKey = @"Enable";

@interface LINE_NoLastSeen_FlipSwitch : NSObject <FSSwitchDataSource>
@end

@implementation LINE_NoLastSeen_FlipSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    id enable = [dict objectForKey:kSwitchKey];
    BOOL isEnabled = enable ? [enable boolValue] : YES;
    return isEnabled ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSMutableDictionary *mutableDict = dict ? [[dict mutableCopy] autorelease] : [NSMutableDictionary dictionary];
    switch (newState) {
        case FSSwitchStateIndeterminate:
            return;
        case FSSwitchStateOn:
            [mutableDict setValue:@YES forKey:kSwitchKey];
            break;
        case FSSwitchStateOff:
            [mutableDict setValue:@NO forKey:kSwitchKey];
            break;
    }
    [mutableDict writeToFile:path atomically:YES];
    // system("killall LINE");
}

@end
