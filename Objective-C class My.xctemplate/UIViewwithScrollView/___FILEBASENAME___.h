//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

@protocol ___FILEBASENAMEASIDENTIFIER___Delegate;


@interface ___FILEBASENAMEASIDENTIFIER___ : ___VARIABLE_cocoaTouchSubclass___
	@property(nonatomic, weak) id<___FILEBASENAMEASIDENTIFIER___Delegate> delegate;

- (void)dismissKeyboard;

@end


@protocol ___FILEBASENAMEASIDENTIFIER___Delegate <NSObject>

@end
