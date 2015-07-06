//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"


@implementation ___FILEBASENAMEASIDENTIFIER___

+ (instancetype)shared___FILEBASENAMEASIDENTIFIER___
{
	static ___FILEBASENAMEASIDENTIFIER___* instance = nil;
	
	static dispatch_once_t predicate;
	dispatch_once(&predicate, ^{
		instance = [[self alloc] init];
	});
	return instance;
}

@end
