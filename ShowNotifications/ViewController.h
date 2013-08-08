//
//  ViewController.h
//  ShowNotifications
//
//  Copyright (c) 2013 Robert Linnemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


-(IBAction)setNotifications:(id)sender;
-(IBAction)cancelNotifications:(id)sender;
-(IBAction)showAllLocalNotifications:(id)sender;
-(void) createLocalNoticationAt: (NSDate *)alertDate withTitle: (NSString *) alertTitle;

@end
