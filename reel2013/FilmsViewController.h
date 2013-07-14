//
//  FilmsViewController.h
//  reel2013
//
//  Created by Luiz Gustavo Faria on 26/03/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>

@interface FilmsViewController : UITableViewController <UIActionSheetDelegate,ABPeoplePickerNavigationControllerDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@end
