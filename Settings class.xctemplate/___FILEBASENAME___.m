//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"


@interface ___FILEBASENAMEASIDENTIFIER___()

//! Standard user defaults
@property (nonatomic, assign) NSUserDefaults* userDefaults;

@end


@implementation ___FILEBASENAMEASIDENTIFIER___

static ___FILEBASENAMEASIDENTIFIER___* sharedInstance = nil;


+ (___FILEBASENAMEASIDENTIFIER___*)shared___FILEBASENAMEASIDENTIFIER___
{
	if (sharedInstance == nil)
	{
		sharedInstance = [[___FILEBASENAMEASIDENTIFIER___ alloc] init];
	}
	return sharedInstance;
}

- (id) init
{
	if ((self = [super init]))
	{
		self.userDefaults = [NSUserDefaults standardUserDefaults];
	}
	
	return self;
}


#pragma mark - Internal

- (id) objectForKey: (NSString*) key
{
	return [self.userDefaults objectForKey: key];
}


- (NSInteger) integerForKey: (NSString*) key
{
    return [self.userDefaults integerForKey: key];
}


- (double) doubleForKey: (NSString*) key
{
    return [self.userDefaults doubleForKey: key];
}


- (BOOL) boolForKey: (NSString*) key
{
    return [self.userDefaults boolForKey: key];
}


- (void) setObject: (id) object
            forKey: (id) key
{
	[self.userDefaults setObject: object forKey: key];
	[self.userDefaults synchronize];
}


- (void) setInteger: (NSInteger) value
             forKey: (id)        key
{
    [self.userDefaults setInteger: value forKey: key];
    [self.userDefaults synchronize];
}

- (void) setDouble: (double) value
            forKey: (id)     key
{
    [self.userDefaults setDouble: value forKey: key];
    [self.userDefaults synchronize];
}


- (void) setBool: (BOOL) value
          forKey: (id)   key
{
    [self.userDefaults setBool: value forKey: key];
    [self.userDefaults synchronize];
}


#pragma mark - Getters




#pragma mark - Setters



@end
