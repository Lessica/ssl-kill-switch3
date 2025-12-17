#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>

@interface SSKRootListController : PSListController
@end

@implementation SSKRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

- (void)support {
    NSURL *url = [NSURL URLWithString:@"https://havoc.app/search/82Flex"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
}

@end
