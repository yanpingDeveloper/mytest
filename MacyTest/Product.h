//
//  Product.h
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Color, Store;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber * pId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * photoThumbURL;
@property (nonatomic, retain) NSString * photoURL;
@property (nonatomic, retain) NSString * productDescription;
@property (nonatomic, retain) NSNumber * regularPrice;
@property (nonatomic, retain) NSNumber * salePrice;
@property (nonatomic, retain) NSSet *productToColor;
@property (nonatomic, retain) Store *productToStore;
@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addProductToColorObject:(Color *)value;
- (void)removeProductToColorObject:(Color *)value;
- (void)addProductToColor:(NSSet *)values;
- (void)removeProductToColor:(NSSet *)values;

@end
