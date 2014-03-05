//
//  MACYProductDetailViewController.h
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MACYProductDetailCell.h"
#import "MACYProductDetailHeader.h"
#import "MACYImageDetailViewController.h"
#import "MACYProductButtonCell.h"


@interface MACYProductDetailViewController : UITableViewController<ProductDetailDelegate>

- (id)initWithProduct:(Product *)detailProduct;

@end
