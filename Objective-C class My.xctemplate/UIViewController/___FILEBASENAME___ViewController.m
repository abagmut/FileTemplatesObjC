//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___ViewController.h"

#import "___FILEBASENAME___View.h"


@interface ___FILEBASENAMEASIDENTIFIER___ViewController ()<___FILEBASENAME___ViewDelegate>
	@property(nonatomic, strong) ___FILEBASENAMEASIDENTIFIER___View* view;
@end


@implementation ___FILEBASENAMEASIDENTIFIER___ViewController
@dynamic view;

- (void)loadView
{
	self.view = [___FILEBASENAME___View new];
	
	self.view.delegate = self;
}


#pragma mark - ___FILEBASENAME___ViewDelegate



@end
