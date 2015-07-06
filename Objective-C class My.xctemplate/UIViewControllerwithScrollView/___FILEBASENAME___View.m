//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___View.h"


static int shiftY = 120;


@interface ___FILEBASENAMEASIDENTIFIER___View ()<UIGestureRecognizerDelegate, UITextFieldDelegate>
	@property(nonatomic, strong) UIScrollView* scrollView;

	@property(nonatomic, assign) NSInteger lastScrollViewElementPosition;
@end


@implementation ___FILEBASENAMEASIDENTIFIER___View

- (id)init
{
    self = [super init];
    if (self)
	{
		// Scroll view
		//
		self.scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20 - 44)];
		
		self.scrollView.alwaysBounceVertical = NO;
		
		[self addSubview: self.scrollView];
		
		
		//
		
		self.scrollView.contentSize = CGSizeMake(self.scrollView.width, self.lastScrollViewElementPosition);
		
		
		// Gesture recognizer
		//
		UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self
																							   action: @selector(dismissKeyboard)];
		tapGestureRecognizer.delegate = self;
		tapGestureRecognizer.cancelsTouchesInView = NO;
		
		[self.scrollView addGestureRecognizer: tapGestureRecognizer];
    }
    return self;
}


- (void)dismissKeyboard
{
	[self endEditing: YES];
	
	[UIView animateWithDuration: animationDuration
					 animations: ^{
						 self.scrollView.contentSize = CGSizeMake(screenWidth(), self.lastScrollViewElementPosition);
					 }];
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer: (UIGestureRecognizer*)gestureRecognizer
	   shouldReceiveTouch: (UITouch*)touch
{
	if ([touch.view isKindOfClass: [UIButton class]])
	{
		return NO;
	}
	
	return YES;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing: (UITextField*)textField
{
	self.scrollView.contentSize = CGSizeMake(screenWidth(), self.lastScrollViewElementPosition + 216);
	
	[UIView animateWithDuration: animationDuration
					 animations: ^{
						 self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, textField.y + self.scrollView.y - screenHeight()/2 + shiftY);
					 }];
	
	return YES;
}

- (BOOL)textFieldShouldReturn: (UITextField*)textField
{
	
	return YES;
}

@end
