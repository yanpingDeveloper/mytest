//
//  MACYWebViewController.h
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MACYWebViewController : UIViewController

@property(strong, nonatomic) UIWebView  * webView;
@property(strong, nonatomic) NSURL      * url;
@property(strong, nonatomic) NSString   * screenTitle;

-(id)initWithURL:(NSURL *) myURL;
@end
