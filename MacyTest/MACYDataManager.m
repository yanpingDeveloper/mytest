//
//  MACYDataManager.m
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYDataManager.h"

@implementation MACYDataManager

+ (id)sharedManager {
    
    static MACYDataManager* sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
    
}

- (NSManagedObjectContext *) managedObjectContext {
    
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return _managedObjectContext;
}

- (NSManagedObjectContext *) childManagedObjectContext {
    
    if (_childManagedObjectContext != nil) {
        return _childManagedObjectContext;
    }
    
    _childManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    _childManagedObjectContext.parentContext = _managedObjectContext;
    
    return _childManagedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"Model.sqlite"]];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                   initWithManagedObjectModel:[self managedObjectModel]];
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil URL:storeUrl options:nil error:&error]) {
        /*Error for store creation should be handled in here*/
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _managedObjectModel;
}


- (NSString *)applicationDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


- (NSNumber *)nextProductInfoUID
{
	NSPersistentStoreCoordinator * psc = [self persistentStoreCoordinator];
    
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Model.sqlite"]];
    
	id pStore = [psc persistentStoreForURL: storeUrl];
    
	if (pStore) {
		NSMutableDictionary * metadata = [[psc metadataForPersistentStore:pStore] mutableCopy];
		NSNumber * nextID = [metadata objectForKey:@"NextUnusedProductInfoUID"];
		if (!nextID) {
			nextID = [NSNumber numberWithInt:[[self maxExistingProductInfoUID] intValue] + 1];
		}
		;
		[metadata setObject:[NSNumber numberWithInt:[nextID intValue] + 1] forKey:@"NextUnusedProductInfoUID"];
		[psc setMetadata:metadata forPersistentStore:pStore];
		return nextID ;
	}
    else
	{
		return [NSNumber numberWithInt:[[self maxExistingProductInfoUID] intValue] + 1];
	}
}

- (NSNumber *)maxExistingProductInfoUID
{
	NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:[self childManagedObjectContext] ];
	NSFetchRequest * request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"pId" ascending:NO];
	[request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	
	NSArray * allItems = [[self childManagedObjectContext] executeFetchRequest:request error:nil];
	NSNumber * pId = [NSNumber numberWithInt:0];
	if (allItems && [allItems count] > 0) {
		pId = [[allItems objectAtIndex:0] valueForKey:@"pId"];
	}
	return pId;
}

- (void) deleteProduct:(Product *)product{
    
    [self.managedObjectContext deleteObject:product];
    [self performSave];
    
}


- (void) updateProduct:(Product *)product forKey:(NSString *) key WithValue:(NSString *) value{

    NSArray *availableKeys = [[product.entity attributesByName] allKeys];
   
    if ([availableKeys containsObject:key]) {
    
        [product setValue:value forKey:key];
        [self performSave];
    }
    
}
- (void) performSave{
    
    [_managedObjectContext performBlock:^{
        NSError *error;
        if (![_managedObjectContext save:&error])
        {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }];

}
- (void) performChildSave{
    
    [_childManagedObjectContext performBlock:^{
        
        NSError *error;
        if (![_childManagedObjectContext save:&error])
        {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
        // save parent to disk asynchronously
        [self performSave];
    }];

}

#pragma web API
//mock data to return a response
- (NSDictionary *) makeMockProductData{
    
    int index = arc4random() % 3;
   
    NSString *productImageName = [NSString stringWithFormat:@"product_%d.png", index];
    //NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
    
    NSNumber *regularPrice = [NSNumber numberWithFloat:arc4random() % 2+ 4.5];
    NSNumber *salePrice = [NSNumber numberWithFloat: [regularPrice floatValue] - 1];
    
    NSDictionary *colorData = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:100.f], @"red",
                               [NSNumber numberWithFloat:24.f], @"green",
                               [NSNumber numberWithFloat:23.f], @"blue",
                               [NSNumber numberWithFloat:1.f], @"alpha", nil];
    
    NSDictionary *color = [NSDictionary dictionaryWithObject:colorData forKey:@"Color"];
    
    NSDictionary *colorDataOne = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:100.f], @"Red",
                               [NSNumber numberWithFloat:24.f], @"Green",
                               [NSNumber numberWithFloat:25.f], @"Blue",
                               [NSNumber numberWithFloat:1.f], @"Alpha", nil];
    
    NSDictionary *colorOne = [NSDictionary dictionaryWithObject:colorDataOne forKey:@"Color"];

    NSArray * colors= [NSArray arrayWithObjects:color,colorOne,nil];
    
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithInteger:index], kProductID,
                                 productNameArray[index], kProductName,
                                 productImageName, kProductPhotoURL,
                                 @"production description", kProductDescription,
                                 regularPrice , kProductRegularPrice,
                                 salePrice, kProductSalePrice,
                                 colors, kProductColors,
                                 
                                 nil];
    
    // Convert object to data
    NSError *error = NULL;
    
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:json
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
    NSError* errorParsing;
    
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&errorParsing];
    return response;
    

}

- (void) creatProductFromJsonData:(NSDictionary *)jsonResponse{
    
    NSManagedObjectContext * context = [[MACYDataManager sharedManager] childManagedObjectContext];
    Product *generatedProduct = (Product *)[NSEntityDescription
                                            insertNewObjectForEntityForName:@"Product"
                                            inManagedObjectContext:context];
    
    NSMutableSet * colorSet =[[NSMutableSet alloc]init];
    
    for (NSString * key in [jsonResponse allKeys]){
        
        if (![key isEqualToString:kProductColors]){
            
            if([jsonResponse objectForKey:key]){
                
                [generatedProduct setValue:[jsonResponse objectForKey:key] forKey:key];
            }
            
        }
        else{
            
           
            NSArray * colorArray = [jsonResponse objectForKey:key];
            
            for (NSDictionary * dic in colorArray){
            
                Color * currentColor  = (Color*)[NSEntityDescription
                                                    insertNewObjectForEntityForName:@"Color"
                                                    inManagedObjectContext:context];
                NSDictionary *colorDic = [dic objectForKey:@"Color"];
                
                for(NSString *key in [colorDic allKeys]){
                    
                    [currentColor setValue:[dic objectForKey:key] forKey:key];
                    
                    
                }
                [colorSet addObject:currentColor];
                
            }
            
        }
    }
    generatedProduct.pId = [self nextProductInfoUID];
    generatedProduct.productToColor = colorSet;
        
    [self performChildSave];
   
}



@end
