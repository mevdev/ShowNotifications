//
//  ViewController.m
//  ShowNotifications
//
//  Copyright (c) 2013 Robert Linnemann. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)setNotifications:(id)sender
{
    //We'll make 3 notifications 1,2 & 3 minutes from now.
    [self createLocalNoticationAt:[[NSDate date] dateByAddingTimeInterval:60] withTitle:@"Every Minute 1!"];
    [self createLocalNoticationAt:[[NSDate date] dateByAddingTimeInterval:120] withTitle:@"Every Minute 2!"];
    [self createLocalNoticationAt:[[NSDate date] dateByAddingTimeInterval:180] withTitle:@"Every Minute 3!"];
}

-(IBAction)cancelNotifications:(id)sender {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

-(IBAction)showAllLocalNotifications:(id)sender{
    [self performSegueWithIdentifier:@"notificationsSegue" sender:self];
}



-(void) createLocalNoticationAt: (NSDate *)alertDate withTitle: (NSString *) alertTitle {
	UILocalNotification *localNotification = [[UILocalNotification alloc]init];
	// create a calendar
	localNotification.fireDate = alertDate;
	localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = alertTitle;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
	localNotification.applicationIconBadgeNumber++;
	[[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
}

@end
