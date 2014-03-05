//
//  MACYWebViewController.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYWebViewController.h"

@interface MACYWebViewController ()

@end

@implementation MACYWebViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.webView.scalesPageToFit = YES;
        [self.view addSubview:self.webView];
        
    }
    return self;
}

-(id)initWithURL:(NSURL *) myURL{
    
    if ([self init]){
        _url = myURL;
        return self;
    }
    else
        return nil;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

-(void)viewWillAppear:(BOOL)animated{
    self.title = self.screenTitle;
    @autoreleasepool {
        
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:_url];
        [_webView loadRequest:requestObj];
        
    }
    
}
-(void) viewWillDisappear:(BOOL)animated{
    if (self.isMovingFromParentViewController) {
        
        [self.webView loadHTMLString: @"" baseURL: nil];
        [self.webView removeFromSuperview];
        self.webView = nil;
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

