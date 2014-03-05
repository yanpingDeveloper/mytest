//
//  MACYProductDetailHeader.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYProductDetailHeader.h"

@implementation MACYProductDetailHeader


- (id)initWithFrame:(CGRect)frame Title:(NSString *)title andSubTitle:(NSString *)subTitle{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.title = [UILabel composeLabel:title isTitle:YES];
        [self addSubview:self.title];
        
        
        self.subTitle = [UILabel composeLabel:subTitle isTitle:NO];
        [self addSubview:self.subTitle];
        
        
        self.title.translatesAutoresizingMaskIntoConstraints = NO;
        self.subTitle.translatesAutoresizingMaskIntoConstraints = NO;
       
        [self updateConstraints];
        

        
    }
    return self;

    
}
-(void)updateConstraints{
    [super updateConstraints];
    [self removeConstraints:self.constraints];

    NSDictionary *constrantsViewsDictionary = @{
                                            @"title"     : self.title,
                                            @"subTitle"      : self.subTitle,
                                            
                                            
                                            };


    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]-20-|"
                                                                         options:0
                                                                         metrics:nil
                                                                           views: constrantsViewsDictionary]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[subTitle]-20-|"
                                                                options:0
                                                                metrics:nil
                                                                  views: constrantsViewsDictionary]];





    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[title]-5-[subTitle]-10-|"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:constrantsViewsDictionary]];




}

@end
