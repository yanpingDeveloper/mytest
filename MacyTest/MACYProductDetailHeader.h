//
//  MACYProductDetailHeader.h
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MACYProductDetailHeader : UIView

@property(nonatomic) UILabel * title;
@property(nonatomic) UILabel * subTitle;


- (id)initWithFrame:(CGRect)frame Title:(NSString *)title andSubTitle:(NSString *)subTitle;

@end
