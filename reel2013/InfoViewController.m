//
//  InfoViewController.m
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [ColorHelper colorWithHex:@"f0f0f0"];
    _scrollView.contentSize = CGSizeMake(320, 760);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)linkDoDiego:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.diego-maia.com"]];
}

- (IBAction)meuLink:(id)sender {
    MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
    vc.mailComposeDelegate = self;
    vc.toRecipients = @[@"lgfaria@gmail.com"];
    vc.subject = @"Reel Brazil 2013 app";
    [vc.navigationBar setTintColor:[ColorHelper greenColor]];
    [vc.navigationItem.rightBarButtonItem setTintColor:[ColorHelper greenColor]];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)linkDoFB:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/149668661734477"]];
}

- (IBAction)linkDoTwitter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/ReelBrazil"]];
}

- (IBAction)linkDoSitio:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reelbrazil.co.nz"]];
}

- (IBAction)linkDoRialto:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.rialto.co.nz"]];
}

- (IBAction)linkDoParamount:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.paramount.co.nz"]];
}
@end
