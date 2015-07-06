//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//


typedef NS_ENUM(NSUInteger, Cell___FILEBASENAME___Type)
{
	Cell___FILEBASENAME___Type1,
};


@protocol ___FILEBASENAMEASIDENTIFIER___ViewDelegate;


@interface ___FILEBASENAMEASIDENTIFIER___View : UIView
	@property(nonatomic, weak) id<___FILEBASENAMEASIDENTIFIER___ViewDelegate> delegate;

- (void)dismissKeyboard;
@end


@protocol ___FILEBASENAMEASIDENTIFIER___ViewDelegate <NSObject>

@end
