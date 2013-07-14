//
//  SingleFilmViewController.m
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import "SingleFilmViewController.h"
#import "LocationCell.h"
#import "SessionCell.h"

@interface SingleFilmViewController ()

@property NSArray *sessions;
@property UITapGestureRecognizer *dismissPopupGesture;

@end

@implementation SingleFilmViewController

#define isIphone5 [UIApplication sharedApplication].keyWindow.frame.size.height == 568

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _film[@"Title"];
    _filmImageView.image = _film[@"Image"];
    _descriptionLabel.text = _film[@"Description"] ;
    _descriptionLabel.textColor = [ColorHelper colorWithHex:@"343434"];
    [_descriptionLabel sizeToFit];
    _scrollView.contentSize = CGSizeMake(320, _descriptionLabel.frame.size.height + _descriptionLabel.frame.origin.y + 20);
    _scrollView.backgroundColor = [ColorHelper colorWithHex:@"f0f0f0"];
    _scrollView.delegate = self;
    _infoLabel.text = [_film[@"Info"] uppercaseString];
    _sessions = _film[@"Sessions"];
    _sessionsPopup.hidden = YES;
    _sessionsPopup.alpha = 0;
    _dismissPopupGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didPressSessionTimesButton:)];
    _directorLabel.text = _film[@"Director"];
    _originalTitleLabel.text = [NSString stringWithFormat:@"\"%@\"",_film[@"PtTitle"]];
}

-(void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.5 animations:^{
        [_scrollView setContentOffset:CGPointMake(0, 38)];
    }];
}

- (IBAction)didPressSessionTimesButton:(id)sender {
    if (_sessionsPopup.hidden) {
        _sessionsPopup.hidden = NO;
        [_scrollView addGestureRecognizer:_dismissPopupGesture];
        [UIView animateWithDuration:0.2 animations:^{
            _sessionsPopup.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.4 animations:^{
                [_sessionsTableView setContentOffset:CGPointMake(0,80)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.6 animations:^{
                    [_sessionsTableView setContentOffset:CGPointMake(0,0) animated:YES];
                }];
            }];
        }];
        CGFloat offset = isIphone5 ? 60 : 120;
        if (_scrollView.contentOffset.y < offset) {
            [_scrollView setContentOffset:CGPointMake(0, offset) animated:YES];
        }
    } else {
        [_scrollView removeGestureRecognizer:_dismissPopupGesture];
        [UIView animateWithDuration:0.2 animations:^{
            _sessionsPopup.alpha = 0;
        } completion:^(BOOL finished) {
            _sessionsPopup.hidden = YES;
        }];
    }
}

- (IBAction)didPressTrailerButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_film[@"Trailer"]]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sessions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *session = _sessions[indexPath.row];
    if ([session isEqualToString:@"AUCKLAND"] || [session isEqualToString:@"WELLINGTON"]) {
        LocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
        cell.locationLabel.text = session;
        return cell;
    }
    if ([session isEqualToString:@"Separator"]) {
        return [tableView dequeueReusableCellWithIdentifier:@"SeparatorCell"];
    }
    SessionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SessionCell"];
    cell.sessionLabel.text = session;
    return cell;
}

@end
