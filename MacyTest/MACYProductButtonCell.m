//
//  MACYProductButtonCell.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYProductButtonCell.h"

@implementation MACYProductButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.buttonAction = [UIButton composeButton:@"Delete Product" withBackgroundColor:[UIColor greenColor]];
        [self.contentView addSubview:self.buttonAction];
        
        self.buttonAction.translatesAutoresizingMaskIntoConstraints = NO;
        [self updateConstraints];

    }
    return self;
}

-(void)updateConstraints{
    
    
    [super updateConstraints];
    [self.contentView removeConstraints:self.contentView.constraints];
    
    NSDictionary *constrantsViewsDictionary = @{
                                                @"buttonAction"     : self.buttonAction,
                                                
                                                };
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[buttonAction]-20-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views: constrantsViewsDictionary]];
    
    
    
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[buttonAction]-10-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:constrantsViewsDictionary]];
   }



@end
