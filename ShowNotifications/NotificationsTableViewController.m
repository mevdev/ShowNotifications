//
//  NotificationsTableViewController.m
//
//  Copyright (c) 2013 Robert Linnemann. All rights reserved.//

#import "NotificationsTableViewController.h"

@interface NotificationsTableViewController ()

@end

@implementation NotificationsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = YES;
    notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of notifications
//    return //[[[UIApplication sharedApplication] scheduledLocalNotifications] count];
    return [notificationArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Get list of local notifications
//    NSArray *notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    UILocalNotification *notif = [notificationArray objectAtIndex:indexPath.row];
    
    // Display notification info
    [cell.textLabel setText:notif.alertBody];
    
    NSDateFormatter *theFormatter = [[NSDateFormatter alloc] init];
    [theFormatter setDateFormat:@"hh:mma MM/dd/yy"];
    [cell.detailTextLabel setText:[theFormatter stringFromDate:notif.fireDate]];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:NO];
}

@end
