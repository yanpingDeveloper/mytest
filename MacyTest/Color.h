//
//  Colors.h
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface Color : NSManagedObject

@property (nonatomic, retain) NSNumber * alpha;
@property (nonatomic, retain) NSNumber * red;
@property (nonatomic, retain) NSNumber * green;
@property (nonatomic, retain) NSNumber * blue;
@property (nonatomic, retain) Product *colorToProduct;

@end
