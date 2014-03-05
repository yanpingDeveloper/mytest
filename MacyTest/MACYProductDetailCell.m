//
//  MACYProductDetailCell.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYProductDetailCell.h"


@implementation MACYProductDetailCell{
    NSString * imageURL;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //item Image view
        self.itemImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.itemImage.contentMode = UIViewContentModeScaleAspectFill;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
        [self.itemImage addGestureRecognizer:singleTap];
        [self.itemImage setMultipleTouchEnabled:YES];
        [self.itemImage setUserInteractionEnabled:YES];
        
        [self.contentView addSubview:self.itemImage];
        
        self.itemName = [UILabel composeLabel:@"" isTitle:NO];
        [self.contentView addSubview:self.itemName];
        
        
        self.itemPrice = [UILabel composeLabel:@"" isTitle:NO];
        [self.contentView addSubview:self.itemPrice];
        
        self.itemSalePrice = [UILabel composeLabel:@"" isTitle:NO];
        [self.contentView addSubview:self.itemSalePrice];
        
        self.itemImage.translatesAutoresizingMaskIntoConstraints = NO;
        self.itemName.translatesAutoresizingMaskIntoConstraints = NO;
        self.itemPrice.translatesAutoresizingMaskIntoConstraints = NO;
        self.itemSalePrice.translatesAutoresizingMaskIntoConstraints = NO;
        [self updateConstraints];
        
        
    }
    return self;
}

-(void)updateConstraints{
    
    
    [super updateConstraints];
    [self.contentView removeConstraints:self.contentView.constraints];
    
    NSDictionary *constrantsViewsDictionary = @{
                                                @"itemImage"     : self.itemImage,
                                                @"itemName"      : self.itemName,
                                                @"itemPrice"     : self.itemPrice,
                                                @"itemSalePrice" : self.itemSalePrice,
                                                
                                                };
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[itemImage(==50)]-15-[itemName]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views: constrantsViewsDictionary]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[itemImage(==50)]-15-[itemPrice]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views: constrantsViewsDictionary]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[itemImage(==50)]-15-[itemSalePrice]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views: constrantsViewsDictionary]];
    
    
    
    
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[itemImage(==50)]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:constrantsViewsDictionary]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[itemName]-5-[itemPrice]-5-[itemSalePrice]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:constrantsViewsDictionary]];
    
    
}

- (void)assignByProduct:(Product *)info{
    
    self.itemName.text = [NSString stringWithFormat:@"AvailableColor: %d", [info.productToColor count]];
    ;
    self.itemPrice.text = [NSString stringWithFormat:@"Price: $%.02f", [info.regularPrice floatValue]];
    
    self.itemSalePrice.text = [NSString stringWithFormat:@"Price: $%.02f", [info.salePrice floatValue]];
    
    self.itemImage.image = [UIImage imageNamed:info.photoURL];
    
   // imageURL

    
}
#pragma help method

- (float)cellHeight {
    return kActionViewHeight;
}

#pragma get tap event from imageView

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    NSLog(@"image tap event\n");
    if ([self.delegate respondsToSelector:@selector(productDetail: tappedOnImageView:)])
    [self.delegate productDetail:self tappedOnImageView:self.itemImage.image];
}
@end
