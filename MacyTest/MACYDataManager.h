//
//  MACYDataManager.h
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "Store.h"
#import "Color.h"

@interface MACYDataManager : NSObject

@property (nonatomic, strong) NSManagedObjectModel          * managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext        * managedObjectContext;
@property (nonatomic, strong) NSManagedObjectContext        * childManagedObjectContext;
@property (nonatomic, strong) NSPersistentStoreCoordinator  * persistentStoreCoordinator ;

@property (nonatomic, strong) NSString * applicationDocumentsDirectory;


+ (id)sharedManager;

// database related methods
- (void) deleteProduct:(Product *)product;
- (void) updateProduct:(Product *)product forKey:(NSString *) key WithValue:(NSString *) value;
- (void) creatProductFromJsonData:(NSDictionary *)jsonResponse;
- (void) performSave;


// web API related Data from mock up
- (NSDictionary *) makeMockProductData;



@end
