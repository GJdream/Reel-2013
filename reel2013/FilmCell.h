//
//  FilmCell.h
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;

@end
