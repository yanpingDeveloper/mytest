//
//  MACYImageCache.h
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <Foundation/Foundation.h>

/*this class will provide service call , cache image and return back to MACYImageView */

typedef void (^CompletionHander)(UIImage *img);

@interface MACYImageCache : NSObject<NSURLSessionDelegate>

//+(id) sharedInstance;

//-(UIImage *) imageForKey:(NSString *)key;
//-(void) setImage:(UIImage *)image forKey:(NSString *)key;
//-(void) downloadImageAtURL:(NSURL *)url completionHander:(CompletionHander) completion;
//-(void) downloadImageAtPath:(NSString *)url completionHander:(CompletionHander) completion;

@end



