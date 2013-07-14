//
//  SingleFilmViewController.h
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleFilmViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UIWebViewDelegate>

@property NSDictionary *film;
@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
- (IBAction)didPressSessionTimesButton:(id)sender;
- (IBAction)didPressTrailerButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIView *sessionsPopup;
@property (weak, nonatomic) IBOutlet UILabel *originalTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UITableView *sessionsTableView;
@property (weak, nonatomic) IBOutlet UIWebView *trailerWebView;

@end
