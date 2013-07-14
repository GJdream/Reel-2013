//
//  FilmsViewController.m
//  reel2013
//
//  Created by Luiz Gustavo Faria on 26/03/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import "FilmsViewController.h"
#import "FilmList.h"
#import "SingleFilmViewController.h"
#import "UIImageView+AFNetworking.h"
#import "FilmCell.h"

@interface FilmsViewController ()

@property NSArray *films;
@property NSArray *documentaries;
@property UIActionSheet *shareSheet;

@end

@implementation FilmsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //info button
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoButton setFrame:CGRectMake(0, 0, 84/2, 88/2)];
    [infoButton setImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [infoButton setAdjustsImageWhenHighlighted:NO];
    [infoButton addTarget:self action:@selector(didPressInfoButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    self.navigationItem.leftBarButtonItem = barItem;
    
    //share button
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setFrame:CGRectMake(0, 0, 84/2, 88/2)];
    [shareButton setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [shareButton setAdjustsImageWhenHighlighted:NO];
    [shareButton addTarget:self action:@selector(didPressShareButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareBarItem = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    self.navigationItem.rightBarButtonItem = shareBarItem;
    
    //films arrays
    _films = [FilmList films];
    _documentaries = [FilmList documentaries];
    //tableview background
    UIImageView *tableViewBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [tableViewBG setContentMode:UIViewContentModeScaleToFill];
    [self.tableView setBackgroundView:tableViewBG];
}

-(void)didPressInfoButton:(id)sender {
    [self performSegueWithIdentifier:@"InfoSegue" sender:self];
}

-(void)didPressShareButton:(id)sender {
    _shareSheet = [[UIActionSheet alloc] initWithTitle:@"Share this app with your friends via SMS or Email" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose from my contacts", nil];
    [_shareSheet showFromBarButtonItem:self.navigationItem.rightBarButtonItem animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:section == 0 ? @"features" : @"documentaries"]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 41;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FilmCell";
    FilmCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *film = indexPath.section == 0 ? _films[indexPath.row] : _documentaries[indexPath.row];
    cell.filmImageView.image = film[@"Image"];
    cell.filmTitleLabel.text = film[@"Title"];
    cell.filmTitleLabel.textColor = [ColorHelper greenColor];
    return cell;
}

#pragma mark - Table view delegate

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"InfoSegue"]) return;
    SingleFilmViewController *vc = segue.destinationViewController;
    if (self.tableView.indexPathForSelectedRow.section == 0) {
        vc.film = _films[self.tableView.indexPathForSelectedRow.row];
    } else {
        vc.film = _documentaries[self.tableView.indexPathForSelectedRow.row];
    }
}



/** SHARE BUTTON **/


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        BOOL canSendEmail = [MFMailComposeViewController canSendMail];
        
#if TARGET_IPHONE_SIMULATOR
        BOOL canSendText = NO; // simulator doesn't support texting
#else
        BOOL canSendText = [MFMessageComposeViewController canSendText];
#endif
        
        if (! canSendEmail && ! canSendText) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Your email doesn't seem to be active for this device. Please check your settings." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
            return;
        }
        
        ABPeoplePickerNavigationController *vc = [[ABPeoplePickerNavigationController alloc] init];
        vc.peoplePickerDelegate = self;
        
        // only display the supported sending options
        
        NSMutableArray *array = [NSMutableArray array];
        
        if (canSendEmail) {
            [array addObject:@(kABPersonEmailProperty)];
        }
        
        if (canSendText) {
            [array addObject:@(kABPersonPhoneProperty)];
        }
        
        vc.displayedProperties = [array mutableCopy];
        
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void) peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
	[self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL) peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	return YES;
}

- (BOOL) peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    // get the selected email or phone number
    CFTypeRef typeRef = ABRecordCopyValue(person, property);
    CFIndex index = ABMultiValueGetIndexForIdentifier(typeRef, identifier);
    NSString *value = (__bridge NSString *)ABMultiValueCopyValueAtIndex(typeRef, index);
    CFRelease(typeRef);
    NSString *firstName = (NSString *)CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    [self dismissViewControllerAnimated:NO completion:^{
        if (property == kABPersonPhoneProperty) {
            MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
            vc.messageComposeDelegate = self;
            vc.recipients = @[value];
            vc.body = @"Hey check out the App for the Reel Brazil 2013 Film Festival on iTunes! itms-apps://itunes.com/apps/pdmsystems/reelbrazil2013";
            [self presentViewController:vc animated:YES completion:nil];
        } else if (property == kABPersonEmailProperty) {
            NSString *message = [NSString stringWithFormat:@"Hey %@,\nCheck out the Reel Brazil 2013 Film Festival app on iTunes! http://itunes.com/apps/pdmsystems/reelbrazil2013", firstName];
            MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
            vc.mailComposeDelegate = self;
            vc.toRecipients = @[value];
            vc.subject = @"Reel Brazil 2013 Film Festival";
            [vc setMessageBody:message isHTML:NO];
            [self presentViewController:vc animated:YES completion:nil];
        }
    }];
    
    return NO;
}



@end
