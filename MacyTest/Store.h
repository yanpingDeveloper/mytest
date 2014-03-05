//
//  Store.h
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface Store : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *storeToProduct;
@end

@interface Store (CoreDataGeneratedAccessors)

- (void)addStoreToProductObject:(Product *)value;
- (void)removeStoreToProductObject:(Product *)value;
- (void)addStoreToProduct:(NSSet *)values;
- (void)removeStoreToProduct:(NSSet *)values;

@end
