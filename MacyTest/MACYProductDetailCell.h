//
//  MACYProductDetailCell.h
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@protocol ProductDetailDelegate;

@interface MACYProductDetailCell : UITableViewCell

@property(nonatomic) UIImageView * itemImage;
@property(nonatomic) UILabel * itemName;
@property(nonatomic) UILabel * itemPrice;
@property(nonatomic) UILabel * itemSalePrice;
@property(nonatomic,weak) id <ProductDetailDelegate> delegate;

- (void)assignByProduct:(Product *)info;
- (float)cellHeight;

@end

@protocol ProductDetailDelegate <NSObject>

-(void)productDetail:(MACYProductDetailCell *)detailCell tappedOnImageView:(UIImage *)image;

@end