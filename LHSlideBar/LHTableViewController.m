//
//  LHTableViewController.m
//  LHSlideBar
//
//  Created by James Barrow on 12/07/2013.
//  Copyright (c) 2013 Pig on a Hill. All rights reserved.
//

#import "LHTableViewController.h"
#import "LHSlideBarController.h"

@implementation LHTableViewController

- (id)initWithStyle:(UITableViewStyle)style withController:(LHSlideBarController *)controller
{
    self = [super initWithStyle:style];
    if (self)
    {
        _slideBarController = controller;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_slideBarViewControllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    [[cell imageView] setImage:nil];
    [[cell textLabel] setText:nil];
    [[cell detailTextLabel] setText:nil];
    
    switch ([indexPath section])
    {
        case 0:
        {
            __weak UIViewController *viewController = [_slideBarViewControllers objectAtIndex:[indexPath row]];
            [[cell textLabel] setText:[viewController title]];
            
            break;
        }
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath section])
    {
        case 0:
        {
            [_slideBarController pushViewControllerAtIndex:[indexPath row] animated:YES];
            [[self tableView] deselectRowAtIndexPath:indexPath animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end