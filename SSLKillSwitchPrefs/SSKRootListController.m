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

@end
