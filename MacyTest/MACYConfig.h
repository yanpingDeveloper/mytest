//
//  MACYConfig.h
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#ifndef MacyTest_MACYConfig_h
#define MacyTest_MACYConfig_h



#define kScreenWidth ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define kScreenHeight ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define kActionViewHeight        80
#define kScreenPadding           20
#define kScreenStarting          60

#define kProductID              @"pId"
#define kProductName            @"name"
#define kProductPhotoThumbURL   @"photoThumbURL"
#define kProductPhotoURL        @"photoURL"
#define kProductDescription     @"productDescription"
#define kProductRegularPrice    @"regularPrice"
#define kProductSalePrice       @"salePrice"
#define kProductColors          @"colors"
#define kProductStore           @"store"

#define kColorRed               @"red"
#define kColorGreen             @"green"
#define kColorBlue              @"blue"
#define kColorAlpha             @"alpha"


#define productNameArray        [NSArray arrayWithObjects:@"shoe", @"cloth",@"hat", @"bag" , nil]


typedef enum {
    
    MACYProductDetailCellType,
    MACYProductButtonCellType,
    
} MACYProductDetailCellsType;

#endif
