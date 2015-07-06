//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___View.h"

@interface ___FILEBASENAMEASIDENTIFIER___View ()<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate>
	@property(nonatomic, strong) UITableView* tableView;
@end


@implementation ___FILEBASENAMEASIDENTIFIER___View

- (id)init
{
    self = [super init];
    if (self)
	{
	
		// Table view
		
		self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 20)];
		
		self.tableView.delegate = self;
		self.tableView.dataSource = self;
		self.tableView.backgroundColor = [UIColor clearColor];
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		self.tableView.alwaysBounceVertical = NO;
		
		[self addSubview: self.tableView];
		
		
		// Gesture recognizer
		
		UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self
																							   action: @selector(dismissKeyboard)];
		tapGestureRecognizer.delegate = self;
		tapGestureRecognizer.cancelsTouchesInView = NO;
		
		[self.tableView addGestureRecognizer: tapGestureRecognizer];
    }
    return self;
}


- (void)dismissKeyboard
{
	[self endEditing: YES];
	
	[UIView animateWithDuration: animationDuration
					 animations: ^{
						 self.tableView.contentInset = UIEdgeInsetsZero;
					 }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView: (UITableView*)tableView
 numberOfRowsInSection: (NSInteger)section
{
	return <#numberOfRowsInSection#>;
}

- (UITableViewCell*)tableView: (UITableView *)tableView
		cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
	NSString* reuseIdentifier = [NSString stringWithFormat: @"%d_%d", indexPath.section, indexPath.row];
	
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: reuseIdentifier];
	if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
									  reuseIdentifier: reuseIdentifier];
		
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		switch (indexPath.row)
		{
			case Cell___FILEBASENAME___Type1:
			{
			}
				break;
				
			default:
			{
			}
				break;
		}
	}
	
	
	// Update
	
	switch (indexPath.row)
	{
		case Cell___FILEBASENAME___Type1:
		{
		}
			break;
			
		default:
		{
		}
			break;
	}
	
	return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)   tableView: (UITableView*)tableView
heightForRowAtIndexPath: (NSIndexPath*)indexPath
{
	switch (indexPath.row)
	{
		case Cell___FILEBASENAME___Type1:
		{
		}
			break;
			
		default:
		{
			return 44;
		}
			break;
	}
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
	[self.tableView scrollToRowAtIndexPath: [NSIndexPath indexPathForRow: textField.tag
															   inSection: 0]
						  atScrollPosition: UITableViewScrollPositionMiddle
								  animated: YES];
	
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	
	return YES;
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
	
	return YES;
}

@end
