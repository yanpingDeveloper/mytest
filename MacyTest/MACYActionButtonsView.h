//
//  MACYActionButtonsView.h
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^buttonClickBlock)();

@interface MACYActionButtonsView : UIView

@property (nonatomic) UIButton * buttonCreateProduct;
@property (nonatomic) UIButton * buttonShowProduct;
@property (nonatomic, copy) buttonClickBlock createProductBlock;
@property (nonatomic, copy) buttonClickBlock showProductBlock;


- (id) initWithFrame:(CGRect)frame createProductBlock:(buttonClickBlock) createProductButtonBlock showProductBlock:(buttonClickBlock) showProductButtonBlock;

@end
