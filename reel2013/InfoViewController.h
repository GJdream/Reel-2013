//
//  InfoViewController.h
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface InfoViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)linkDoDiego:(id)sender;
- (IBAction)meuLink:(id)sender;
- (IBAction)linkDoFB:(id)sender;
- (IBAction)linkDoTwitter:(id)sender;
- (IBAction)linkDoSitio:(id)sender;
- (IBAction)linkDoRialto:(id)sender;
- (IBAction)linkDoParamount:(id)sender;

@end
