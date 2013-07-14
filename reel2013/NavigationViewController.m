//
//  NavigationViewController.m
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav-bar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[ColorHelper greenColor],UITextAttributeTextShadowColor:[ColorHelper colorWithHex:@"ede63c"],UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetMake(0, 1)]}];
    [[UINavigationBar appearance] setTintColor:[ColorHelper greenColor]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIImage *arrow = [UIImage imageNamed:@"back"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAdjustsImageWhenHighlighted:NO];
    [button setImage:arrow forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 86/2, 88/2)];
    [button addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [viewController.navigationItem setLeftBarButtonItem:buttonItem];
    viewController.navigationItem.hidesBackButton = YES;
    [super pushViewController:viewController animated:animated];
}

- (void)backButtonClicked {
    [self popViewControllerAnimated:YES];
}

@end
