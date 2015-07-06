//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"


@implementation ___FILEBASENAMEASIDENTIFIER___

+ (___FILEBASENAMEASIDENTIFIER___*)operation
{
	return [___FILEBASENAMEASIDENTIFIER___ new];
}


#pragma mark - Operation

- (void) build
{
	[super build];
	
	
	// Set URL
	//
	self.url = [NSURL URLWithString: [NSString stringWithFormat: @"%@/<#url#>", ServerBaseURL]];
	
	
	// Set body
	//
	NSMutableDictionary* body = [NSMutableDictionary dictionary];
	
	body[@"<#key#>"] = <#object#>;
	
	self.body = body;
	

	// Set request & response types
	//
	self.requestMethod    = RequestMethodPost;
	self.requestDataType  = DataTypeJSON;
	self.responseDataType = DataTypeJSON;
}


- (Error*) processData: (NSDictionary*) data
{
	BOOL success = [[data objectForKey: @"success"] boolValue];
	
	if (!success)
	{
		return [Error logicErrorWithDictionary: data];
	}
	
	return nil;
}

@end
